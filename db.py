# db.py
import os
import mysql.connector
from mysql.connector import pooling

DB_CONFIG = {
    "host":     os.getenv("DB_HOST", "localhost"),
    "port":     int(os.getenv("DB_PORT", "3306")),
    "user":     os.getenv("DB_USER", "root"),
    "password": os.getenv("DB_PASS", "ombansal"),
    "database": os.getenv("DB_NAME", "civicpay"),
}

_pool = pooling.MySQLConnectionPool(
    pool_name="civicpay_pool",
    pool_size=5,
    **DB_CONFIG
)

def get_conn():
    return _pool.get_connection()

def query_all(sql, params=None):
    """
    Run a SELECT (or CALL ... if you prefer raw) and return rows as dicts.
    Safely consumes extra result sets to avoid 'Unread result found'.
    """
    with get_conn() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(sql, params or ())
            rows = cur.fetchall()
            # consume remaining result sets, if any (important after CALL ... syntax)
            while True:
                try:
                    more = cur.nextset()
                except mysql.connector.errors.InterfaceError:
                    break
                if not more:
                    break
                try:
                    _ = cur.fetchall()
                except mysql.connector.errors.InterfaceError:
                    pass
            return rows

def query_one(sql, params=None):
    rows = query_all(sql, params)
    return rows[0] if rows else None

def execute(sql, params=None):
    """
    Execute a non-SELECT statement and commit.
    """
    with get_conn() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params or ())
            conn.commit()
            return cur.lastrowid

def call_proc(proc_name, args=()):
    """
    Call a stored procedure that RETURNS a result set.
    Uses cursor.callproc and collects result sets from stored_results().
    """
    with get_conn() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.callproc(proc_name, args)
            results = []
            for result in cur.stored_results():
                results.extend(result.fetchall())
            # no commit needed for read-only procedures
            return results

def exec_proc(proc_name, args=()):
    """
    Call a stored procedure that performs an UPDATE/INSERT/DELETE (no result set).
    Safely consumes any result sets and commits.
    """
    with get_conn() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.callproc(proc_name, args)
            # consume any result sets just in case the proc SELECTs something
            for _ in cur.stored_results():
                _.fetchall()
            conn.commit()
            return True