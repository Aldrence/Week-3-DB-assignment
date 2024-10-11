-- USE hospital;
-- Question 1.1
SELECT COUNT(*) AS total_admissions
FROM admissions;

-- Question 1.2
SELECT AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS average_length_of_stay
FROM admissions
JOIN discharges ON admissions.admission_id = discharges.admission_id;

-- Question 2.1
SELECT primary_diagnosis, COUNT(*) AS total_admissions
FROM admissions
GROUP BY primary_diagnosis;

-- Question 2.2
SELECT admissions.service, AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS average_length_of_stay
FROM admissions
JOIN discharges ON admissions.admission_id = discharges.admission_id
GROUP BY admissions.service;

-- Question 2.3
SELECT discharge_disposition, COUNT(*) AS number_of_discharges
FROM discharges
GROUP BY discharge_disposition;

-- Question 3.1
SELECT service, COUNT(*) AS total_number_of_admissions
FROM admissions
GROUP BY service
HAVING COUNT(*) > 5;

-- Question 3.2 
SELECT AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS average_length_of_stay
FROM admissions
JOIN discharges ON admissions.admission_id = discharges.admission_id
WHERE admissions.primary_diagnosis = 'Stroke';

-- Question 4.1
SELECT acuity, COUNT(*) AS total_visits
FROM ed_visits
GROUP BY acuity;

-- Question 4.2
SELECT primary_diagnosis, service, COUNT(*) AS total_admissions 
FROM admissions
 GROUP BY primary_diagnosis, service;

-- Question 5.1
SELECT 
DATE_FORMAT(admission_date, '%Y-%M') AS admission_month, 
COUNT(admission_date) AS total_admission
FROM admissions
GROUP BY DATE_FORMAT(admission_date, '%Y-%M');

-- Question 5.2
SELECT primary_diagnosis, MAX(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS max_length_of_stay
FROM admissions
JOIN discharges ON admissions.admission_id = discharges.admission_id
GROUP BY primary_diagnosis;

-- Bonus Challange
SELECT service, 
    SUM(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS total_length_of_stay, 
    AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS average_length_of_stay
FROM admissions
JOIN discharges ON admissions.admission_id = discharges.admission_id
GROUP BY service
ORDER BY average_length_of_stay DESC;