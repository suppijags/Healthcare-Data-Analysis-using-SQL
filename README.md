# Healthcare-Data-Analysis-using-SQL

This project demonstrates a comprehensive analysis of healthcare datasets using SQL, including immunizations, patient demographics, and medical encounters. The SQL queries were designed to uncover insights related to patient treatment, healthcare costs, and disease prevalence.

**Project Overview**

The project involves creating SQL queries that answer key business questions for a healthcare dataset. The data includes tables related to immunizations, patient encounters, and patient demographics. The analysis focuses on various aspects such as:

1. Identifying immunization patterns

2. Calculating healthcare costs

3. Understanding patient demographics and chronic conditions prevalence

4. Extracting insights using SQL window functions, grouping, filtering, and aggregating

**Key Features**



1. Immunizations Analysis:


Identified patients who received specific vaccines (e.g., flu, herpes zoster)
Analyzed the frequency and trends of immunizations over time
Determined how many patients received multiple immunizations on the same day



2. Patient Demographics:


Analyzed patient age distribution
Explored the income distribution across different racial demographics
Determined marital status percentages and the prevalence of chronic conditions by region



3. Medical Encounters:


Calculated total healthcare costs per patient and ranked them based on expenses
Identified the most common encounter types (e.g., hospital or ambulatory) for specific conditions
Analyzed costs incurred by patients with multiple hospital encounters


**SQL Techniques Used**

Window Functions: RANK(), SUM() OVER, COUNT() OVER for ranking and cumulative cost analysis.

Aggregate Functions: COUNT(), SUM(), AVG() for statistical insights.

JOIN Operations: Multiple JOIN queries to combine data from different tables.

Filtering and Grouping: Utilized GROUP BY, HAVING, and WHERE clauses for advanced data filtering.

Date and Time Functions: Used EXTRACT(), AGE() to calculate date differences and age-based analysis.

Subqueries and CTEs: WITH clause (CTE) for complex queries involving multi-step data transformations.
