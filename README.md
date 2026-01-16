# 🏥 Healthcare Database Management

## 📋 Project Overview
This project demonstrates the design and implementation of a relational database system for a healthcare provider using SQL queries. The goal was to create queries which help in appointment scheduling and patient monitoring.

## 🗂️ Database Architecture
The system utilizes a relational schema with the following tables:
* **Patients**: Core demographic data, id, creation date of the record.
* **Doctors**: Doctor's name, specialties, and years of experience.
* **Appointments**: Appointment id, patient id, doctors id, appointment schedules, appointment type, and remarks on why appointments were scheduled.
* **Medical Records**: Primary clinical vitals (heart rate, blood pressure, temperature), record id, and patient id.
* **Lifestyle**: Lifestyle id, patient id, smoking habit, exercise frequency, and alcohol consumption.

---

## 🎯 Main Objectives

### 1. Clinical Risk Stratification
To improve patient outcomes, I wrote queries that identify high-risk individuals by joining medical vitals with lifestyle data. This automatically flags patients at high risk to inform the doctor.
* **Criteria**: Patients who have high blood pressure and is a smoker, inactive, or moderate/heavy drinkers were classified as **High Risk**.

### 2. Operational Efficiency
Determine the workload of the doctors to see who are over-scheduled and which have years of experience but low appointment counts, allowing for better resource allocation.

### 3. Appointment and Vital Trends
This query helps a clinic manager prepare for the day by seeing why a patient is coming in and what their last recorded vitals were.

---

## 📊 Key Insights & Strategic Decisions

### 1. Preventative Care
* **Data Finding**: Identified **9 patients** who are current smokers with systolic blood pressure above 135 mmHg.
* **Strategic Decision**: The clinic should launch a **Targeted Cardiovascular Wellness Program**. Administrative staff can proactively schedule these 9 patients for specialized screenings and enroll them in smoking cessation counseling before a critical health event occurs.

### 2. Operational Staffing
* **Data Finding**: The workload report reveals an uneven distribution of appointments, with some doctors (like Dr. Sarah Mitchell) handling high volumes while others have zero active appointments.
* **Strategic Decision**: Management should perform **Shift Balancing**. By identifying "Available" doctors through the audit query, the clinic can reassign overflow patients to underutilized staff, reducing patient wait times and preventing physician burnout.

### 3. Service Line Optimization
* **Data Finding**: Analysis of the **40 appointments** shows the percentage of "Annual Checkups" vs. "Follow-ups" and "Consultations."
* **Strategic Decision**: **Infrastructure Planning**. If Annual Checkups represent the majority of volume, management should prioritize the purchase of diagnostic tools (e.g., EKG machines). If "Follow-ups" are high, the clinic should invest in a **Telehealth Platform** to handle routine check-ins remotely.

### 4. System Revenue & Retention Audit
* **Data Finding**: Identified patients who were in the database but have no scheduled appointments.
* **Strategic Decision**: Launch a **Patient Re-engagement Campaign**. The marketing or administrative team can use this list to reach out to unscheduled patients for their yearly physicals, ensuring consistent care and protecting the clinic's recurring revenue.

---

## 🛠️ Technical Skills Demonstrated

* **Relational Database Integrity**: Managed a 5-table schema using Primary and Foreign Keys to ensure data consistency.
* **Advanced Query Logic**: Used `UNION` to simulate **Full Outer Joins** for comprehensive auditing of orphaned records.
* **Conditional Formatting**: Applied `CASE` statements to categorize patient risk levels and doctor assignment statuses.
* **Data Aggregation**: Utilized `GROUP BY`, `COUNT`, and `ROUND` for high-level
