/*What are the most frequently administered immunizations?*/
SELECT DESCRIPTION, COUNT(*) AS Administered_Count
FROM immunizations
GROUP BY DESCRIPTION
ORDER BY Administered_Count DESC
LIMIT 10;

/*Which patients have received more than 2 immunizations?*/
SELECT PATIENT, COUNT(*) AS Immunization_Count
FROM immunizations
GROUP BY PATIENT
HAVING COUNT(*) > 2;


/*How many patients have been diagnosed with a specific condition (e.g., chronic sinusitis)?*/
SELECT COUNT(DISTINCT PATIENT) AS Patient_Count
FROM conditions
WHERE CODE = '473.8';


/*What is the average time between diagnosis and resolution for conditions that have an end date?*/
SELECT AVG(TIMESTAMPDIFF(DAY, START, STOP)) AS Avg_Resolution_Time
FROM conditions
WHERE STOP IS NOT NULL;


/*How many patients have multiple diagnoses within the same year?*/
WITH Diagnoses_Per_Year AS (
    SELECT PATIENT, EXTRACT(YEAR FROM START) AS Diagnosis_Year, COUNT(*) AS Diagnosis_Count
    FROM conditions
    GROUP BY PATIENT, EXTRACT(YEAR FROM START)
)
SELECT COUNT(DISTINCT PATIENT) AS Patient_Count
FROM Diagnoses_Per_Year
WHERE Diagnosis_Count > 1;


/*What is the correlation between age and the number of medical conditions diagnosed?*/
WITH Diagnoses_Per_Patient AS (
    SELECT PATIENT, COUNT(*) AS Diagnosis_Count
    FROM conditions
    GROUP BY PATIENT
)
SELECT CORR(TIMESTAMPDIFF(YEAR, p.BIRTHDATE, CURDATE()), d.Diagnosis_Count) AS Age_Diagnosis_Correlation
FROM patients p
JOIN Diagnoses_Per_Patient d ON p.Id = d.PATIENT;


/*What is the cumulative total cost for each patient’s encounters, ordered by encounter date?*/
SELECT PATIENT, START, BASE_ENCOUNTER_COST, 
       SUM(BASE_ENCOUNTER_COST) OVER (PARTITION BY PATIENT ORDER BY START) AS Cumulative_Cost
FROM encounters
ORDER BY PATIENT, START;


/*What is the rank of each patient based on their total healthcare expenses?*/
SELECT Id, HEALTHCARE_EXPENSES, 
       RANK() OVER (ORDER BY HEALTHCARE_EXPENSES DESC) AS Expense_Rank
FROM patients;
