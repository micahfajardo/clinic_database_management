-- ========================================
-- Health Database for JOIN Practice
-- ========================================

-- Drop existing database if it exists
DROP DATABASE IF EXISTS health_db;

-- Create database
CREATE DATABASE health_db;
USE health_db;

-- ========================================
-- Table 1: Patients (Main patient information)
-- ========================================
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    height_cm DECIMAL(5,1) NOT NULL,
    weight_lbs DECIMAL(6,2) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- Table 2: Medical_Records (Health measurements)
-- ========================================
CREATE TABLE medical_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    heart_rate INT NOT NULL,
    systolic_bp INT NOT NULL,
    diastolic_bp INT NOT NULL,
    temperature_f DECIMAL(4,1) NOT NULL,
    record_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- ========================================
-- Table 3: Lifestyle (Smoking and other habits)
-- ========================================
CREATE TABLE lifestyle (
    lifestyle_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    is_smoker BOOLEAN NOT NULL,
    exercise_frequency VARCHAR(20),
    alcohol_consumption VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- ========================================
-- Table 4: Doctors (Healthcare providers)
-- ========================================
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50) NOT NULL,
    years_experience INT NOT NULL
);

-- ========================================
-- Table 5: Appointments (Patient-Doctor relationship)
-- ========================================
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_type VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE
);

-- ========================================
-- Insert Sample Data: Patients
-- ========================================
INSERT INTO patients (first_name, last_name, age, sex, height_cm, weight_lbs) VALUES
('Mary', 'Sanchez', 58, 'F', 166.6, 90.00),
('William', 'Johnson', 36, 'M', 170.1, 103.33),
('John', 'Davis', 37, 'M', 163.1, 115.77),
('Amy', 'Moore', 61, 'F', 163.7, 128.64),
('Mary', 'Davis', 25, 'F', 168.6, 140.30),
('Matthew', 'Jones', 52, 'M', 174.7, 165.94),
('Michelle', 'Brown', 54, 'F', 159.1, 149.37),
('Robert', 'Garcia', 48, 'M', 177.9, 178.96),
('Patricia', 'Wilson', 65, 'F', 161.4, 137.08),
('Christopher', 'Anderson', 32, 'M', 184.2, 177.88),
('Karen', 'Thomas', 43, 'F', 157.8, 131.15),
('Charles', 'Taylor', 47, 'M', 171.3, 161.42),
('Nancy', 'Moore', 39, 'F', 164.9, 144.92),
('Daniel', 'Jackson', 29, 'M', 179.5, 168.74),
('Lisa', 'Martin', 56, 'F', 158.2, 142.83),
('Matthew', 'Lee', 41, 'M', 176.8, 169.37),
('Betty', 'Perez', 67, 'F', 155.4, 126.59),
('Anthony', 'Thompson', 33, 'M', 182.1, 179.42),
('Helen', 'White', 50, 'F', 162.7, 156.28),
('Mark', 'Harris', 44, 'M', 175.2, 172.64),
('Sandra', 'Sanchez', 38, 'F', 160.3, 138.91),
('Donald', 'Clark', 59, 'M', 173.9, 169.83),
('Donna', 'Ramirez', 42, 'F', 165.1, 147.52),
('Steven', 'Lewis', 35, 'M', 178.4, 165.27),
('Carol', 'Robinson', 53, 'F', 159.7, 144.18),
('Paul', 'Walker', 46, 'M', 176.5, 174.91),
('Ruth', 'Young', 62, 'F', 157.6, 133.76),
('Andrew', 'Allen', 28, 'M', 181.3, 171.48),
('Sharon', 'King', 49, 'F', 163.4, 151.83),
('Joshua', 'Wright', 37, 'M', 177.2, 167.35),
('Michelle', 'Scott', 45, 'F', 161.8, 143.69),
('Kenneth', 'Torres', 51, 'M', 174.6, 168.52),
('Laura', 'Nguyen', 34, 'F', 166.2, 149.27),
('Kevin', 'Hill', 40, 'M', 179.7, 173.84),
('Kimberly', 'Flores', 36, 'F', 158.9, 136.45),
('Brian', 'Green', 43, 'M', 175.8, 170.18),
('Deborah', 'Adams', 57, 'F', 162.3, 145.92),
('George', 'Nelson', 48, 'M', 177.4, 175.63),
('Dorothy', 'Baker', 64, 'F', 156.7, 128.37),
('Timothy', 'Hall', 31, 'M', 180.9, 174.29),
('Lisa', 'Rivera', 39, 'F', 164.5, 142.86),
('Ronald', 'Campbell', 52, 'M', 173.2, 167.74),
('Amy', 'Mitchell', 44, 'F', 160.7, 148.53),
('Jason', 'Carter', 38, 'M', 178.6, 169.42),
('Angela', 'Roberts', 46, 'F', 163.8, 146.17),
('Edward', 'Smith', 55, 'M', 176.1, 172.95),
('Ashley', 'Johnson', 27, 'F', 167.4, 151.68),
('Jeffrey', 'Williams', 49, 'M', 174.9, 168.71),
('Brenda', 'Brown', 41, 'F', 159.4, 140.34),
('Ryan', 'Jones', 33, 'M', 181.5, 176.83);

-- ========================================
-- Insert Sample Data: Medical Records
-- ========================================
INSERT INTO medical_records (patient_id, heart_rate, systolic_bp, diastolic_bp, temperature_f, record_date) VALUES
(1, 88, 155, 78, 99.1, '2025-10-15'),
(2, 67, 124, 88, 98.9, '2025-10-14'),
(3, 78, 142, 69, 96.7, '2025-10-13'),
(4, 77, 142, 64, 99.0, '2025-10-12'),
(5, 65, 121, 78, 99.5, '2025-10-11'),
(6, 63, 135, 82, 98.7, '2025-10-10'),
(7, 73, 136, 86, 99.2, '2025-10-09'),
(8, 81, 136, 87, 98.2, '2025-10-08'),
(9, 78, 149, 92, 98.1, '2025-10-07'),
(10, 74, 118, 74, 98.6, '2025-10-06'),
(11, 82, 137, 83, 98.3, '2025-10-05'),
(12, 70, 132, 81, 98.8, '2025-10-04'),
(13, 69, 124, 79, 98.4, '2025-10-03'),
(14, 72, 115, 71, 98.9, '2025-10-02'),
(15, 84, 145, 89, 98.0, '2025-10-01'),
(16, 75, 129, 78, 98.5, '2025-09-30'),
(17, 76, 151, 95, 97.8, '2025-09-29'),
(18, 68, 117, 72, 99.0, '2025-09-28'),
(19, 83, 141, 85, 98.2, '2025-09-27'),
(20, 73, 128, 80, 98.6, '2025-09-26'),
(21, 71, 121, 76, 98.7, '2025-09-25'),
(22, 85, 146, 90, 97.9, '2025-09-24'),
(23, 68, 125, 79, 98.5, '2025-09-23'),
(24, 76, 119, 75, 98.8, '2025-09-22'),
(25, 74, 134, 84, 98.3, '2025-09-21'),
(26, 72, 131, 81, 98.4, '2025-09-20'),
(27, 79, 144, 88, 97.9, '2025-09-19'),
(28, 69, 113, 70, 99.2, '2025-09-18'),
(29, 81, 138, 86, 98.1, '2025-09-17'),
(30, 74, 123, 77, 98.6, '2025-09-16'),
(31, 72, 127, 80, 98.5, '2025-09-15'),
(32, 76, 133, 82, 98.2, '2025-09-14'),
(33, 67, 118, 74, 98.9, '2025-09-13'),
(34, 73, 120, 76, 98.7, '2025-09-12'),
(35, 68, 119, 75, 98.8, '2025-09-11'),
(36, 82, 136, 84, 98.1, '2025-09-10'),
(37, 74, 131, 82, 98.3, '2025-09-09'),
(38, 74, 130, 81, 98.4, '2025-09-08'),
(39, 78, 143, 88, 97.8, '2025-09-07'),
(40, 71, 115, 72, 99.1, '2025-09-06'),
(41, 69, 123, 78, 98.6, '2025-09-05'),
(42, 84, 141, 86, 98.1, '2025-09-04'),
(43, 72, 128, 81, 98.4, '2025-09-03'),
(44, 75, 124, 78, 98.7, '2025-09-02'),
(45, 69, 121, 77, 98.6, '2025-09-01'),
(46, 75, 132, 81, 98.4, '2025-08-31'),
(47, 66, 114, 71, 99.3, '2025-08-30'),
(48, 83, 138, 85, 98.0, '2025-08-29'),
(49, 70, 125, 79, 98.5, '2025-08-28'),
(50, 72, 118, 75, 98.8, '2025-08-27');

-- ========================================
-- Insert Sample Data: Lifestyle
-- ========================================
INSERT INTO lifestyle (patient_id, is_smoker, exercise_frequency, alcohol_consumption) VALUES
(1, TRUE, 'Never', 'Moderate'),
(2, FALSE, 'Weekly', 'Light'),
(3, FALSE, 'Daily', 'None'),
(4, FALSE, 'Weekly', 'Light'),
(5, FALSE, 'Weekly', 'None'),
(6, FALSE, 'Monthly', 'Moderate'),
(7, FALSE, 'Weekly', 'Light'),
(8, FALSE, 'Daily', 'Light'),
(9, FALSE, 'Never', 'None'),
(10, FALSE, 'Weekly', 'Moderate'),
(11, TRUE, 'Never', 'Heavy'),
(12, FALSE, 'Weekly', 'Light'),
(13, FALSE, 'Weekly', 'Light'),
(14, FALSE, 'Daily', 'None'),
(15, TRUE, 'Never', 'Moderate'),
(16, FALSE, 'Weekly', 'Light'),
(17, FALSE, 'Never', 'None'),
(18, FALSE, 'Daily', 'None'),
(19, TRUE, 'Monthly', 'Heavy'),
(20, FALSE, 'Weekly', 'Moderate'),
(21, FALSE, 'Weekly', 'Light'),
(22, TRUE, 'Never', 'Heavy'),
(23, FALSE, 'Weekly', 'Light'),
(24, FALSE, 'Daily', 'None'),
(25, FALSE, 'Weekly', 'Moderate'),
(26, FALSE, 'Weekly', 'Light'),
(27, FALSE, 'Never', 'None'),
(28, FALSE, 'Daily', 'None'),
(29, TRUE, 'Never', 'Moderate'),
(30, FALSE, 'Weekly', 'Light'),
(31, FALSE, 'Weekly', 'Light'),
(32, FALSE, 'Weekly', 'Moderate'),
(33, FALSE, 'Weekly', 'None'),
(34, FALSE, 'Daily', 'Light'),
(35, FALSE, 'Weekly', 'Light'),
(36, TRUE, 'Never', 'Heavy'),
(37, FALSE, 'Monthly', 'Light'),
(38, FALSE, 'Weekly', 'Moderate'),
(39, FALSE, 'Never', 'None'),
(40, FALSE, 'Daily', 'None'),
(41, FALSE, 'Weekly', 'Light'),
(42, TRUE, 'Never', 'Moderate'),
(43, FALSE, 'Weekly', 'Light'),
(44, FALSE, 'Weekly', 'Light'),
(45, FALSE, 'Weekly', 'Light'),
(46, FALSE, 'Weekly', 'Moderate'),
(47, FALSE, 'Daily', 'None'),
(48, TRUE, 'Never', 'Heavy'),
(49, FALSE, 'Weekly', 'Light'),
(50, FALSE, 'Daily', 'None');

-- ========================================
-- Insert Sample Data: Doctors
-- ========================================
INSERT INTO doctors (doctor_name, specialty, years_experience) VALUES
('Dr. Sarah Mitchell', 'Cardiology', 15),
('Dr. James Peterson', 'General Practice', 22),
('Dr. Emily Chen', 'Internal Medicine', 18),
('Dr. Michael Brown', 'Cardiology', 12),
('Dr. Jennifer Lopez', 'Endocrinology', 20),
('Dr. David Kim', 'General Practice', 8),
('Dr. Rachel Green', 'Pulmonology', 14),
('Dr. Thomas Wright', 'Internal Medicine', 25),
('Dr. Amanda Taylor', 'Cardiology', 10),
('Dr. Robert Anderson', 'General Practice', 16);

-- ========================================
-- Insert Sample Data: Appointments
-- ========================================
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_type, notes) VALUES
(1, 1, '2025-10-15', 'Annual Checkup', 'High blood pressure noted'),
(2, 2, '2025-10-14', 'Follow-up', 'General health good'),
(3, 3, '2025-10-13', 'Annual Checkup', 'Blood pressure elevated'),
(4, 1, '2025-10-12', 'Consultation', 'Routine cardiac screening'),
(5, 2, '2025-10-11', 'Annual Checkup', 'Patient in good health'),
(6, 4, '2025-10-10', 'Follow-up', 'Blood pressure stable'),
(7, 5, '2025-10-09', 'Consultation', 'Discussed weight management'),
(8, 2, '2025-10-08', 'Annual Checkup', 'All vitals normal'),
(9, 1, '2025-10-07', 'Follow-up', 'High BP requires monitoring'),
(10, 3, '2025-10-06', 'Annual Checkup', 'Healthy patient'),
(11, 7, '2025-10-05', 'Consultation', 'Smoking cessation counseling'),
(12, 2, '2025-10-04', 'Annual Checkup', 'General health good'),
(13, 3, '2025-10-03', 'Follow-up', 'Vitals within normal range'),
(14, 6, '2025-10-02', 'Annual Checkup', 'Young and healthy'),
(15, 1, '2025-10-01', 'Consultation', 'Cardiac risk assessment'),
(16, 4, '2025-09-30', 'Follow-up', 'Blood pressure stable'),
(17, 2, '2025-09-29', 'Annual Checkup', 'Elderly patient monitoring'),
(18, 6, '2025-09-28', 'Annual Checkup', 'Healthy young adult'),
(19, 7, '2025-09-27', 'Consultation', 'Smoking cessation program'),
(20, 3, '2025-09-26', 'Follow-up', 'Vitals normal'),
(21, 2, '2025-09-25', 'Annual Checkup', 'General health assessment'),
(22, 1, '2025-09-24', 'Consultation', 'Cardiac screening for smoker'),
(23, 6, '2025-09-23', 'Follow-up', 'Patient doing well'),
(24, 3, '2025-09-22', 'Annual Checkup', 'All metrics normal'),
(25, 5, '2025-09-21', 'Consultation', 'Metabolic panel review'),
(26, 4, '2025-09-20', 'Follow-up', 'BP monitoring continues'),
(27, 2, '2025-09-19', 'Annual Checkup', 'Elderly patient checkup'),
(28, 6, '2025-09-18', 'Annual Checkup', 'Young and active'),
(29, 7, '2025-09-17', 'Consultation', 'Respiratory health review'),
(30, 3, '2025-09-16', 'Follow-up', 'Patient stable'),
(1, 1, '2025-08-15', 'Follow-up', 'BP medication adjusted'),
(5, 2, '2025-08-11', 'Follow-up', 'Six-month checkup'),
(9, 1, '2025-07-07', 'Consultation', 'BP still elevated'),
(11, 7, '2025-07-05', 'Follow-up', 'Still smoking, needs support'),
(15, 1, '2025-07-01', 'Follow-up', 'Cardiac health improving'),
(22, 1, '2025-06-24', 'Follow-up', 'Urged to quit smoking'),
(19, 7, '2025-06-27', 'Follow-up', 'Progress in cessation program'),
(27, 2, '2025-06-19', 'Follow-up', 'Elderly care monitoring'),
(29, 7, '2025-06-17', 'Follow-up', 'Respiratory function stable'),
(36, 1, '2025-06-10', 'Consultation', 'Cardiac risk due to smoking');



SHOW TABLES;
SELECT 'Database setup complete! Ready for JOIN practice.' AS Status;