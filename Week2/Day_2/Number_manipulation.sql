**Schema (MySQL v5.7)**

    -- ============================
    -- SAMPLE TABLE STRUCTURE
    -- ============================
    CREATE TABLE employee_salary (
      emp_id INT PRIMARY KEY,
      emp_name VARCHAR(50),
      base_salary DECIMAL(10,2),
      bonus DECIMAL(10,2),
      tax_percent DECIMAL(5,2),
      experience_years INT
    );
    
    -- ============================
    -- INSERT SAMPLE DATA
    -- ============================
    INSERT INTO employee_salary VALUES
    (1, 'Karthik', 75000.75, 5000.50, 10.00, 6),
    (2, 'Veena', 65000.40, 4000.25, 8.50, 4),
    (3, 'Ravi', 85000.90, 6000.75, 12.00, 8),
    (4, 'Anil', 70000.10, NULL, 9.00, 5),
    (5, 'Suresh', 60000.55, 3000.30, 7.50, 3);
    
    

---

**Query #1**

    -- NUMERIC FUNCTIONS IN MYSQL
    
    --  ABS – Absolute Value
    SELECT ABS(-100);

| ABS(-100) |
| --------- |
| 100       |

---
**Query #2**

    --  ROUND – Round to Decimals
    SELECT emp_name, ROUND(base_salary, 0) AS rounded_salary_0 FROM employee_salary;

| emp_name | rounded_salary_0 |
| -------- | ---------------- |
| Karthik  | 75001            |
| Veena    | 65000            |
| Ravi     | 85001            |
| Anil     | 70000            |
| Suresh   | 60001            |

---
**Query #3**

    SELECT emp_name, ROUND(base_salary, 2) AS rounded_salary_2 FROM employee_salary;

| emp_name | rounded_salary_2 |
| -------- | ---------------- |
| Karthik  | 75000.75         |
| Veena    | 65000.4          |
| Ravi     | 85000.9          |
| Anil     | 70000.1          |
| Suresh   | 60000.55         |

---
**Query #4**

    --  CEILING / CEIL – Round Up
    SELECT emp_name, CEIL(base_salary) AS ceil_salary FROM employee_salary;

| emp_name | ceil_salary |
| -------- | ----------- |
| Karthik  | 75001       |
| Veena    | 65001       |
| Ravi     | 85001       |
| Anil     | 70001       |
| Suresh   | 60001       |

---
**Query #5**

    --  FLOOR – Round Down
    SELECT emp_name, FLOOR(base_salary) AS floor_salary FROM employee_salary;

| emp_name | floor_salary |
| -------- | ------------ |
| Karthik  | 75000        |
| Veena    | 65000        |
| Ravi     | 85000        |
| Anil     | 70000        |
| Suresh   | 60000        |

---
**Query #6**

    --  TRUNCATE – Cut Decimals (No Rounding)
    SELECT emp_name, TRUNCATE(base_salary, 1) AS truncated_salary FROM employee_salary;

| emp_name | truncated_salary |
| -------- | ---------------- |
| Karthik  | 75000.7          |
| Veena    | 65000.4          |
| Ravi     | 85000.9          |
| Anil     | 70000.1          |
| Suresh   | 60000.5          |

---
**Query #7**

    --  MOD – Remainder
    SELECT emp_name, MOD(experience_years, 2) AS years_mod_2 FROM employee_salary;

| emp_name | years_mod_2 |
| -------- | ----------- |
| Karthik  | 0           |
| Veena    | 0           |
| Ravi     | 0           |
| Anil     | 1           |
| Suresh   | 1           |

---
**Query #8**

    --  POWER / POW – Exponent
    SELECT POWER(2, 3) AS two_cubed;

| two_cubed |
| --------- |
| 8         |

---
**Query #9**

    SELECT POW(5, 2) AS five_squared;

| five_squared |
| ------------ |
| 25           |

---
**Query #10**

    --  SQRT – Square Root
    SELECT SQRT(64) AS sqrt_64;

| sqrt_64 |
| ------- |
| 8       |

---
**Query #11**

    --  SIGN – Sign of Number
    SELECT emp_name, SIGN(base_salary) AS sign_salary FROM employee_salary;

| emp_name | sign_salary |
| -------- | ----------- |
| Karthik  | 1           |
| Veena    | 1           |
| Ravi     | 1           |
| Anil     | 1           |
| Suresh   | 1           |

---
**Query #12**

    --  RAND – Random Number
    SELECT RAND() AS random_number;

| random_number      |
| ------------------ |
| 0.6734652395113048 |

---
**Query #13**

    --  FORMAT – Format Number as String
    SELECT emp_name, FORMAT(base_salary, 2) AS formatted_salary FROM employee_salary;

| emp_name | formatted_salary |
| -------- | ---------------- |
| Karthik  | 75,000.75        |
| Veena    | 65,000.40        |
| Ravi     | 85,000.90        |
| Anil     | 70,000.10        |
| Suresh   | 60,000.55        |

---
**Query #14**

    --  GREATEST – Maximum Value
    SELECT emp_name, GREATEST(base_salary, IFNULL(bonus, 0)) AS max_value FROM employee_salary;

| emp_name | max_value |
| -------- | --------- |
| Karthik  | 75000.75  |
| Veena    | 65000.4   |
| Ravi     | 85000.9   |
| Anil     | 70000.1   |
| Suresh   | 60000.55  |

---
**Query #15**

    --  LEAST – Minimum Value
    SELECT emp_name, LEAST(base_salary, IFNULL(bonus, 0)) AS min_value FROM employee_salary;

| emp_name | min_value |
| -------- | --------- |
| Karthik  | 5000.5    |
| Veena    | 4000.25   |
| Ravi     | 6000.75   |
| Anil     | 0.0       |
| Suresh   | 3000.3    |

---
