-- sql/final_objects.sql
USE civicpay;

-- ================================
-- FUNCTIONS
-- ================================
DROP FUNCTION IF EXISTS TotalOutstanding;
DELIMITER //
CREATE FUNCTION TotalOutstanding(citizen INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT IFNULL(SUM(amount),0) INTO total
    FROM bills
    WHERE citizen_id = citizen
      AND payment_date IS NULL;
    RETURN total;
END//
DELIMITER ;

-- SELECT TotalOutstanding(4);

DROP FUNCTION IF EXISTS LastPaymentDate;
DELIMITER //
CREATE FUNCTION LastPaymentDate(citizen INT)
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE lastPaid DATE;
    SELECT MAX(payment_date) INTO lastPaid
    FROM bills
    WHERE citizen_id = citizen;
    RETURN lastPaid;
END//
DELIMITER ;

-- SELECT LastPaymentDate(15);

-- ================================
-- PROCEDURES
-- ================================
DROP PROCEDURE IF EXISTS GetUnpaidBills;
DELIMITER //
CREATE PROCEDURE GetUnpaidBills(IN citizen INT)
BEGIN
    SELECT 
        b.bill_id, b.bill_type, b.amount, b.units_used,
        b.issue_date, b.due_date, b.payment_date, b.property_id,
        p.address, p.property_type
    FROM bills b
    JOIN property p ON p.property_id = b.property_id
    WHERE b.citizen_id = citizen
      AND b.payment_date IS NULL
    ORDER BY b.due_date ASC, b.bill_id ASC;
END//
DELIMITER ;

-- CALL GetUnpaidBills(1);

DROP PROCEDURE IF EXISTS PayBill;
DELIMITER //
CREATE PROCEDURE PayBill(IN billId INT, IN methodId INT)
BEGIN
    UPDATE bills
       SET payment_date = CURDATE(),
           method_id    = methodId
     WHERE bill_id = billId;
END//
DELIMITER ;

-- CALL PayBill(7, 4);

DROP PROCEDURE IF EXISTS TopUpFastag;
DELIMITER //
CREATE PROCEDURE TopUpFastag(IN f_id INT, IN amt DECIMAL(10,2))
BEGIN
    UPDATE fastag
       SET balance = balance + amt
     WHERE fastag_id = f_id;
END//
DELIMITER ;

-- CALL TopUpFastag(6, 500);

-- ================================
-- VIEWS
-- ================================
DROP VIEW IF EXISTS BillHistory;
CREATE OR REPLACE VIEW BillHistory AS
SELECT 
    b.bill_id,
    b.citizen_id,
    c.name AS citizen_name,
    b.bill_type,
    b.amount,
    b.issue_date,
    b.payment_date,
    pm.method_name
FROM bills b
JOIN citizen c ON b.citizen_id = c.citizen_id
LEFT JOIN payment_method pm ON pm.method_id = b.method_id;

-- SELECT * FROM BillHistory;

-- DELIMITER //
-- CREATE TRIGGER check_outstanding_limit
-- BEFORE INSERT ON bills
-- FOR EACH ROW
-- BEGIN
--     DECLARE total_outstanding DECIMAL(10,2);

--     -- Calculate unpaid total (payment_date IS NULL)
--     SELECT IFNULL(SUM(amount), 0)
--     INTO total_outstanding
--     FROM bills
--     WHERE citizen_id = NEW.citizen_id
--       AND payment_date IS NULL;

--     -- Add the new bill
--     SET total_outstanding = total_outstanding + NEW.amount;

--     -- Check the limit
--     IF total_outstanding > 20000 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Error: Total outstanding exceeds ₹20,000 limit for this citizen.';
--     END IF;
-- END;
-- //

-- INSERT INTO bills (bill_id, citizen_id, property_id, bill_type, units_used, amount, issue_date, due_date, method_id, payment_date) VALUES
-- -- Citizen 1: Properties 1–2
-- (250, 1, 1, 'water', 20.5, 20000.00, '2025-05-05', '2025-05-25', 2, NULL);
