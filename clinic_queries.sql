USE health_db;

-- Query for high-risk patients on hypertension
SELECT 
    p.patient_id, 
    p.first_name, 
    p.last_name,
    m.systolic_bp,
    m.diastolic_bp,
    l.is_smoker, 
    l.exercise_frequency,
    l.alcohol_consumption,
    CASE
        WHEN m.systolic_bp >= 130 AND m.diastolic_bp >= 80 THEN 'HIGH RISK'
        ELSE 'Normal'
    END AS hypertension_status
FROM patients AS p
INNER JOIN medical_records AS m ON p.patient_id = m.patient_id
INNER JOIN lifestyle AS l ON p.patient_id = l.patient_id
WHERE l.is_smoker = 1 
   OR l.exercise_frequency = 'Never' 
   OR l.alcohol_consumption IN ('Moderate', 'Heavy');

-- Query that calculates total appointments by doctor 
SELECT 
    d.doctor_id,
    d.doctor_name, 
    d.specialty,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors AS d
LEFT JOIN appointments AS a ON d.doctor_id = a.doctor_id 
GROUP BY d.doctor_id, d.doctor_name, d.specialty
ORDER BY total_appointments DESC;

-- Query that calculates type of appointments
SELECT 
    appointment_type, 
    COUNT(appointment_id) AS total_count,
    ROUND(COUNT(appointment_id) * 100.0 / (SELECT COUNT(*) FROM appointments), 2) AS percentage_of_total_volume
FROM appointments 
GROUP BY appointment_type
ORDER BY total_count DESC;

-- Query that identifies patient with no doctors and available doctors
SELECT 
    p.first_name, 
    p.last_name, 
    d.doctor_name, 
    d.specialty,
    a.appointment_date,
    CASE 
        WHEN d.doctor_name IS NULL THEN 'Action Required: No Doctor Assigned'
        ELSE 'Scheduled'
    END AS assignment_status
FROM patients AS p
LEFT JOIN appointments AS a ON p.patient_id = a.patient_id
LEFT JOIN doctors AS d ON a.doctor_id = d.doctor_id
UNION
SELECT 
    p.first_name, 
    p.last_name, 
    d.doctor_name, 
    d.specialty,
    a.appointment_date,
    CASE 
        WHEN p.first_name IS NULL THEN 'Available'
        ELSE 'Scheduled'
    END AS assignment_status
FROM doctors AS d
LEFT JOIN appointments AS a ON d.doctor_id = a.doctor_id 
LEFT JOIN patients AS p ON a.patient_id = p.patient_id