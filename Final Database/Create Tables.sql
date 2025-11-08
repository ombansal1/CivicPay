CREATE DATABASE civicpay;
USE civicpay;

-- ⿢ citizen table
CREATE TABLE citizen (
    citizen_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    phone VARCHAR(15),
    email VARCHAR(100)
);

-- ⿡ user table
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    citizen_id INT,
    FOREIGN KEY (citizen_id) REFERENCES citizen(citizen_id)
);

-- ⿣ department table
CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    head_name VARCHAR(100)
);

-- ⿤ staff table
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_id INT,
    staff_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50),
    phone VARCHAR(15),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- ⿥ property table
CREATE TABLE property (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT,
    property_type VARCHAR(50),
    address VARCHAR(255),
    FOREIGN KEY (citizen_id) REFERENCES citizen(citizen_id)
);

-- ⿦ payment_method table
CREATE TABLE payment_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50)
);

-- ⿧ error_type table
CREATE TABLE error_type (
    error_type_id INT AUTO_INCREMENT PRIMARY KEY,
    error_code VARCHAR(50),
    description VARCHAR(255)
);

-- ⿨ vehicle table
CREATE TABLE vehicle (
    vehicle_number VARCHAR(15) PRIMARY KEY,
    citizen_id INT,
    FOREIGN KEY (citizen_id) REFERENCES citizen(citizen_id)
);

-- ⿩ bills table
CREATE TABLE bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT,
    property_id INT,
    units_used DECIMAL(10,2),
    amount DECIMAL(10,2),
    issue_date DATE,
    due_date DATE,
    method_id INT,
    payment_date DATE,
    bill_type varchar(20),
    FOREIGN KEY (citizen_id) REFERENCES citizen(citizen_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (method_id) REFERENCES payment_method(method_id)
);

-- 🔟 fastag table
CREATE TABLE fastag (
    fastag_id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT,
    vehicle_number VARCHAR(15),
    balance DECIMAL(10,2),
    FOREIGN KEY (citizen_id) REFERENCES citizen(citizen_id),
    FOREIGN KEY (vehicle_number) REFERENCES vehicle(vehicle_number)
);

-- ⿡⿡ feedback table
CREATE TABLE feedback (
	feedback_id INT,
    citizen_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(255),
    feedback_date DATE,
    PRIMARY KEY (citizen_id, feedback_date),
    FOREIGN KEY (citizen_id) REFERENCES citizen(citizen_id)
);

-- ⿡⿢ error_log table
CREATE TABLE error_log (
    error_type_id INT,
    citizen_id INT,
    FOREIGN KEY (error_type_id) REFERENCES error_type(error_type_id),
    FOREIGN KEY (citizen_id) REFERENCES citizen(citizen_id)
);