
-- creating tables
CREATE TABLE Criminal (
    C_id INT PRIMARY KEY,
    criminal_name VARCHAR(255),
    street_address VARCHAR(255),
    city_address VARCHAR(255),
    zipcode VARCHAR(20),
    vio_of_status VARCHAR(100),
    probation_status VARCHAR(100),
    alias VARCHAR(255)
);

CREATE TABLE phone_no (
    C_id INT,
    phone_number VARCHAR(20),
    FOREIGN KEY (C_id) REFERENCES Criminal(C_id)
);

CREATE TABLE Crime (
    crime_id INT PRIMARY KEY,
    crime_class VARCHAR(50),
    date_ch DATE,
    appeal_start DATE,
    hearing_date DATE,
    appeal_cutoff DATE,
    arresting_officer VARCHAR(255),
    crime_code VARCHAR(50),
    fine DECIMAL(10, 2),
    court_fee DECIMAL(10, 2),
    paid DECIMAL(10, 2),
    payment_due DATE,
    charge_status VARCHAR(50)
);

CREATE TABLE Cases (
    crime_id INT,
    case_type VARCHAR(50),
    case_code VARCHAR(50),
    FOREIGN KEY (crime_id) REFERENCES Crime(crime_id)
);

CREATE TABLE Charge (
    crime_id INT,
    offense VARCHAR(255),
    charge_code VARCHAR(50),
    FOREIGN KEY (crime_id) REFERENCES Crime(crime_id)
);

CREATE TABLE Involvement (
    C_id INT,
    crime_id INT,
    FOREIGN KEY (C_id) REFERENCES Criminal(C_id),
    FOREIGN KEY (crime_id) REFERENCES Crime(crime_id)
);

CREATE TABLE Sentence (
    crime_id INT,
    start_date DATE,
    end_date DATE,
    num_violations INT,
    sentence_type VARCHAR(50),
    FOREIGN KEY (crime_id) REFERENCES Crime(crime_id)
);

CREATE TABLE Appeal (
    crime_id INT,
    file_date DATE,
    hearing_date DATE,
    appeal_status VARCHAR(50),
    FOREIGN KEY (crime_id) REFERENCES Crime(crime_id)
);

CREATE TABLE Police_Officer (
    badge_no INT PRIMARY KEY,
    officer_name VARCHAR(255),
    precinct VARCHAR(50),
    phone_num VARCHAR(20),
    officer_status VARCHAR(50)
);

CREATE TABLE Police_assign (
    crime_id INT,
    badge_no INT,
    FOREIGN KEY (crime_id) REFERENCES Crime(crime_id),
    FOREIGN KEY (badge_no) REFERENCES Police_Officer(badge_no)
);

-- Populating tables
-- Criminal
INSERT INTO Criminal (C_id, criminal_name, street_address, city_address, zipcode, vio_of_status, probation_status, alias)
VALUES
(1, 'John Doe', '123 Maple St', 'Anytown', '12345', 'Low', 'Yes', 'Johnny'),
(2, 'Jane Smith', '456 Pine St', 'Anytown', '23456', 'Medium', 'No', 'Janey'),
(3, 'Alice Johnson', '789 Oak St', 'Anytown', '34567', 'High', 'Yes', 'Ally'),
(4, 'Bob Brown', '101 Maple Ave', 'Anytown', '45678', 'Low', 'No', 'Bobby'),
(5, 'Carol White', '202 Pine Ave', 'Anytown', '56789', 'Medium', 'Yes', 'Carrie'),
(6, 'David Green', '303 Oak Ave', 'Anytown', '67890', 'High', 'No', 'Davey'),
(7, 'Eva Black', '404 Birch St', 'Anytown', '78901', 'Low', 'Yes', 'Evie'),
(8, 'Frank Grey', '505 Cedar St', 'Anytown', '89012', 'Medium', 'No', 'Frankie'),
(9, 'Grace Silver', '606 Elm St', 'Anytown', '90123', 'High', 'Yes', 'Gracie'),
(10, 'Henry Gold', '707 Palm St', 'Anytown', '01234', 'Low', 'No', 'Hank');

-- phone_no
INSERT INTO phone_no (C_id, phone_number)
VALUES
(1, '555-0001'), (2, '555-0002'), (3, '555-0003'), (4, '555-0004'), (5, '555-0005'),
(6, '555-0006'), (7, '555-0007'), (8, '555-0008'), (9, '555-0009'), (10, '555-0010');

-- Crime
INSERT INTO Crime (crime_id, crime_class, date_ch, appeal_start, hearing_date, appeal_cutoff, arresting_officer, crime_code, fine, court_fee, paid, payment_due, charge_status)
VALUES
(1, 'Felony', '2023-01-01', '2023-02-01', '2023-03-01', '2023-04-01', 'Officer A', 'ABC123', 200.00, 20.00, 220.00, '2023-05-01', 'Pending'),
(2, 'Misdemeanor', '2023-01-02', NULL, '2023-03-02', NULL, 'Officer B', 'DEF456', 100.00, 10.00, 110.00, '2023-04-02', 'Complete'),
(3, 'Felony', '2023-01-03', '2023-02-03', '2023-03-03', '2023-04-03', 'Officer C', 'GHI789', 300.00, 30.00, 0.00, '2023-05-03', 'Pending'),
(4, 'Misdemeanor', '2023-01-04', NULL, '2023-03-04', NULL, 'Officer D', 'JKL012', 150.00, 15.00, 165.00, '2023-04-04', 'Complete'),
(5, 'Felony', '2023-01-05', '2023-02-05', '2023-03-05', '2023-04-05', 'Officer E', 'MNO345', 250.00, 25.00, 275.00, '2023-05-05', 'Pending'),
(6, 'Misdemeanor', '2023-01-06', NULL, '2023-03-06', NULL, 'Officer F', 'PQR678', 120.00, 12.00, 132.00, '2023-04-06', 'Complete'),
(7, 'Felony', '2023-01-07', '2023-02-07', '2023-03-07', '2023-04-07', 'Officer G', 'STU901', 210.00, 21.00, 0.00, '2023-05-07', 'Pending'),
(8, 'Misdemeanor', '2023-01-08', NULL, '2023-03-08', NULL, 'Officer H', 'VWX234', 130.00, 13.00, 143.00, '2023-04-08', 'Complete'),
(9, 'Felony', '2023-01-09', '2023-02-09', '2023-03-09', '2023-04-09', 'Officer I', 'YZA567', 220.00, 22.00, 242.00, '2023-05-09', 'Pending'),
(10, 'Misdemeanor', '2023-01-10', NULL, '2023-03-10', NULL, 'Officer J', 'BCD890', 110.00, 11.00, 121.00, '2023-04-10', 'Complete');

-- Cases
INSERT INTO Cases (crime_id, case_type, case_code)
VALUES
(1, 'Type A', 'A1'), (2, 'Type B', 'B1'), (3, 'Type C', 'C1'), (4, 'Type D', 'D1'), (5, 'Type E', 'E1'),
(6, 'Type F', 'F1'), (7, 'Type G', 'G1'), (8, 'Type H', 'H1'), (9, 'Type I', 'I1'), (10, 'Type J', 'J1');

-- Charge
INSERT INTO Charge (crime_id, offense, charge_code)
VALUES
(1, 'Offense A', 'O1'), (2, 'Offense B', 'O2'), (3, 'Offense C', 'O3'), (4, 'Offense D', 'O4'), (5, 'Offense E', 'O5'),
(6, 'Offense F', 'O6'), (7, 'Offense G', 'O7'), (8, 'Offense H', 'O8'), (9, 'Offense I', 'O9'), (10, 'Offense J', 'O10');

-- Involvement
INSERT INTO Involvement (C_id, crime_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- Sentence
INSERT INTO Sentence (crime_id, start_date, end_date, num_violations, sentence_type)
VALUES
(1, '2023-06-01', '2024-06-01', 0, 'Incarceration'),
(2, '2023-06-02', '2023-12-02', 1, 'Probation'),
(3, '2023-06-03', '2024-06-03', 0, 'Incarceration'),
(4, '2023-06-04', '2023-12-04', 2, 'Probation'),
(5, '2023-06-05', '2024-06-05', 0, 'Incarceration'),
(6, '2023-06-06', '2023-12-06', 1, 'Probation'),
(7, '2023-06-07', '2024-06-07', 0, 'Incarceration'),
(8, '2023-06-08', '2023-12-08', 2, 'Probation'),
(9, '2023-06-09', '2024-06-09', 0, 'Incarceration'),
(10, '2023-06-10', '2023-12-10', 1, 'Probation');

-- Appeal
INSERT INTO Appeal (crime_id, file_date, hearing_date, appeal_status)
VALUES
(1, '2023-07-01', '2023-08-01', 'Pending'),
(2, '2023-07-02', '2023-08-02', 'Approved'),
(3, '2023-07-03', '2023-08-03', 'Denied'),
(4, '2023-07-04', '2023-08-04', 'Pending'),
(5, '2023-07-05', '2023-08-05', 'Approved'),
(6, '2023-07-06', '2023-08-06', 'Denied'),
(7, '2023-07-07', '2023-08-07', 'Pending'),
(8, '2023-07-08', '2023-08-08', 'Approved'),
(9, '2023-07-09', '2023-08-09', 'Denied'),
(10, '2023-07-10', '2023-08-10', 'Pending');

-- Police_Officer
INSERT INTO Police_Officer (badge_no, officer_name, precinct, phone_num, officer_status)
VALUES
(1, 'Officer A', 'Precinct 1', '555-0101', 'Active'),
(2, 'Officer B', 'Precinct 2', '555-0202', 'Active'),
(3, 'Officer C', 'Precinct 3', '555-0303', 'Inactive'),
(4, 'Officer D', 'Precinct 4', '555-0404', 'Active'),
(5, 'Officer E', 'Precinct 5', '555-0505', 'Inactive'),
(6, 'Officer F', 'Precinct 6', '555-0606', 'Active'),
(7, 'Officer G', 'Precinct 7', '555-0707', 'Inactive'),
(8, 'Officer H', 'Precinct 8', '555-0808', 'Active'),
(9, 'Officer I', 'Precinct 9', '555-0909', 'Inactive'),
(10, 'Officer J', 'Precinct 10', '555-1010', 'Active');

-- Police_assign
INSERT INTO Police_assign (crime_id, badge_no)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- Advanced PL/SQL
DELIMITER //
CREATE TRIGGER AfterPaymentUpdate
AFTER UPDATE ON Crime
FOR EACH ROW
BEGIN
    IF NEW.paid >= (NEW.fine + NEW.court_fee) THEN
        SET NEW.charge_status = 'Complete';
    END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetCriminalHistory(IN criminalID INT)
BEGIN
    SELECT c.crime_id, c.crime_class, c.charge_status
    FROM Crime c
    JOIN Involvement i ON c.crime_id = i.crime_id
    WHERE i.C_id = criminalID;
END; //
DELIMITER ;