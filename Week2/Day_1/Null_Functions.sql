**Schema (MySQL v5.7)**

    -- ============================
    -- SAMPLE TABLES (WITH NULL VALUES)
    -- ============================
    
    -- Table 1: Employees
    CREATE TABLE Employees (
        emp_id INT,
        name VARCHAR(50),
        salary INT,
        bonus INT,
        manager_id INT
    );
    
    INSERT INTO Employees VALUES
    (1, 'Amit', 50000, NULL, 101),
    (2, 'John', NULL, 5000, 102),
    (3, 'Sara', 60000, NULL, NULL),
    (4, 'David', NULL, NULL, 103),
    (5, 'Priya', 45000, 3000, 101),
    (6, 'Kiran', NULL, NULL, NULL),
    (7, 'Ravi', 70000, 7000, 102),
    (8, 'Neha', NULL, 2000, NULL);
    
    -- Table 2: Orders
    CREATE TABLE Orders (
        order_id INT,
        customer_name VARCHAR(50),
        amount INT,
        discount INT,
        coupon_code VARCHAR(20)
    );
    
    INSERT INTO Orders VALUES
    (101, 'Amit', 1000, NULL, 'DISC10'),
    (102, 'John', NULL, 50, NULL),
    (103, 'Sara', 2000, NULL, 'DISC20'),
    (104, 'David', NULL, NULL, NULL),
    (105, 'Priya', 1500, 100, NULL),
    (106, 'Kiran', NULL, NULL, 'DISC5'),
    (107, 'Ravi', 3000, NULL, NULL),
    (108, 'Neha', NULL, 200, 'DISC15');
    
    -- Table 3: Products
    CREATE TABLE Products (
        product_id INT,
        product_name VARCHAR(50),
        price INT,
        category VARCHAR(50),
        stock INT
    );
    
    INSERT INTO Products VALUES
    (1, 'Laptop', 50000, 'Electronics', 10),
    (2, 'Phone', NULL, 'Electronics', NULL),
    (3, 'Tablet', 30000, NULL, 5),
    (4, 'Headphones', NULL, NULL, NULL),
    (5, 'Monitor', 20000, 'Electronics', 0),
    (6, 'Keyboard', NULL, 'Accessories', 15),
    (7, 'Mouse', 500, NULL, NULL),
    (8, 'Printer', NULL, 'Electronics', 3);
    
    

---
 -- LEVEL 1 (BASIC)
**Query #1**
    
    SELECT * FROM Employees WHERE salary IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |
| 8      | Neha  |        | 2000  |            |

---
**Query #2**

    SELECT * FROM Orders WHERE discount IS NOT NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 102      | John          |        | 50       |             |
| 105      | Priya         | 1500   | 100      |             |
| 108      | Neha          |        | 200      | DISC15      |

---
**Query #3**

    SELECT * FROM Products WHERE category IS NULL;

| product_id | product_name | price | category | stock |
| ---------- | ------------ | ----- | -------- | ----- |
| 3          | Tablet       | 30000 |          | 5     |
| 4          | Headphones   |       |          |       |
| 7          | Mouse        | 500   |          |       |

---
**Query #4**

    SELECT COUNT(*) AS null_manager_count FROM Employees WHERE manager_id IS NULL;

| null_manager_count |
| ------------------ |
| 3                  |

---
 -- LEVEL 2 (ISNULL)
**Query #5**
    
    SELECT emp_id, name, IFNULL(salary,0) AS salary FROM Employees;

| emp_id | name  | salary |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 0      |
| 3      | Sara  | 60000  |
| 4      | David | 0      |
| 5      | Priya | 45000  |
| 6      | Kiran | 0      |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 0      |

---
**Query #6**

    SELECT emp_id, name, IFNULL(bonus,1000) AS bonus FROM Employees;

| emp_id | name  | bonus |
| ------ | ----- | ----- |
| 1      | Amit  | 1000  |
| 2      | John  | 5000  |
| 3      | Sara  | 1000  |
| 4      | David | 1000  |
| 5      | Priya | 3000  |
| 6      | Kiran | 1000  |
| 7      | Ravi  | 7000  |
| 8      | Neha  | 2000  |

---
**Query #7**

    SELECT order_id, IFNULL(amount,500) AS amount FROM Orders;

| order_id | amount |
| -------- | ------ |
| 101      | 1000   |
| 102      | 500    |
| 103      | 2000   |
| 104      | 500    |
| 105      | 1500   |
| 106      | 500    |
| 107      | 3000   |
| 108      | 500    |

---
**Query #8**

    SELECT product_id, IFNULL(stock,0) AS stock FROM Products;

| product_id | stock |
| ---------- | ----- |
| 1          | 10    |
| 2          | 0     |
| 3          | 5     |
| 4          | 0     |
| 5          | 0     |
| 6          | 15    |
| 7          | 0     |
| 8          | 3     |

---
  -- LEVEL 3 (COALESCE)
**Query #9**
    
    SELECT emp_id, name, COALESCE(salary, bonus) AS earnings FROM Employees;

| emp_id | name  | earnings |
| ------ | ----- | -------- |
| 1      | Amit  | 50000    |
| 2      | John  | 5000     |
| 3      | Sara  | 60000    |
| 4      | David |          |
| 5      | Priya | 45000    |
| 6      | Kiran |          |
| 7      | Ravi  | 70000    |
| 8      | Neha  | 2000     |

---
**Query #10**

    SELECT emp_id, name, COALESCE(salary, bonus, 0) AS first_available FROM Employees;

| emp_id | name  | first_available |
| ------ | ----- | --------------- |
| 1      | Amit  | 50000           |
| 2      | John  | 5000            |
| 3      | Sara  | 60000           |
| 4      | David | 0               |
| 5      | Priya | 45000           |
| 6      | Kiran | 0               |
| 7      | Ravi  | 70000           |
| 8      | Neha  | 2000            |

---
**Query #11**

    SELECT product_id, product_name, COALESCE(price,1000) AS price FROM Products;

| product_id | product_name | price |
| ---------- | ------------ | ----- |
| 1          | Laptop       | 50000 |
| 2          | Phone        | 1000  |
| 3          | Tablet       | 30000 |
| 4          | Headphones   | 1000  |
| 5          | Monitor      | 20000 |
| 6          | Keyboard     | 1000  |
| 7          | Mouse        | 500   |
| 8          | Printer      | 1000  |

---
**Query #12**

    SELECT order_id, customer_name, COALESCE(amount, discount, 0) AS payment FROM Orders;

| order_id | customer_name | payment |
| -------- | ------------- | ------- |
| 101      | Amit          | 1000    |
| 102      | John          | 50      |
| 103      | Sara          | 2000    |
| 104      | David         | 0       |
| 105      | Priya         | 1500    |
| 106      | Kiran         | 0       |
| 107      | Ravi          | 3000    |
| 108      | Neha          | 200     |

---
-- LEVEL 4 (NULLIF)
**Query #13**

    SELECT emp_id, NULLIF(salary,0) AS salary FROM Employees;

| emp_id | salary |
| ------ | ------ |
| 1      | 50000  |
| 2      |        |
| 3      | 60000  |
| 4      |        |
| 5      | 45000  |
| 6      |        |
| 7      | 70000  |
| 8      |        |

---
**Query #14**

    SELECT order_id, NULLIF(discount,0) AS discount FROM Orders;

| order_id | discount |
| -------- | -------- |
| 101      |          |
| 102      | 50       |
| 103      |          |
| 104      |          |
| 105      | 100      |
| 106      |          |
| 107      |          |
| 108      | 200      |

---
**Query #15**

    SELECT order_id, amount / NULLIF(discount,0) AS safe_division FROM Orders;

| order_id | safe_division |
| -------- | ------------- |
| 101      |               |
| 102      |               |
| 103      |               |
| 104      |               |
| 105      | 15.0          |
| 106      |               |
| 107      |               |
| 108      |               |

---
**Query #16**

    SELECT order_id, NULLIF(coupon_code,'DISC10') AS coupon_code FROM Orders;

| order_id | coupon_code |
| -------- | ----------- |
| 101      |             |
| 102      |             |
| 103      | DISC20      |
| 104      |             |
| 105      |             |
| 106      | DISC5       |
| 107      |             |
| 108      | DISC15      |

---
    -- LEVEL 5 (REAL-TIME SCENARIOS)
**Query #17**

    
    SELECT emp_id, name, COALESCE(salary,0) + COALESCE(bonus,0) AS total_earnings FROM Employees;

| emp_id | name  | total_earnings |
| ------ | ----- | -------------- |
| 1      | Amit  | 50000          |
| 2      | John  | 5000           |
| 3      | Sara  | 60000          |
| 4      | David | 0              |
| 5      | Priya | 48000          |
| 6      | Kiran | 0              |
| 7      | Ravi  | 77000          |
| 8      | Neha  | 2000           |

---
**Query #18**

    SELECT * FROM Employees WHERE salary IS NULL AND bonus IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |

---
**Query #19**

    SELECT * FROM Products WHERE price IS NULL AND category IS NOT NULL;

| product_id | product_name | price | category    | stock |
| ---------- | ------------ | ----- | ----------- | ----- |
| 2          | Phone        |       | Electronics |       |
| 6          | Keyboard     |       | Accessories | 15    |
| 8          | Printer      |       | Electronics | 3     |

---
**Query #20**

    SELECT * FROM Orders WHERE amount IS NULL AND discount IS NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 104      | David         |        |          |             |
| 106      | Kiran         |        |          | DISC5       |

---
    -- LEVEL 6 (ADVANCED)
**Query #21**

    
    SELECT emp_id, name, COALESCE(salary, bonus, 1000) AS income FROM Employees;

| emp_id | name  | income |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 5000   |
| 3      | Sara  | 60000  |
| 4      | David | 1000   |
| 5      | Priya | 45000  |
| 6      | Kiran | 1000   |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 2000   |

---
**Query #22**

    SELECT order_id, NULLIF(discount,0) AS discount FROM Orders;

| order_id | discount |
| -------- | -------- |
| 101      |          |
| 102      | 50       |
| 103      |          |
| 104      |          |
| 105      | 100      |
| 106      |          |
| 107      |          |
| 108      | 200      |

---
**Query #23**

    SELECT order_id, (COALESCE(amount,0) - COALESCE(discount,0)) AS final_payable FROM Orders;

| order_id | final_payable |
| -------- | ------------- |
| 101      | 1000          |
| 102      | -50           |
| 103      | 2000          |
| 104      | 0             |
| 105      | 1400          |
| 106      | 0             |
| 107      | 3000          |
| 108      | -200          |

---
**Query #24**

    SELECT * FROM Employees WHERE salary IS NULL AND manager_id IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |

---
