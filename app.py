# app.py
import os
from datetime import date
from collections import OrderedDict

from flask import Flask, render_template, request, redirect, url_for, session, flash, abort
from dotenv import load_dotenv
from db import query_one, query_all, execute, call_proc, exec_proc

load_dotenv()

app = Flask(__name__, static_folder="static", template_folder="templates")
app.secret_key = os.getenv("FLASK_SECRET", "change-me-please")

# ---------------- helpers -----------------
def login_required(fn):
    from functools import wraps
    @wraps(fn)
    def wrapper(*args, **kwargs):
        if "user_id" not in session or "citizen_id" not in session:
            return redirect(url_for("login"))
        return fn(*args, **kwargs)
    return wrapper

def get_or_create_error_type(code, description):
    row = query_one("SELECT error_type_id FROM error_type WHERE error_code=%s", (code,))
    if row:
        return row["error_type_id"]
    new_id = execute(
        "INSERT INTO error_type (error_code, description) VALUES (%s,%s)",
        (code, description)
    )
    return new_id

def log_error(code, desc, citizen_id=None):
    et_id = get_or_create_error_type(code, desc)
    execute("INSERT INTO error_log (error_type_id, citizen_id) VALUES (%s,%s)", (et_id, citizen_id))

# ---------------- auth --------------------
@app.route("/", methods=["GET"])
def root():
    return redirect(url_for("dashboard") if "user_id" in session else url_for("login"))

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        try:
            user_id = request.form.get("user_id", "").strip()
            password = request.form.get("password", "").strip()

            # Join to citizen to fetch display name for username in session
            row = query_one(
                """
                SELECT u.user_id, u.password, u.citizen_id, c.name AS username
                FROM user u
                LEFT JOIN citizen c ON c.citizen_id = u.citizen_id
                WHERE u.user_id=%s AND u.password=%s
                """,
                (user_id, password)
            )
            if row:
                session["user_id"] = row["user_id"]
                session["citizen_id"] = row["citizen_id"]
                session["username"] = row.get("username") or f"User {row['user_id']}"
                return redirect(url_for("dashboard"))
            else:
                flash("Invalid user ID or password.", "error")
                log_error("AUTH_INVALID", "Invalid username or password", None)
        except Exception as e:
            flash("Unexpected error during login.", "error")
            log_error("AUTH_EXCEPTION", f"Login exception: {e}", None)
    return render_template("login.html")

@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("login"))

# ---------------- dashboard ----------------
@app.route("/dashboard")
@login_required
def dashboard():
    citizen_id = session["citizen_id"]

    # KPI 1: Total outstanding via SQL FUNCTION
    total_row = query_one("SELECT TotalOutstanding(%s) AS total", (citizen_id,))
    total_outstanding = float(total_row["total"] or 0)

    # Pull all UNPAID bills via stored procedure (includes address & property info)
    pending_rows = call_proc("GetUnpaidBills", (citizen_id,))

    # ---- FIX: Next Due Date = nearest upcoming (strictly future relative to today) ----
    today = date.today()
    upcoming_dates = [
        r["due_date"] for r in pending_rows
        if r.get("due_date") is not None and r["due_date"] > today
    ]
    next_due = min(upcoming_dates) if upcoming_dates else None

    # Sort & group UNPAID by property
    # We’ll sort by property_id, then due_date
    def pending_sort_key(r):
        # if due_date is None, push it to the end by using a large sentinel
        dd = r["due_date"] if r.get("due_date") else date(9999, 12, 31)
        return (r.get("property_id") or 0, dd)

    pending_sorted = sorted(pending_rows, key=pending_sort_key)

    grouped_pending = OrderedDict()
    for r in pending_sorted:
        prop_id = r.get("property_id")
        prop_label = f"{r.get('property_type', 'Property')} — {r.get('address', '')}"
        group_key = (prop_id, prop_label)
        if group_key not in grouped_pending:
            grouped_pending[group_key] = []
        grouped_pending[group_key].append(r)

    # Pull PAID bills owner-aware (property join). Sort by property, then due_date (for consistent display).
    paid_rows = query_all("""
        SELECT b.*, p.property_type, p.address, p.property_id
          FROM bills b
          JOIN property p ON p.property_id = b.property_id
         WHERE p.citizen_id=%s
           AND b.payment_date IS NOT NULL
         ORDER BY p.property_id ASC, b.due_date ASC
    """, (citizen_id,))

    def paid_sort_key(r):
        dd = r["due_date"] if r.get("due_date") else date(9999, 12, 31)
        return (r.get("property_id") or 0, dd)

    paid_sorted = sorted(paid_rows, key=paid_sort_key)

    grouped_paid = OrderedDict()
    for r in paid_sorted:
        prop_id = r.get("property_id")
        prop_label = f"{r.get('property_type', 'Property')} — {r.get('address', '')}"
        group_key = (prop_id, prop_label)
        if group_key not in grouped_paid:
            grouped_paid[group_key] = []
        grouped_paid[group_key].append(r)

    # By-property summary (unchanged)
    by_property = query_all("""
        SELECT 
            p.property_id, p.property_type, p.address,
            SUM(CASE WHEN b.payment_date IS NULL THEN b.amount ELSE 0 END) AS pending_amount,
            COUNT(CASE WHEN b.payment_date IS NULL THEN 1 END) AS pending_count,
            COUNT(CASE WHEN b.payment_date IS NOT NULL THEN 1 END) AS paid_count
        FROM property p
        LEFT JOIN bills b ON b.property_id=p.property_id
        WHERE p.citizen_id=%s
        GROUP BY p.property_id, p.property_type, p.address
        ORDER BY p.property_id
    """, (citizen_id,))

    summary = {
        "total_outstanding": total_outstanding,
        "pending_count": len(pending_rows),
        "next_due": next_due
    }

    return render_template(
        "dashboard.html",
        username=session.get("username"),
        summary=summary,
        grouped_pending=grouped_pending,  # { (property_id, "Type — Address"): [rows...] }
        grouped_paid=grouped_paid,        # same structure
        by_property=by_property
    )

# ---------------- pay flow ----------------
@app.route("/pay/<int:bill_id>", methods=["GET", "POST"])
@login_required
def pay_bill(bill_id):
    # Verify ownership via property
    bill = query_one("""
        SELECT b.*, p.property_id, p.citizen_id AS owner_citizen_id, p.property_type, p.address
          FROM bills b
          JOIN property p ON p.property_id = b.property_id
         WHERE b.bill_id=%s
    """, (bill_id,))
    if not bill or bill["owner_citizen_id"] != session["citizen_id"]:
        abort(403)

    if request.method == "POST":
        try:
            method_id = int(request.form.get("method_id"))
            exec_proc("PayBill", (bill_id, method_id))
            return redirect(url_for("payment_success", bill_id=bill_id))
        except Exception as e:
            flash("Payment failed. Please try again.", "error")
            log_error("PAYMENT_EXCEPTION", f"Payment exception: {e}", session.get("citizen_id"))
            return redirect(url_for("dashboard"))

    methods = query_all("SELECT method_id, method_name FROM payment_method ORDER BY method_id")
    return render_template("pay.html", bill=bill, methods=methods)

@app.route("/payment-success/<int:bill_id>")
@login_required
def payment_success(bill_id):
    row = query_one("""
        SELECT b.bill_id, b.amount, b.bill_type, b.payment_date,
               pm.method_name, p.property_id, p.property_type, p.address
          FROM bills b
          JOIN property p ON p.property_id = b.property_id
          LEFT JOIN payment_method pm ON pm.method_id = b.method_id
         WHERE b.bill_id=%s
    """, (bill_id,))
    if not row:
        abort(404)
    return render_template("payment_success.html", info=row)

# ---------------- fastag -----------------
@app.route("/fastag", methods=["GET", "POST"])
@login_required
def fastag():
    citizen_id = session["citizen_id"]

    if request.method == "POST":
        try:
            fastag_id = int(request.form.get("fastag_id"))
            amount = float(request.form.get("amount"))
            row = query_one("SELECT citizen_id FROM fastag WHERE fastag_id=%s", (fastag_id,))
            if not row or row["citizen_id"] != citizen_id:
                abort(403)
            exec_proc("TopUpFastag", (fastag_id, amount))
            return redirect(url_for("fastag"))
        except Exception as e:
            flash("Top up failed.", "error")
            log_error("FASTAG_TOPUP_EXCEPTION", f"Topup exception: {e}", citizen_id)

    tags = query_all("SELECT * FROM fastag WHERE citizen_id=%s ORDER BY fastag_id", (citizen_id,))
    total = sum(float(t["balance"]) for t in tags) if tags else 0.0
    return render_template("fastag.html", tags=tags, total=total, count=len(tags))

# ---------------- feedback ----------------
@app.route("/feedback", methods=["GET", "POST"])
@login_required
def feedback():
    citizen_id = session["citizen_id"]
    if request.method == "POST":
        try:
            rating = int(request.form.get("rating"))
            comment = request.form.get("comment") or ""
            execute(
                "INSERT INTO feedback (feedback_id, citizen_id, rating, comment, feedback_date) "
                "VALUES (%s, %s, %s, %s, %s)",
                (None, citizen_id, rating, comment, date.today())
            )
            return redirect(url_for("feedback"))
        except Exception as e:
            flash("Could not submit feedback.", "error")
            log_error("FEEDBACK_EXCEPTION", f"Feedback exception: {e}", citizen_id)

    history = query_all("""
        SELECT rating, comment, feedback_date 
          FROM feedback 
         WHERE citizen_id=%s 
         ORDER BY feedback_date DESC
    """, (citizen_id,))
    return render_template("feedback.html", history=history)

# ---------------- run --------------------
if __name__ == "__main__":
    app.run(debug=True)
