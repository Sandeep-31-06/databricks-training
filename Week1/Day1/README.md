# Employee Management SQL Database

## 📌 Project Overview

This project demonstrates the creation and usage of a simple Employee Management Database using SQL.

The database contains three main tables:

1. Department
2. Employee
3. Project

The project includes:
- Table creation queries
- Primary and foreign key relationships
- Sample data insertion
- SQL queries for:
  - Selection
  - Filtering
  - Pattern matching
  - Date functions
  - Aggregate functions
  - Grouping
  - Joins

---

# 📂 Database Structure

## 1️⃣ Department Table

Stores department details.

| Column | Data Type | Constraints |
|---|---|---|
| department_id | INT | PRIMARY KEY |
| name | VARCHAR(50) | NOT NULL |

### Example Data

| department_id | name |
|---|---|
| 1 | IT |
| 2 | HR |
| 3 | Finance |
| 4 | Marketing |

---

## 2️⃣ Employee Table

Stores employee information.

| Column | Data Type | Constraints |
|---|---|---|
| emp_id | INT | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL |
| age | INT | - |
| salary | DECIMAL(10,2) | - |
| department_id | INT | FOREIGN KEY |
| hire_date | DATE | - |

# 📌 Concepts Covered

This project demonstrates the following SQL concepts:

---

## ✅ DDL (Data Definition Language)

- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`

---

## ✅ DML (Data Manipulation Language)

- `INSERT INTO`

---

## ✅ Filtering Queries

- `WHERE`
- `AND / OR`
- Comparison Operators

---

## ✅ Pattern Matching

Using `LIKE`

| Pattern | Meaning |
|---|---|
| `J%` | Starts with J |
| `%e` | Ends with e |
| `%a%` | Contains a |
| `_o%` | Second character is o |

---

## ✅ Date Functions

| Function | Purpose |
|---|---|
| `YEAR()` | Extract year |
| `MONTH()` | Extract month |
| `CURDATE()` | Current date |
| `DATE_SUB()` | Subtract interval |

### Example

```sql
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
```

This query selects employees hired within the last 2 years.

---

## ✅ Aggregate Functions

| Function | Purpose |
|---|---|
| `SUM()` | Total |
| `AVG()` | Average |
| `MIN()` | Minimum |
| `MAX()` | Maximum |
| `COUNT()` | Count rows |

---

## ✅ GROUP BY

Used for grouping records department-wise or year-wise.

### Example

```sql
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id;
```

---

## ✅ JOIN Operations

### INNER JOIN

Used to combine matching rows between tables.

### Example

```sql
SELECT e.*
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'IT';
```

---

# 📌 Important Edge Cases Included

This project intentionally includes edge cases for better SQL practice.

---

## Employees Without Departments

```text
Frank White → department_id = NULL
```

Useful for:

- `LEFT JOIN` practice
- `NULL` handling

---

## Projects Without Departments

```text
Project Iota → department_id = NULL
```

Useful for:

- `OUTER JOIN` practice
- Data integrity testing

---

# 📊 Sample Analytical Queries

## Average Salary Per Department

```sql
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id;
```

---

## Highest Salary Per Department

```sql
SELECT department_id, MAX(salary)
FROM Employee
GROUP BY department_id;
```

---

## Employee Count By Hiring Year

```sql
SELECT YEAR(hire_date), COUNT(*)
FROM Employee
GROUP BY YEAR(hire_date);
```

---

# 🚀 Learning Outcomes

After completing this project, you will understand:

- Relational database design
- Primary and foreign keys
- SQL joins
- Filtering data
- Aggregate functions
- Grouping
- Date handling in SQL
- Pattern matching
- Real-world database relationships
