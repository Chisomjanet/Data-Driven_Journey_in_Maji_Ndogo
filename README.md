# Maji Ndogo Project 1: SQL Data Exploration & Data Cleaning

## Project Overview

This project is part of my SQL learning and data analytics journey, focused on exploring and cleaning data from the **Maji Ndogo Water Services Database**.

The project involves using SQL to investigate water service records, examine water source information, retrieve water quality data, identify inconsistencies in pollution records, and perform data cleaning operations to improve data accuracy and consistency.

Through this project, I applied practical SQL techniques to work with relational database tables, filter records based on specific conditions, investigate data quality issues, and update inaccurate records.

## Project Objectives

The main objectives of this project were to:

- Explore the structure and contents of the Maji Ndogo database.
- Retrieve relevant information from different database tables.
- Identify different types of water sources.
- Investigate records with unusually long water collection queue times.
- Examine water quality and pollution records.
- Identify inconsistencies in water pollution descriptions and results.
- Clean and standardise inaccurate records.
- Validate data cleaning operations before applying changes to the original table.

## Tools & Technologies

- **Database Management System:** MySQL
- **SQL Environment:** MySQL Workbench
- **Programming Language:** SQL
- **Version Control:** Git and GitHub

## Database Tables Explored

The project involved working with the following tables:

| Table | Description |
|---|---|
| `location` | Contains location-related information. |
| `visits` | Contains records of visits to water sources. |
| `water_source` | Contains information about different water sources. |
| `water_quality` | Contains water quality assessment records. |
| `well_pollution` | Contains information about well pollution and contamination. |

## Key Tasks & SQL Techniques Applied

### 1. Database Exploration

- Retrieved all available tables in the database using `SHOW TABLES`.
- Explored the contents of the `location`, `visits`, and `water_source` tables.
- Retrieved distinct water source types using `SELECT DISTINCT`.
- Selected specific columns to obtain relevant information from the water source table.

### 2. Data Filtering and Retrieval

Used SQL filtering techniques to investigate specific records, including:

- Identifying visits where the queue time exceeded 500 minutes.
- Retrieving home tap records with a subjective quality score of 10 and a second visit count.
- Filtering well pollution records where the result was classified as clean but the biological contamination value exceeded 0.01.
- Limiting query results to retrieve a smaller sample of records.

### 3. Data Cleaning and Standardisation

Identified and corrected inconsistencies in the `well_pollution` table.

The cleaning operations included:

- Standardising the description `Clean Bacteria: E. coli` to `Bacteria: E. coli`.
- Standardising the description `Clean Bacteria: Giardia Lamblia` to `Bacteria: Giardia Lamblia`.
- Reclassifying records labelled as `Clean` to `Contaminated: Biological` where the biological value exceeded 0.01.

### 4. Data Validation

Before applying the cleaning operations to the original table, I created a temporary copy named `well_pollution_copy`.

I performed the following operations:

- Created a copy of the original pollution table using `CREATE TABLE AS SELECT`.
- Applied the cleaning operations to the copied table.
- Used filtering conditions and the `LIKE` operator to check whether the identified inconsistencies had been corrected.
- Dropped the temporary table after the validation process.
- Applied the verified corrections to the original `well_pollution` table.

## SQL Concepts Demonstrated

The following SQL concepts and statements were applied throughout the project:

- `SELECT` – Retrieving data from database tables.
- `SHOW TABLES` – Exploring database tables.
- `DISTINCT` – Identifying unique values.
- `WHERE` – Filtering records based on specified conditions.
- `AND` – Combining multiple filtering conditions.
- `LIMIT` – Restricting the number of returned records.
- `UPDATE` – Modifying existing records.
- `SET` – Assigning new values to columns.
- `CREATE TABLE AS SELECT` – Creating a table from an existing dataset.
- `LIKE` – Searching for records that match a specified pattern.
- `DROP TABLE` – Removing a temporary table.
- `SQL Safe Updates` – Managing MySQL safe update restrictions.

## Project Outcomes

By completing this project, I was able to:

1. Explore and retrieve information from multiple tables within a relational database.
2. Apply filtering conditions to investigate specific water service records.
3. Identify inconsistencies in water pollution descriptions and classifications.
4. Standardise inaccurate descriptions and correct pollution classifications.
5. Practise validating data cleaning operations using a temporary table before updating the original dataset.
6. Strengthen my practical understanding of SQL data manipulation and data quality management.

## Repository Structure

```text
Maji-Ndogo-Project-1/
│
├── Maji_Ndogo_Project_1.sql
│
└── README.md
```

## How to Run This Project

To explore and execute the queries in this project:

1. Install MySQL Server and MySQL Workbench.
2. Obtain and set up the Maji Ndogo database.
3. Ensure the database is named `md_water_services`.
4. Open MySQL Workbench and connect to your MySQL server.
5. Open `Maji_Ndogo_Project_1.sql`.
6. Execute the queries to explore the database and perform the data cleaning operations.

**Note:** The SQL script works with the existing Maji Ndogo database and its tables. The dataset itself is not included in this repository.

Also, the script contains `UPDATE` statements that modify the original `well_pollution` table. It is advisable to work with a backup of the database before executing these statements.

## Key Takeaway

This project strengthened my ability to use SQL for practical data exploration, data retrieval, data quality investigation, and data cleaning.

It also improved my understanding of how to approach inconsistencies in real-world datasets and the importance of validating changes before modifying original records.

## Author

**Chisom**

Aspiring Data Analyst | SQL | MySQL | Power BI | Excel

I am continuously developing my analytical and technical skills through hands-on projects, with a focus on transforming raw data into accurate, reliable, and meaningful information.

**Thank you for taking the time to explore my project!**
