# SQL Fundamentals Project

A collection of SQL exercises focused on building strong foundations in relational database design, data insertion, and essential querying techniques.

---

## Overview

This project contains **three SQL mini-projects** completed as part of a database fundamentals course. Together, they demonstrate how to:

- Create databases and tables  
- Insert data safely and efficiently  
- Prepare datasets for SQL systems  
- Detect missing values  
- Use filtering, grouping, and aggregation  
- Build relationships between tables using keys  

**Platform:** DBeaver  
**Language:** SQL  
**RDBMS:** MySQL  

---

## Project Files

### All `.sql` scripts and excel files are available in the repository’s **Code** section.

---

# Code 1: Table Creation & Data Insertion

## Data Preparation Workflow

### 1️⃣ Create the Database  
Set up a dedicated environment to keep all tables organized.
  
> CREATE DATABASE BIACLASSB;

### 2️⃣ Create the Table Structure
Defined a Toyota table with text, numeric, and year-based fields (VARCHAR, NUMERIC, SMALLINT). This establishes the "shape" of the data before inserting anything.

### 3️⃣ Prepare the Dataset for SQL

The original dataset was in Excel. To convert rows into SQL-ready INSERT statements:   
- Used CONCAT formulas to generate SQL automatically
- Wrapped text values in ' '
- Left numeric values unquoted
- Ensured each row followed the correct column order   

This method minimizes mistakes and speeds up data import.

### 4️⃣ Insert Data into the Table

Inserted the first row using:
> INSERT INTO Toyota VALUES (...);

All remaining rows used explicit column lists:
> INSERT INTO Toyota (column1, column2, ..., columnN)
VALUES (...), (...), (...);

Benefits:
- Ensures correct value-to-column alignment   
- Future-proofs inserts if table structure changes   
- Improves readability   

### 5️⃣ Validate Data
Randomly compared Excel rows with SQL output to ensure correct insertion.

---

# Code 2: Data Insertion & Missing Value Detection

## Data Preparation Workflow

### 1️⃣ Create the Table
Defined a Books table with fields such as:
- ISBN   
- Title   
- Publication Date   
- Publisher ID   
- Cost   
- Retail Price   
- Discount   
- Category   

### 2️⃣ Insert Data
Inserted multiple book records. Some fields intentionally contained NULL values to enable data-quality checks.

### 3️⃣ Detect Missing Values
3.1 Identify rows with any missing data
3.2 Find missing values in a specific column
Example: missing Discount.
3.3 Count missing values per column
Generated a summary count of NULLs for all columns.

### 4️⃣ Basic Data Retrieval & Filtering
Key SQL tasks included:
- Retrieve all books  
- Compute derived values (e.g., Cost * 1.20)  
- Filter using thresholds  
- Use AND / OR conditions  
- Exclude values using !=  

### 5️⃣ Aggregation & Grouping
Performed summary analysis:
- Minimum cost  
- Combined min/max metrics  
- Group by category  
- Conditional grouping (e.g., discount > threshold)  
- Multi-column grouping  

### 6️⃣ Practical Business Queries
Examples include:
- Finding min/max retail prices  
- Identifying books where retail > 2× cost

---

# Code 3: Company Database — Departments, Employees & Projects

##Data Preparation Workflow

### 1️⃣ Create the Tables
The project uses three relational tables:

a. Departments
- One row per department  
- Department_ID as primary key  

b. Employees
- Employee details  
- Department_ID as a foreign key  

c. Projects
- Project information  
- Linked to departments using Department_ID  
- Introduces relational concepts such as primary keys, foreign keys, and referential integrity.  

### 2️⃣ Prepare Dataset for SQL
Excel was used to:
- List all departments, employees, and projects
- Auto-generate SQL INSERT lines using CONCAT
- Apply correct quoting for text and numeric fields

This reduces manual errors during data import.

### 3️⃣ Insert Data
Used both single-row and multi-row inserts:
> INSERT INTO Employees (Employee_ID, Employee_Name, Department_ID)  
> VALUES (...), (...), (...);

Benefits:
- Clear value alignment  
- Readable SQL  
- Safe if table structure evolves  

### 4️⃣ Validate Dataset
Checked random samples to ensure:
- Values matched the source dataset  
- No misalignment occurred during import 

---

## Key Learning Outcomes
Across all three SQL exercises, this project demonstrates:
- How to structure and organize databases  
- How to safely insert and validate data  
- How to detect missing values  
- How to perform filtering, sorting, and conditional logic  
- How to use grouping and aggregation  
- How to design relational tables with proper keys  

These are essential foundational SQL skills for:
- Data analysis  
- Reporting  
- Backend development  
- Database management
