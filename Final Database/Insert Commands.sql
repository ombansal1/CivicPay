INSERT INTO citizen (citizen_id, name, dob, phone, email)
VALUES
(1, 'Rohit Sharma', '1987-04-30', '9876543210', 'rohit.sharma@example.com'),
(2, 'Priya Patil', '1990-06-15', '9123456780', 'priya.patil@example.com'),
(3, 'Amit Verma', '1985-11-20', '9988776655', 'amit.verma@example.com'),
(4, 'Sneha Kulkarni', '1993-09-05', '9876501234', 'sneha.kulkarni@example.com'),
(5, 'Anil Deshmukh', '1978-01-14', '9812345678', 'anil.deshmukh@example.com'),
(6, 'Meera Joshi', '1995-02-25', '9823456789', 'meera.joshi@example.com'),
(7, 'Raj Singh', '1988-07-12', '9871234567', 'raj.singh@example.com'),
(8, 'Nisha Chavan', '1992-10-10', '9911223344', 'nisha.chavan@example.com'),
(9, 'Vikas Kadam', '1984-08-18', '9809876543', 'vikas.kadam@example.com'),
(10, 'Pooja Gore', '1996-12-30', '9877894561', 'pooja.gore@example.com'),
(11, 'Manoj Bhosale', '1980-03-17', '9998887776', 'manoj.bhosale@example.com'),
(12, 'Kiran Naik', '1991-11-11', '9876543000', 'kiran.naik@example.com'),
(13, 'Deepa Sawant', '1994-03-23', '9123456701', 'deepa.sawant@example.com'),
(14, 'Sunil Pawar', '1982-05-19', '9811112233', 'sunil.pawar@example.com'),
(15, 'Asha Jadhav', '1989-07-25', '9988771122', 'asha.jadhav@example.com'),
(16, 'Gaurav More', '1993-09-09', '9898989898', 'gaurav.more@example.com'),
(17, 'Komal Gaikwad', '1997-02-02', '9876001122', 'komal.gaikwad@example.com'),
(18, 'Ramesh Lokhande', '1975-12-12', '9833445566', 'ramesh.lokhande@example.com'),
(19, 'Sheetal Shinde', '1990-04-04', '9811223344', 'sheetal.shinde@example.com'),
(20, 'Akash Salunkhe', '1995-08-28', '9822001100', 'akash.salunkhe@example.com'),
(21, 'Smita Kamble', '1987-01-30', '9876543201', 'smita.kamble@example.com'),
(22, 'Sagar Phadke', '1986-06-06', '9800123456', 'sagar.phadke@example.com'),
(23, 'Varsha Thakur', '1992-02-14', '9876002200', 'varsha.thakur@example.com'),
(24, 'Ashwin Bhagat', '1984-09-22', '9812340001', 'ashwin.bhagat@example.com'),
(25, 'Neha Raut', '1998-07-07', '9823456700', 'neha.raut@example.com');

INSERT INTO user (user_id, password, citizen_id)
VALUES
(1, 'user123', 1),
(2, 'user123', 2),
(3, 'user123', 3),
(4, 'user123', 4),
(5, 'user123', 5),
(6, 'user123', 6),
(7, 'user123', 7),
(8, 'user123', 8),
(9, 'user123', 9),
(10, 'user123', 10),
(11, 'user123', 11),
(12, 'user123', 12),
(13, 'user123', 13),
(14, 'user123', 14),
(15, 'user123', 15),
(16, 'user123', 16),
(17, 'user123', 17),
(18, 'user123', 18),
(19, 'user123', 19),
(20, 'user123', 20),
(21, 'user123', 21),
(22, 'user123', 22),
(23, 'user123', 23),
(24, 'user123', 24),
(25, 'user123', 25);
-- Admin user (no citizen_id linked)
-- (26, 'admin123', NULL);

INSERT INTO department (dept_id, dept_name, head_name)
VALUES
(1, 'Water Department', 'Anita Sharma'),
(2, 'Electricity Department', 'Suresh Mehta'),
(3, 'Gas Department', 'Ravi Iyer'),
(4, 'Property Tax Department', 'Rajesh Kumar'),
(5, 'FASTag Department', 'Vivek Agarwal');

INSERT INTO staff (staff_id, dept_id, staff_name, designation, phone)
VALUES
-- Water Department (dept_id = 1)
(1, 1, 'Rohit Menon', 'Water Engineer', '9823012345'),
(2, 1, 'Meera Iyer', 'Junior Engineer', '9765432109'),

-- Electricity Department (dept_id = 2)
(3, 2, 'Amit Verma', 'Electrical Inspector', '9345678120'),
(4, 2, 'Kavita Reddy', 'Line Supervisor', '9012345678'),

-- Gas Department (dept_id = 3)
(5, 3, 'Nikhil Sharma', 'Gas Line Technician', '9923456781'),
(6, 3, 'Pallavi Rao', 'Safety Officer', '9876504321'),

-- Property Tax Department (dept_id = 4)
(7, 4, 'Vikram Joshi', 'Tax Officer', '9812345098'),
(8, 4, 'Neha Gupta', 'Clerk', '9123456780'),

-- FASTag Department (dept_id = 5)
(9, 5, 'Sanjay Patil', 'FASTag Manager', '9867012345'),
(10, 5, 'Priya Mishra', 'Customer Executive', '9890123456');

INSERT INTO property (property_id, citizen_id, property_type, address)
VALUES
-- Citizen 1: 2 properties
(1, 1, 'Residential', 'Flat 12A, MG Road, Camp, Pune, Maharashtra'),
(2, 1, 'Commercial', 'Shop 5, Clover Center, MG Road, Pune, Maharashtra'),

-- Citizen 2: 3 properties
(3, 2, 'Residential', 'B-302, FC Road, Shivajinagar, Pune, Maharashtra'),
(4, 2, 'Commercial', 'Office 204, Platinum Plaza, JM Road, Pune, Maharashtra'),
(5, 2, 'Industrial', 'Plot 45, Bhosari MIDC, Pune, Maharashtra'),

-- Citizen 3: 1 property
(6, 3, 'Residential', 'Bungalow No. 7, Laxmi Road, Sadashiv Peth, Pune, Maharashtra'),

-- Citizen 4: 2 properties
(7, 4, 'Residential', 'Flat 4B, Karve Road, Kothrud, Pune, Maharashtra'),
(8, 4, 'Agricultural', 'Survey 22, Near Warje Gaon, Pune, Maharashtra'),

-- Citizen 5: 3 properties
(9, 5, 'Commercial', 'Shop 12, JM Road, Deccan, Pune, Maharashtra'),
(10, 5, 'Industrial', 'Plot 6, Talawade MIDC, Pune, Maharashtra'),
(11, 5, 'Residential', 'B-101, Prabhat Colony, Erandwane, Pune, Maharashtra'),

-- Citizen 6: 2 properties
(12, 6, 'Residential', 'Flat 203, Sinhagad Road, Dhayari, Pune, Maharashtra'),
(13, 6, 'Commercial', 'Office 22, Galaxy Towers, Narhe, Pune, Maharashtra'),

-- Citizen 7: 4 properties
(14, 7, 'Residential', 'Flat 5C, Baner Road, Baner, Pune, Maharashtra'),
(15, 7, 'Commercial', 'Showroom 3, Balewadi High Street, Pune, Maharashtra'),
(16, 7, 'Agricultural', 'Plot 78, Sus Village, Pune, Maharashtra'),
(17, 7, 'Industrial', 'Unit 11, Hinjewadi Phase 2, Pune, Maharashtra'),

-- Citizen 8: 2 properties
(18, 8, 'Residential', 'Row House 8, Aundh Gaon, Aundh, Pune, Maharashtra'),
(19, 8, 'Commercial', 'Shop 2, Westend Mall, Aundh, Pune, Maharashtra'),

-- Citizen 9: 3 properties
(20, 9, 'Residential', 'Flat 403, NIBM Road, Kondhwa, Pune, Maharashtra'),
(21, 9, 'Industrial', 'Plot 9, Kondhwa Industrial Estate, Pune, Maharashtra'),
(22, 9, 'Agricultural', 'Land 23, Near Undri Village, Pune, Maharashtra'),

-- Citizen 10: 2 properties
(23, 10, 'Residential', 'Flat 7A, Bibvewadi Main Road, Pune, Maharashtra'),
(24, 10, 'Commercial', 'Shop 8, Kumar Pacific Mall, Pune, Maharashtra'),

-- Citizen 11: 4 properties
(25, 11, 'Residential', 'Row House 3, Pimpri Main Road, Pimpri-Chinchwad, Maharashtra'),
(26, 11, 'Industrial', 'Plot 22, Chinchwad MIDC, Pimpri-Chinchwad, Maharashtra'),
(27, 11, 'Commercial', 'Shop 4, City One Mall, Pimpri, Maharashtra'),
(28, 11, 'Agricultural', 'Farm 8, Near Nigdi Gaon, Pune, Maharashtra'),

-- Citizen 12: 1 property
(29, 12, 'Residential', 'Flat 301, Chinchwad Station Road, Pune, Maharashtra'),

-- Citizen 13: 2 properties
(30, 13, 'Residential', 'Flat 2A, Wakad Hinjewadi Road, Pune, Maharashtra'),
(31, 13, 'Industrial', 'Plot 14, Rajiv Gandhi Infotech Park, Hinjewadi, Maharashtra'),

-- Citizen 14: 3 properties
(32, 14, 'Residential', 'House 9, Nigdi Pradhikaran, Pune, Maharashtra'),
(33, 14, 'Commercial', 'Office 10, Empire Estate, Pimpri, Maharashtra'),
(34, 14, 'Industrial', 'Plot 5, Talawade MIDC, Pune, Maharashtra'),

-- Citizen 15: 4 properties
(35, 15, 'Residential', 'Bungalow 21, Thergaon Main Road, Pune, Maharashtra'),
(36, 15, 'Agricultural', 'Land 11, Ravet Outskirts, Pune, Maharashtra'),
(37, 15, 'Industrial', 'Plot 77, PCMC Zone, Pune, Maharashtra'),
(38, 15, 'Commercial', 'Shop 15, Premier Plaza, Chinchwad, Pune, Maharashtra'),

-- Citizen 16: 1 property
(39, 16, 'Residential', 'Flat 9C, Hadapsar Industrial Area, Pune, Maharashtra'),

-- Citizen 17: 2 properties
(40, 17, 'Residential', 'Flat 3B, Magarpatta City, Pune, Maharashtra'),
(41, 17, 'Commercial', 'Office 105, Cyber City, Magarpatta, Pune, Maharashtra'),

-- Citizen 18: 3 properties
(42, 18, 'Residential', 'Flat 5A, Kalyani Nagar, Pune, Maharashtra'),
(43, 18, 'Industrial', 'Plot 12, Mundhwa Industrial Zone, Pune, Maharashtra'),
(44, 18, 'Agricultural', 'Farm 9, Lohegaon Outskirts, Pune, Maharashtra'),

-- Citizen 19: 1 property
(45, 19, 'Residential', 'Flat 6C, Viman Nagar Road, Pune, Maharashtra'),

-- Citizen 20: 2 properties
(46, 20, 'Residential', 'House 5, Koregaon Park Lane 5, Pune, Maharashtra'),
(47, 20, 'Commercial', 'Shop 1, Lane 7, Koregaon Park, Pune, Maharashtra'),

-- Citizen 21: 2 properties
(48, 21, 'Residential', 'Flat 2B, Warje Malwadi Road, Pune, Maharashtra'),
(49, 21, 'Agricultural', 'Land 4, Near Bavdhan Village, Pune, Maharashtra'),

-- Citizen 22: 1 property
(50, 22, 'Residential', 'Flat 8C, Bavdhan Main Road, Pune, Maharashtra'),

-- Citizen 23: 3 properties
(51, 23, 'Residential', 'Flat 402, Balewadi High Street, Pune, Maharashtra'),
(52, 23, 'Commercial', 'Shop 9, Baner-Balewadi Link Road, Pune, Maharashtra'),
(53, 23, 'Industrial', 'Plot 15, Hinjewadi Phase 3, Pune, Maharashtra'),

-- Citizen 24: 2 properties
(54, 24, 'Residential', 'Flat 202, Pashan Sus Road, Pune, Maharashtra'),
(55, 24, 'Agricultural', 'Farm 6, Sus Village, Pune, Maharashtra'),

-- Citizen 25: 3 properties
(56, 25, 'Residential', 'Bungalow 10, Hinjewadi Phase 1 Road, Pune, Maharashtra'),
(57, 25, 'Commercial', 'Office 3A, Blue Ridge IT Park, Hinjewadi, Pune, Maharashtra'),
(58, 25, 'Industrial', 'Plot 9, MIDC Phase 2, Pimpri-Chinchwad, Maharashtra');

INSERT INTO payment_method (method_id, method_name)
VALUES
(1, 'Cash'),
(2, 'UPI'),
(3, 'Credit Card'),
(4, 'Debit Card'),
(5, 'Net Banking');

INSERT INTO error_type (error_type_id, error_code, description)
VALUES
(1, 'AUTH_FAIL', 'Invalid username or password entered by user.'),
(2, 'SESSION_TIMEOUT', 'User session expired due to inactivity.'),
(3, 'ACCESS_DENIED', 'Unauthorized access attempt to restricted module.'),
(4, 'DB_CONN_FAIL', 'Database connection failed during transaction.'),
(5, 'DATA_NOT_FOUND', 'Requested record or data entry not found in database.'),
(6, 'VALIDATION_ERROR', 'Invalid or missing form input fields during submission.'),
(7, 'PAYMENT_FAIL', 'Payment transaction failed or was declined by gateway.'),
(8, 'BILL_NOT_GENERATED', 'Bill generation failed due to missing data or calculation error.'),
(9, 'DUPLICATE_ENTRY', 'Duplicate record detected while inserting new data.'),
(10, 'SERVER_ERROR', 'Unexpected internal server error occurred.'),
(11, 'API_TIMEOUT', 'External API request (e.g., payment gateway) timed out.'),
(12, 'NETWORK_ERROR', 'Network connectivity issue encountered during operation.'),
(13, 'INSUFFICIENT_BALANCE', 'FASTag or payment account has insufficient funds.'),
(14, 'INVALID_INPUT_FORMAT', 'Input data does not match required format (e.g., date, email).'),
(15, 'UNKNOWN_ERROR', 'Unidentified or unexpected system error occurred.');

INSERT INTO vehicle (vehicle_number, citizen_id) VALUES
('MH12AB1234', 1),
('MH12CD5678', 1),
('MH12EF9012', 2),
('MH12GH3456', 3),
('MH12JK7890', 3),
('MH12LM1122', 4),
('MH12NP3344', 5),
('MH12QR5566', 5),
('MH12ST7788', 5),
('MH12UV9900', 6),
('MH12WX2233', 7),
('MH12YZ4455', 7),
('MH12AA6677', 8),
('MH12BB8899', 9),
('MH12CC1011', 9),
('MH12DD1213', 10),
('MH12EE1415', 11),
('MH12FF1617', 11),
('MH12GG1819', 12),
('MH12HH2021', 13),
('MH12II2223', 13),
('MH12JJ2425', 13),
('MH12KK2627', 14),
('MH12LL2829', 15),
('MH12MM3031', 15),
('MH12NN3233', 16),
('MH12OO3435', 17),
('MH12PP3637', 17),
('MH12QQ3839', 18),
('MH12RR4041', 19),
('MH12SS4243', 20),
('MH12TT4445', 20),
('MH12UU4647', 21),
('MH12VV4849', 22),
('MH12WW5051', 23),
('MH12XX5253', 23),
('MH12YY5455', 24),
('MH12ZZ5657', 25),
('MH12AA5859', 25);

INSERT INTO bills (bill_id, citizen_id, property_id, bill_type, units_used, amount, issue_date, due_date, method_id, payment_date) VALUES
-- Citizen 1: Properties 1–2
(1, 1, 1, 'water', 20.5, 920.00, '2025-05-05', '2025-05-25', 2, NULL),
(2, 1, 1, 'electricity', 180.0, 2800.00, '2025-05-05', '2025-05-28', 3, '2025-05-20'),
(3, 1, 1, 'gas', 12.0, 850.00, '2025-05-05', '2025-06-02', 1, NULL),
(4, 1, 1, 'property_tax', NULL, 5100.00, '2025-03-01', '2025-03-31', 4, NULL),
(5, 1, 2, 'water', 22.0, 950.00, '2025-05-12', '2025-06-02', 5, NULL),
(6, 1, 2, 'electricity', 210.0, 3200.00, '2025-05-12', '2025-06-05', 2, NULL),
(7, 1, 2, 'gas', 14.0, 770.00, '2025-05-12', '2025-06-10', 3, NULL),
(8, 1, 2, 'property_tax', NULL, 5900.00, '2025-04-01', '2025-04-30', 1, '2025-04-20'),

-- Citizen 2: Properties 3–5
(9, 2, 3, 'water', 21.5, 960.00, '2025-05-07', '2025-05-25', 2, NULL),
(10, 2, 3, 'electricity', 190.0, 3100.00, '2025-05-07', '2025-06-01', 4, NULL),
(11, 2, 3, 'gas', 10.0, 640.00, '2025-05-07', '2025-06-04', 3, NULL),
(12, 2, 3, 'property_tax', NULL, 5600.00, '2025-03-05', '2025-03-31', 1, '2025-03-27'),
(13, 2, 4, 'water', 24.0, 1040.00, '2025-06-10', '2025-06-30', 1, NULL),
(14, 2, 4, 'electricity', 205.0, 3400.00, '2025-06-10', '2025-07-05', 2, NULL),
(15, 2, 4, 'gas', 12.0, 720.00, '2025-06-10', '2025-07-08', 4, NULL),
(16, 2, 4, 'property_tax', NULL, 6000.00, '2025-04-01', '2025-04-30', 5, NULL),
(17, 2, 5, 'water', 28.0, 1200.00, '2025-07-01', '2025-07-20', 3, NULL),
(18, 2, 5, 'electricity', 230.0, 3700.00, '2025-07-01', '2025-07-25', 4, NULL),
(19, 2, 5, 'gas', 14.0, 790.00, '2025-07-01', '2025-07-30', 5, NULL),
(20, 2, 5, 'property_tax', NULL, 6800.00, '2025-04-01', '2025-04-30', 1, '2025-04-22'),

-- Citizen 3: Property 6
(21, 3, 6, 'water', 23.0, 940.00, '2025-06-03', '2025-06-25', 2, NULL),
(22, 3, 6, 'electricity', 185.0, 2950.00, '2025-06-03', '2025-06-30', 3, '2025-06-20'),
(23, 3, 6, 'gas', 11.0, 710.00, '2025-06-03', '2025-07-03', 1, NULL),
(24, 3, 6, 'property_tax', NULL, 5400.00, '2025-03-03', '2025-03-31', 5, NULL),

-- Citizen 4: Properties 7–8
(25, 4, 7, 'water', 26.0, 1080.00, '2025-05-10', '2025-05-30', 2, NULL),
(26, 4, 7, 'electricity', 200.0, 3350.00, '2025-05-10', '2025-06-02', 4, NULL),
(27, 4, 7, 'gas', 13.0, 770.00, '2025-05-10', '2025-06-05', 1, NULL),
(28, 4, 7, 'property_tax', NULL, 5700.00, '2025-03-10', '2025-03-31', 5, '2025-03-25'),
(29, 4, 8, 'water', 19.0, 890.00, '2025-06-08', '2025-06-25', 3, NULL),
(30, 4, 8, 'electricity', 170.0, 2800.00, '2025-06-08', '2025-06-28', 1, NULL),
(31, 4, 8, 'gas', 10.0, 650.00, '2025-06-08', '2025-07-05', 5, NULL),
(32, 4, 8, 'property_tax', NULL, 5000.00, '2025-03-08', '2025-03-31', 2, NULL),

-- Citizen 5: Properties 9–11
(33, 5, 9, 'water', 21.0, 960.00, '2025-05-12', '2025-05-30', 4, NULL),
(34, 5, 9, 'electricity', 190.0, 3250.00, '2025-05-12', '2025-06-03', 3, NULL),
(35, 5, 9, 'gas', 12.0, 740.00, '2025-05-12', '2025-06-08', 2, NULL),
(36, 5, 9, 'property_tax', NULL, 5900.00, '2025-03-10', '2025-04-01', 1, NULL),
(37, 5, 10, 'water', 23.5, 990.00, '2025-07-01', '2025-07-20', 5, NULL),
(38, 5, 10, 'electricity', 215.0, 3600.00, '2025-07-01', '2025-07-25', 3, '2025-07-15'),
(39, 5, 10, 'gas', 15.0, 880.00, '2025-07-01', '2025-07-30', 2, NULL),
(40, 5, 10, 'property_tax', NULL, 6300.00, '2025-04-01', '2025-04-30', 1, NULL),
(41, 5, 11, 'water', 24.0, 1050.00, '2025-05-05', '2025-05-25', 2, NULL),
(42, 5, 11, 'electricity', 205.0, 3400.00, '2025-05-05', '2025-05-30', 5, NULL),
(43, 5, 11, 'gas', 13.0, 810.00, '2025-05-05', '2025-06-02', 1, NULL),
(44, 5, 11, 'property_tax', NULL, 5700.00, '2025-03-05', '2025-03-31', 3, '2025-03-25'),

-- Citizen 6: Properties 12–13
(45, 6, 12, 'water', 20.0, 910.00, '2025-06-10', '2025-06-30', 4, NULL),
(46, 6, 12, 'electricity', 175.0, 2850.00, '2025-06-10', '2025-07-05', 5, NULL),
(47, 6, 12, 'gas', 11.0, 720.00, '2025-06-10', '2025-07-08', 2, NULL),
(48, 6, 12, 'property_tax', NULL, 5600.00, '2025-04-01', '2025-04-30', 3, NULL),
(49, 6, 13, 'water', 22.0, 980.00, '2025-05-12', '2025-05-30', 1, NULL),
(50, 6, 13, 'electricity', 195.0, 3200.00, '2025-05-12', '2025-06-05', 4, NULL),
(51, 6, 13, 'gas', 13.0, 780.00, '2025-05-12', '2025-06-10', 2, NULL),
(52, 6, 13, 'property_tax', NULL, 6100.00, '2025-03-10', '2025-03-31', 5, NULL),

-- Citizen 7: Properties 14–17
(53, 7, 14, 'water', 23.5, 990.00, '2025-08-05', '2025-08-25', 2, NULL),
(54, 7, 14, 'electricity', 195.0, 3200.00, '2025-08-05', '2025-08-30', 3, '2025-08-20'),
(55, 7, 14, 'gas', 12.0, 760.00, '2025-08-05', '2025-09-03', 1, NULL),
(56, 7, 14, 'property_tax', NULL, 5600.00, '2025-04-01', '2025-04-30', 4, NULL),

(57, 7, 15, 'water', 26.0, 1100.00, '2025-09-10', '2025-09-30', 5, NULL),
(58, 7, 15, 'electricity', 210.0, 3400.00, '2025-09-10', '2025-10-05', 2, NULL),
(59, 7, 15, 'gas', 13.0, 790.00, '2025-09-10', '2025-10-07', 3, NULL),
(60, 7, 15, 'property_tax', NULL, 6100.00, '2025-04-01', '2025-04-30', 1, '2025-04-22'),

(61, 7, 16, 'water', 18.0, 860.00, '2025-08-15', '2025-08-30', 4, NULL),
(62, 7, 16, 'electricity', 165.0, 2700.00, '2025-08-15', '2025-09-05', 5, NULL),
(63, 7, 16, 'gas', 9.0, 640.00, '2025-08-15', '2025-09-10', 2, NULL),
(64, 7, 16, 'property_tax', NULL, 5200.00, '2025-03-01', '2025-03-31', 3, NULL),

(65, 7, 17, 'water', 27.5, 1220.00, '2025-10-01', '2025-10-20', 1, NULL),
(66, 7, 17, 'electricity', 235.0, 3750.00, '2025-10-01', '2025-10-25', 4, NULL),
(67, 7, 17, 'gas', 15.0, 820.00, '2025-10-01', '2025-10-30', 5, NULL),
(68, 7, 17, 'property_tax', NULL, 6600.00, '2025-04-01', '2025-04-30', 2, '2025-04-20'),

-- Citizen 8: Properties 18–19
(69, 8, 18, 'water', 21.0, 950.00, '2025-08-05', '2025-08-25', 3, NULL),
(70, 8, 18, 'electricity', 185.0, 3100.00, '2025-08-05', '2025-08-30', 1, '2025-08-20'),
(71, 8, 18, 'gas', 11.0, 720.00, '2025-08-05', '2025-09-03', 4, NULL),
(72, 8, 18, 'property_tax', NULL, 5400.00, '2025-03-01', '2025-03-31', 5, NULL),

(73, 8, 19, 'water', 25.0, 1060.00, '2025-09-10', '2025-09-30', 2, NULL),
(74, 8, 19, 'electricity', 210.0, 3450.00, '2025-09-10', '2025-10-05', 5, NULL),
(75, 8, 19, 'gas', 14.0, 780.00, '2025-09-10', '2025-10-07', 3, NULL),
(76, 8, 19, 'property_tax', NULL, 6000.00, '2025-04-01', '2025-04-30', 1, '2025-04-20'),

-- Citizen 9: Properties 20–22
(77, 9, 20, 'water', 22.0, 980.00, '2025-08-10', '2025-08-30', 4, NULL),
(78, 9, 20, 'electricity', 190.0, 3200.00, '2025-08-10', '2025-09-05', 3, NULL),
(79, 9, 20, 'gas', 12.0, 740.00, '2025-08-10', '2025-09-10', 2, NULL),
(80, 9, 20, 'property_tax', NULL, 5600.00, '2025-03-10', '2025-03-31', 1, NULL),

(81, 9, 21, 'water', 27.0, 1210.00, '2025-09-05', '2025-09-25', 5, NULL),
(82, 9, 21, 'electricity', 230.0, 3700.00, '2025-09-05', '2025-09-30', 1, '2025-09-20'),
(83, 9, 21, 'gas', 15.0, 850.00, '2025-09-05', '2025-10-02', 3, NULL),
(84, 9, 21, 'property_tax', NULL, 6700.00, '2025-04-01', '2025-04-30', 2, NULL),

(85, 9, 22, 'water', 19.5, 880.00, '2025-10-05', '2025-10-25', 3, NULL),
(86, 9, 22, 'electricity', 160.0, 2750.00, '2025-10-05', '2025-10-30', 4, NULL),
(87, 9, 22, 'gas', 10.0, 640.00, '2025-10-05', '2025-11-02', 2, NULL),
(88, 9, 22, 'property_tax', NULL, 5300.00, '2025-03-01', '2025-03-31', 5, NULL),

-- Citizen 10: Properties 23–24
(89, 10, 23, 'water', 22.5, 960.00, '2025-08-05', '2025-08-25', 2, NULL),
(90, 10, 23, 'electricity', 185.0, 3050.00, '2025-08-05', '2025-08-30', 3, '2025-08-20'),
(91, 10, 23, 'gas', 12.0, 730.00, '2025-08-05', '2025-09-03', 1, NULL),
(92, 10, 23, 'property_tax', NULL, 5500.00, '2025-03-01', '2025-03-31', 4, NULL),

(93, 10, 24, 'water', 25.0, 1070.00, '2025-09-10', '2025-09-30', 5, NULL),
(94, 10, 24, 'electricity', 215.0, 3450.00, '2025-09-10', '2025-10-05', 2, NULL),
(95, 10, 24, 'gas', 14.0, 770.00, '2025-09-10', '2025-10-07', 3, NULL),
(96, 10, 24, 'property_tax', NULL, 6000.00, '2025-04-01', '2025-04-30', 1, '2025-04-20'),

-- Citizen 11: Properties 25–28
(97, 11, 25, 'water', 24.0, 1020.00, '2025-08-08', '2025-08-28', 3, NULL),
(98, 11, 25, 'electricity', 200.0, 3300.00, '2025-08-08', '2025-09-02', 5, NULL),
(99, 11, 25, 'gas', 13.0, 770.00, '2025-08-08', '2025-09-05', 1, '2025-08-25'),
(100, 11, 25, 'property_tax', NULL, 5800.00, '2025-03-01', '2025-03-31', 2, NULL),

(101, 11, 26, 'water', 26.5, 1150.00, '2025-09-12', '2025-09-30', 4, NULL),
(102, 11, 26, 'electricity', 225.0, 3600.00, '2025-09-12', '2025-10-05', 2, '2025-09-28'),
(103, 11, 26, 'gas', 15.0, 850.00, '2025-09-12', '2025-10-07', 3, NULL),
(104, 11, 26, 'property_tax', NULL, 6400.00, '2025-04-01', '2025-04-30', 5, NULL),

(105, 11, 27, 'water', 23.0, 970.00, '2025-08-20', '2025-09-10', 1, NULL),
(106, 11, 27, 'electricity', 190.0, 3150.00, '2025-08-20', '2025-09-15', 4, NULL),
(107, 11, 27, 'gas', 11.0, 710.00, '2025-08-20', '2025-09-18', 2, NULL),
(108, 11, 27, 'property_tax', NULL, 5700.00, '2025-03-01', '2025-03-31', 5, '2025-03-25'),

(109, 11, 28, 'water', 19.0, 870.00, '2025-10-02', '2025-10-22', 3, NULL),
(110, 11, 28, 'electricity', 160.0, 2750.00, '2025-10-02', '2025-10-27', 1, NULL),
(111, 11, 28, 'gas', 9.0, 640.00, '2025-10-02', '2025-10-30', 4, NULL),
(112, 11, 28, 'property_tax', NULL, 5200.00, '2025-03-01', '2025-03-31', 2, NULL),

-- Citizen 12: Property 29
(113, 12, 29, 'water', 22.5, 940.00, '2025-09-01', '2025-09-25', 5, NULL),
(114, 12, 29, 'electricity', 180.0, 3000.00, '2025-09-01', '2025-09-28', 3, '2025-09-18'),
(115, 12, 29, 'gas', 11.0, 720.00, '2025-09-01', '2025-09-30', 1, NULL),
(116, 12, 29, 'property_tax', NULL, 5500.00, '2025-03-01', '2025-03-31', 4, NULL),

-- Citizen 13: Properties 30–31
(117, 13, 30, 'water', 23.0, 980.00, '2025-08-12', '2025-08-30', 2, NULL),
(118, 13, 30, 'electricity', 190.0, 3100.00, '2025-08-12', '2025-09-05', 3, '2025-08-25'),
(119, 13, 30, 'gas', 12.0, 740.00, '2025-08-12', '2025-09-07', 5, NULL),
(120, 13, 30, 'property_tax', NULL, 5800.00, '2025-03-01', '2025-03-31', 1, NULL),

(121, 13, 31, 'water', 27.5, 1200.00, '2025-10-05', '2025-10-25', 4, NULL),
(122, 13, 31, 'electricity', 230.0, 3700.00, '2025-10-05', '2025-10-30', 2, NULL),
(123, 13, 31, 'gas', 15.0, 860.00, '2025-10-05', '2025-11-02', 5, NULL),
(124, 13, 31, 'property_tax', NULL, 6400.00, '2025-04-01', '2025-04-30', 3, '2025-04-20'),

-- Citizen 14: Property 32
(125, 14, 32, 'water', 24.0, 1010.00, '2025-08-09', '2025-08-29', 2, NULL),
(126, 14, 32, 'electricity', 205.0, 3350.00, '2025-08-09', '2025-09-03', 4, NULL),
(127, 14, 32, 'gas', 13.0, 780.00, '2025-08-09', '2025-09-06', 1, '2025-08-24'),
(128, 14, 32, 'property_tax', NULL, 5900.00, '2025-03-01', '2025-03-31', 3, NULL),

-- Citizen 14: Property 33
(129, 14, 33, 'water', 21.0, 930.00, '2025-09-04', '2025-09-25', 5, NULL),
(130, 14, 33, 'electricity', 175.0, 2950.00, '2025-09-04', '2025-09-29', 2, '2025-09-16'),
(131, 14, 33, 'gas', 11.0, 710.00, '2025-09-04', '2025-10-01', 4, NULL),
(132, 14, 33, 'property_tax', NULL, 5550.00, '2025-03-01', '2025-03-31', 1, NULL),

-- Citizen 15: Property 34
(133, 15, 34, 'water', 26.5, 1150.00, '2025-10-02', '2025-10-20', 3, NULL),
(134, 15, 34, 'electricity', 230.0, 3750.00, '2025-10-02', '2025-10-27', 5, NULL),
(135, 15, 34, 'gas', 15.0, 850.00, '2025-10-02', '2025-10-30', 2, NULL),
(136, 15, 34, 'property_tax', NULL, 6300.00, '2025-04-01', '2025-04-30', 4, NULL),

-- Citizen 15: Property 35
(137, 15, 35, 'water', 25.0, 1080.00, '2025-08-17', '2025-09-06', 1, NULL),
(138, 15, 35, 'electricity', 210.0, 3400.00, '2025-08-17', '2025-09-10', 3, '2025-08-31'),
(139, 15, 35, 'gas', 13.0, 770.00, '2025-08-17', '2025-09-12', 5, NULL),
(140, 15, 35, 'property_tax', NULL, 6000.00, '2025-03-01', '2025-03-31', 2, NULL),

-- Citizen 16: Property 36
(141, 16, 36, 'water', 23.0, 950.00, '2025-09-06', '2025-09-27', 4, NULL),
(142, 16, 36, 'electricity', 190.0, 3100.00, '2025-09-06', '2025-10-01', 2, NULL),
(143, 16, 36, 'gas', 11.0, 720.00, '2025-09-06', '2025-10-03', 1, '2025-09-22'),
(144, 16, 36, 'property_tax', NULL, 5600.00, '2025-03-01', '2025-03-31', 5, NULL),

-- Citizen 16: Properties 37–38
(145, 16, 37, 'water', 28.0, 1210.00, '2025-10-09', '2025-10-29', 3, NULL),
(146, 16, 37, 'electricity', 240.0, 3850.00, '2025-10-09', '2025-11-03', 4, NULL),
(147, 16, 37, 'gas', 16.0, 890.00, '2025-10-09', '2025-11-06', 5, NULL),
(148, 16, 37, 'property_tax', NULL, 6550.00, '2025-04-01', '2025-04-30', 2, NULL),

(149, 16, 38, 'water', 20.5, 910.00, '2025-08-11', '2025-08-31', 1, NULL),
(150, 16, 38, 'electricity', 170.0, 2850.00, '2025-08-11', '2025-09-05', 5, '2025-08-28'),
(151, 16, 38, 'gas', 10.0, 690.00, '2025-08-11', '2025-09-08', 2, NULL),
(152, 16, 38, 'property_tax', NULL, 5450.00, '2025-03-01', '2025-03-31', 4, NULL),

-- Citizen 17: Property 39
(153, 17, 39, 'water', 22.0, 940.00, '2025-08-13', '2025-09-02', 2, NULL),
(154, 17, 39, 'electricity', 185.0, 3050.00, '2025-08-13', '2025-09-07', 5, '2025-08-27'),
(155, 17, 39, 'gas', 11.0, 710.00, '2025-08-13', '2025-09-10', 1, NULL),
(156, 17, 39, 'property_tax', NULL, 5700.00, '2025-03-01', '2025-03-31', 4, NULL),

-- Citizen 17: Property 40
(157, 17, 40, 'water', 25.5, 1080.00, '2025-09-09', '2025-09-29', 3, NULL),
(158, 17, 40, 'electricity', 210.0, 3400.00, '2025-09-09', '2025-10-04', 4, NULL),
(159, 17, 40, 'gas', 13.0, 780.00, '2025-09-09', '2025-10-06', 2, NULL),
(160, 17, 40, 'property_tax', NULL, 6150.00, '2025-04-01', '2025-04-30', 5, '2025-04-22'),

-- Citizen 18: Property 41
(161, 18, 41, 'water', 19.5, 860.00, '2025-10-06', '2025-10-26', 1, NULL),
(162, 18, 41, 'electricity', 150.0, 2650.00, '2025-10-06', '2025-10-31', 3, NULL),
(163, 18, 41, 'gas', 9.0, 640.00, '2025-10-06', '2025-11-03', 4, NULL),
(164, 18, 41, 'property_tax', NULL, 5100.00, '2025-03-01', '2025-03-31', 2, NULL),

-- Citizen 18: Properties 42–43
(165, 18, 42, 'water', 23.0, 970.00, '2025-08-25', '2025-09-14', 2, NULL),
(166, 18, 42, 'electricity', 190.0, 3150.00, '2025-08-25', '2025-09-18', 5, NULL),
(167, 18, 42, 'gas', 12.0, 750.00, '2025-08-25', '2025-09-21', 1, '2025-09-10'),
(168, 18, 42, 'property_tax', NULL, 5750.00, '2025-03-01', '2025-03-31', 3, NULL),

(169, 18, 43, 'water', 27.0, 1180.00, '2025-09-30', '2025-10-20', 4, NULL),
(170, 18, 43, 'electricity', 235.0, 3800.00, '2025-09-30', '2025-10-25', 2, NULL),
(171, 18, 43, 'gas', 15.0, 850.00, '2025-09-30', '2025-10-28', 5, NULL),
(172, 18, 43, 'property_tax', NULL, 6450.00, '2025-04-01', '2025-04-30', 1, NULL),

-- Citizen 19: Properties 44–45
(173, 19, 44, 'water', 22.5, 960.00, '2025-08-18', '2025-09-07', 3, NULL),
(174, 19, 44, 'electricity', 185.0, 3050.00, '2025-08-18', '2025-09-12', 1, '2025-09-01'),
(175, 19, 44, 'gas', 11.0, 710.00, '2025-08-18', '2025-09-15', 4, NULL),
(176, 19, 44, 'property_tax', NULL, 5650.00, '2025-03-01', '2025-03-31', 5, NULL),

(177, 19, 45, 'water', 24.0, 1040.00, '2025-10-01', '2025-10-21', 2, NULL),
(178, 19, 45, 'electricity', 200.0, 3300.00, '2025-10-01', '2025-10-26', 3, NULL),
(179, 19, 45, 'gas', 13.0, 780.00, '2025-10-01', '2025-10-29', 4, NULL),
(180, 19, 45, 'property_tax', NULL, 5950.00, '2025-04-01', '2025-04-30', 5, NULL),

-- Citizen 20: Property 46
(181, 20, 46, 'water', 23.5, 980.00, '2025-08-10', '2025-08-30', 3, NULL),
(182, 20, 46, 'electricity', 195.0, 3150.00, '2025-08-10', '2025-09-04', 4, '2025-08-26'),
(183, 20, 46, 'gas', 12.0, 750.00, '2025-08-10', '2025-09-07', 1, NULL),
(184, 20, 46, 'property_tax', NULL, 5800.00, '2025-03-01', '2025-03-31', 5, NULL),

-- Citizen 20: Property 47
(185, 20, 47, 'water', 26.0, 1120.00, '2025-09-15', '2025-10-05', 2, NULL),
(186, 20, 47, 'electricity', 215.0, 3500.00, '2025-09-15', '2025-10-10', 3, NULL),
(187, 20, 47, 'gas', 14.0, 820.00, '2025-09-15', '2025-10-13', 5, NULL),
(188, 20, 47, 'property_tax', NULL, 6200.00, '2025-04-01', '2025-04-30', 1, '2025-04-19'),

-- Citizen 21: Property 48
(189, 21, 48, 'water', 21.0, 920.00, '2025-10-08', '2025-10-28', 4, NULL),
(190, 21, 48, 'electricity', 180.0, 2950.00, '2025-10-08', '2025-11-02', 2, NULL),
(191, 21, 48, 'gas', 11.0, 720.00, '2025-10-08', '2025-11-05', 5, NULL),
(192, 21, 48, 'property_tax', NULL, 5500.00, '2025-03-01', '2025-03-31', 3, NULL),

-- Citizen 21: Property 49
(193, 21, 49, 'water', 27.5, 1190.00, '2025-08-22', '2025-09-11', 1, NULL),
(194, 21, 49, 'electricity', 240.0, 3850.00, '2025-08-22', '2025-09-16', 3, '2025-09-02'),
(195, 21, 49, 'gas', 16.0, 890.00, '2025-08-22', '2025-09-19', 4, NULL),
(196, 21, 49, 'property_tax', NULL, 6550.00, '2025-04-01', '2025-04-30', 2, NULL),

-- Citizen 22: Property 50
(197, 22, 50, 'water', 25.0, 1080.00, '2025-09-12', '2025-10-02', 5, NULL),
(198, 22, 50, 'electricity', 210.0, 3400.00, '2025-09-12', '2025-10-07', 1, NULL),
(199, 22, 50, 'gas', 13.0, 770.00, '2025-09-12', '2025-10-10', 3, NULL),
(200, 22, 50, 'property_tax', NULL, 6000.00, '2025-03-01', '2025-03-31', 4, NULL),

-- Citizen 22: Properties 51–52
(201, 22, 51, 'water', 22.0, 960.00, '2025-10-03', '2025-10-23', 2, NULL),
(202, 22, 51, 'electricity', 190.0, 3150.00, '2025-10-03', '2025-10-28', 4, NULL),
(203, 22, 51, 'gas', 12.0, 750.00, '2025-10-03', '2025-10-31', 1, '2025-10-18'),
(204, 22, 51, 'property_tax', NULL, 5750.00, '2025-03-01', '2025-03-31', 5, NULL),

(205, 22, 52, 'water', 28.0, 1220.00, '2025-08-28', '2025-09-17', 3, NULL),
(206, 22, 52, 'electricity', 245.0, 3920.00, '2025-08-28', '2025-09-22', 2, NULL),
(207, 22, 52, 'gas', 17.0, 910.00, '2025-08-28', '2025-09-25', 5, NULL),
(208, 22, 52, 'property_tax', NULL, 6700.00, '2025-04-01', '2025-04-30', 1, NULL),

-- Citizen 23: Property 53
(209, 23, 53, 'water', 24.0, 1050.00, '2025-08-10', '2025-08-30', 4, NULL),
(210, 23, 53, 'electricity', 210.0, 3400.00, '2025-08-10', '2025-09-04', 2, NULL),
(211, 23, 53, 'gas', 13.0, 800.00, '2025-08-10', '2025-09-07', 1, '2025-08-28'),
(212, 23, 53, 'property_tax', NULL, 6100.00, '2025-04-01', '2025-04-30', 3, NULL),

-- Citizen 24: Property 54
(213, 24, 54, 'water', 21.5, 930.00, '2025-09-05', '2025-09-25', 5, NULL),
(214, 24, 54, 'electricity', 185.0, 2900.00, '2025-09-05', '2025-09-30', 3, NULL),
(215, 24, 54, 'gas', 11.0, 720.00, '2025-09-05', '2025-10-03', 4, NULL),
(216, 24, 54, 'property_tax', NULL, 5400.00, '2025-03-01', '2025-03-31', 2, '2025-03-25'),

-- Citizen 24: Property 55
(217, 24, 55, 'water', 26.0, 1120.00, '2025-10-01', '2025-10-21', 1, NULL),
(218, 24, 55, 'electricity', 225.0, 3600.00, '2025-10-01', '2025-10-26', 2, NULL),
(219, 24, 55, 'gas', 15.0, 860.00, '2025-10-01', '2025-10-29', 5, NULL),
(220, 24, 55, 'property_tax', NULL, 6200.00, '2025-04-01', '2025-04-30', 4, NULL),

-- Citizen 25: Property 56
(221, 25, 56, 'water', 23.0, 970.00, '2025-08-15', '2025-09-05', 3, NULL),
(222, 25, 56, 'electricity', 200.0, 3200.00, '2025-08-15', '2025-09-09', 5, NULL),
(223, 25, 56, 'gas', 12.0, 760.00, '2025-08-15', '2025-09-12', 1, NULL),
(224, 25, 56, 'property_tax', NULL, 5800.00, '2025-03-01', '2025-03-31', 4, NULL),

-- Citizen 25: Property 57
(225, 25, 57, 'water', 27.0, 1180.00, '2025-09-12', '2025-10-02', 2, NULL),
(226, 25, 57, 'electricity', 235.0, 3750.00, '2025-09-12', '2025-10-07', 3, '2025-09-28'),
(227, 25, 57, 'gas', 15.0, 870.00, '2025-09-12', '2025-10-10', 5, NULL),
(228, 25, 57, 'property_tax', NULL, 6500.00, '2025-04-01', '2025-04-30', 1, NULL),

-- Citizen 25: Property 58
(229, 25, 58, 'water', 29.0, 1240.00, '2025-10-08', '2025-10-28', 4, NULL),
(230, 25, 58, 'electricity', 245.0, 3950.00, '2025-10-08', '2025-11-02', 2, NULL),
(231, 25, 58, 'gas', 16.0, 920.00, '2025-10-08', '2025-11-05', 1, NULL),
(232, 25, 58, 'property_tax', NULL, 6800.00, '2025-04-01', '2025-04-30', 5, NULL);

-- (continues similarly for all 58 properties — total 232 rows)

INSERT INTO fastag (fastag_id, citizen_id, vehicle_number, balance) VALUES
(1, 1, 'MH12AB1234', 1450.00),
(2, 1, 'MH12CD5678', 890.00),
(3, 2, 'MH12EF9012', 1200.50),
(4, 3, 'MH12GH3456', 610.00),
(5, 3, 'MH12JK7890', 980.75),
(6, 4, 'MH12LM1122', 750.00),
(7, 5, 'MH12NP3344', 1300.00),
(8, 5, 'MH12QR5566', 1550.50),
(9, 5, 'MH12ST7788', 440.00),
(10, 6, 'MH12UV9900', 1110.25),
(11, 7, 'MH12WX2233', 700.00),
(12, 7, 'MH12YZ4455', 1780.50),
(13, 8, 'MH12AA6677', 1340.00),
(14, 9, 'MH12BB8899', 820.00),
(15, 9, 'MH12CC1011', 540.00),
(16, 10, 'MH12DD1213', 650.75),
(17, 11, 'MH12EE1415', 1920.00),
(18, 11, 'MH12FF1617', 1280.50),
(19, 12, 'MH12GG1819', 970.00),
(20, 13, 'MH12HH2021', 480.00),
(21, 13, 'MH12II2223', 890.00),
(22, 13, 'MH12JJ2425', 1025.50),
(23, 14, 'MH12KK2627', 1775.00),
(24, 15, 'MH12LL2829', 610.00),
(25, 15, 'MH12MM3031', 890.00),
(26, 16, 'MH12NN3233', 1360.50),
(27, 17, 'MH12OO3435', 490.00),
(28, 17, 'MH12PP3637', 1560.00),
(29, 18, 'MH12QQ3839', 670.25),
(30, 19, 'MH12RR4041', 880.00),
(31, 20, 'MH12SS4243', 1035.00),
(32, 20, 'MH12TT4445', 1930.50),
(33, 21, 'MH12UU4647', 510.00),
(34, 22, 'MH12VV4849', 1720.00),
(35, 23, 'MH12WW5051', 1180.50),
(36, 23, 'MH12XX5253', 770.00),
(37, 24, 'MH12YY5455', 980.00),
(38, 25, 'MH12ZZ5657', 1420.75),
(39, 25, 'MH12AA5859', 610.00);

INSERT INTO feedback (feedback_id, citizen_id, rating, comment, feedback_date) VALUES
(1, 1, 5, 'Online bill payment process was smooth and quick.', '2025-06-20'),
(2, 2, 4, 'Water supply service improved but still irregular sometimes.', '2025-06-22'),
(3, 3, 3, 'Power cuts are frequent in my area.', '2025-06-25'),
(4, 4, 5, 'Complaint resolution was quick and effective.', '2025-06-26'),
(5, 5, 2, 'Road repair work took too long to start.', '2025-06-28'),
(6, 6, 4, 'Gas bill payment system is easy to use.', '2025-07-01'),
(7, 7, 3, 'Customer support was slow to respond.', '2025-07-02'),
(8, 8, 5, 'Property tax payment portal is very user friendly.', '2025-07-03'),
(9, 9, 4, 'Electricity bill details were clear and accurate.', '2025-07-04'),
(10, 10, 5, 'Fastag recharge completed instantly.', '2025-07-05'),
(11, 11, 3, 'Complaint redressal team needs improvement.', '2025-07-06'),
(12, 12, 4, 'App UI is intuitive and smooth.', '2025-07-07'),
(13, 13, 2, 'Payment gateway failed once, but worked later.', '2025-07-08'),
(14, 14, 5, 'Staff were polite and helpful during verification.', '2025-07-09'),
(15, 15, 4, 'Notifications about due dates are very useful.', '2025-07-10'),
(16, 16, 5, 'Prompt service for electricity complaint.', '2025-07-11'),
(17, 17, 3, 'Mobile app crashed once during payment.', '2025-07-12'),
(18, 18, 2, 'Late property tax calculation seems inaccurate.', '2025-07-13'),
(19, 19, 5, 'Fastag auto-recharge feature is great.', '2025-07-14'),
(20, 20, 4, 'Quick response on gas leakage complaint.', '2025-07-15'),
(21, 21, 3, 'Bill amount rounding is sometimes inconsistent.', '2025-07-16'),
(22, 22, 5, 'Love the new unified billing dashboard.', '2025-07-17'),
(23, 23, 4, 'Easy to link multiple properties in one account.', '2025-07-18'),
(24, 24, 5, 'Everything works perfectly, no complaints.', '2025-07-19'),
(25, 25, 2, 'UPI payment failed twice before success.', '2025-07-20');

INSERT INTO error_log (error_type_id, citizen_id) VALUES
(1, 3),  -- Login failed for Citizen ID 3
(2, 8),  -- Payment gateway failed for Citizen ID 8
(4, 12), -- Complaint submission error for Citizen ID 12
(5, 19), -- System timeout for Citizen ID 19
(6, 21); -- Unauthorized access attempt by Citizen ID 21