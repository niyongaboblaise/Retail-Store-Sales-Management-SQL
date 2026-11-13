# 🏪 Retail Store Sales Management and Performance Analysis

## 📌 Project Overview

This project focuses on designing and implementing a relational database for a retail business using **PostgreSQL**. It demonstrates how SQL can be used to manage, retrieve, and analyse business data to support effective decision-making.

The database manages information about customers, products, employees, branches, regions, and sales transactions.

## 🎯 Project Objectives

- Design and implement a relational database.
- Create an Entity Relationship Diagram (ERD).
- Retrieve related records using SQL JOINs.
- Analyse product sales performance.
- Identify the top three customers in each region.
- Evaluate employee and branch performance.
- Analyse customer purchasing behaviour.
- Calculate monthly sales differences.
- Apply SQL window functions for advanced data analysis.

## 🛠️ Technologies Used

- **Database:** PostgreSQL
- **Database Tool:** pgAdmin 4
- **Language:** SQL

## 🗄️ Database Structure

The database contains seven main tables:

| Table        | Description                             |
| ------------ | --------------------------------------- |
| Regions      | Stores geographical region information. |
| Branches     | Stores branch information.              |
| Employees    | Stores employee records.                |
| Customers    | Stores customer information.            |
| Products     | Stores product details.                 |
| Sales_Orders | Stores sales transactions.              |
| Order_Items  | Stores products included in each order. |

## 🔗 Entity Relationship Diagram (ERD)

The database follows a relational structure with primary keys and foreign keys connecting the seven tables.

The relationships include:

- Regions to Branches
- Regions to Customers
- Branches to Employees
- Branches to Sales Orders
- Employees to Sales Orders
- Customers to Sales Orders
- Sales Orders to Order Items
- Products to Order Items

## 📊 SQL Concepts Implemented

### 1. SQL JOINs

- INNER JOIN
- LEFT JOIN

### 2. Ranking Window Functions

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PERCENT_RANK()

### 3. Aggregate Window Functions

- SUM() OVER()
- AVG() OVER()

### 4. Analytical Window Functions

- LAG()

### 5. Distribution Window Functions

- NTILE(4)
- CUME_DIST()

## 📈 Business Analysis

The project answers important business questions, including:

1. Which products generate the highest sales revenue?
2. Who are the top three customers in each region?
3. Which employees generate the highest sales?
4. Which branch performs best?
5. Which customers have never made purchases?
6. How do monthly sales change over time?
7. How can customers be divided into four spending groups?
8. How are product sales distributed?

## ⚙️ Installation and Usage

1. Install PostgreSQL and pgAdmin 4.

2. Clone this repository:

   ```bash
   git clone https://github.com/NIYONGABOBLAISE/Retail-Store-Sales-Management-SQL.git
   ```

3. Open pgAdmin 4.

4. Create a new database named:

   ```sql
   CREATE DATABASE Retail_Store_Management;
   ```

5. Open the SQL script in pgAdmin.

6. Execute the SQL statements in the following order:

   - Database and table creation.
   - Sample data insertion.
   - SQL JOIN queries.
   - Window function queries.
   - Business analysis queries.

## 💡 Expected Outcomes

This project demonstrates practical database management and SQL analytical skills. It provides insights into sales trends, customer spending, product performance, employee productivity, and branch performance.

## 📄 License

This project is developed for educational and academic purposes.
