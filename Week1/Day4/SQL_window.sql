

-- SQL Window Functions and CTE Assignment
-- Compatible with PostgreSQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    manager_id INT NULL,
    salary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert Employees
INSERT INTO employees VALUES
(1, 'Alice Johnson', 'Sales', NULL, 70000, '2020-01-15'),
(2, 'Bob Smith', 'Sales', 1, 65000, '2021-03-20'),
(3, 'Charlie Brown', 'IT', NULL, 90000, '2019-07-01'),
(4, 'Diana Prince', 'IT', 3, 95000, '2018-11-11'),
(5, 'Ethan Hunt', 'HR', NULL, 60000, '2022-02-10'),
(6, 'Fiona Green', 'HR', 5, 58000, '2023-05-12'),
(7, 'George Miller', 'Finance', NULL, 85000, '2017-09-18'),
(8, 'Hannah Lee', 'Finance', 7, 82000, '2021-08-30');

-- Insert Customers
INSERT INTO customers VALUES
(1, 'Acme Corp', 'New York'),
(2, 'Tech Solutions', 'Chicago'),
(3, 'Global Retail', 'Dallas'),
(4, 'Blue Sky Ltd', 'Seattle'),
(5, 'NextGen Systems', 'Boston');

-- Insert Orders
INSERT INTO orders VALUES
(101, 1, 1, '2024-01-10', 500),
(102, 2, 2, '2024-01-11', 700),
(103, 1, 1, '2024-01-15', 1200),
(104, 3, 3, '2024-01-18', 300),
(105, 4, 4, '2024-01-20', 900),
(106, 5, 2, '2024-01-25', 1500),
(107, 2, 1, '2024-02-01', 650),
(108, 1, 3, '2024-02-05', 1100),
(109, 3, 4, '2024-02-10', 400),
(110, 4, 2, '2024-02-15', 950),
(111, 5, 1, '2024-02-20', 2000),
(112, 1, 4, '2024-02-25', 750);

-- Notes:
-- Multiple departments for PARTITION BY exercises.
-- Salary variations for ranking exercises.
-- Multiple customer orders for LAG/LEAD analysis.
-- Manager hierarchy included for recursive CTE practice.

Assignment

-- Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
  
select * ,
ROW_NUMBER() over(order by salary desc) as row_num  
from employees

--output
Diana Prince	IT	4	3	95000.00	2018-11-11	1
Charlie Brown	IT	3		90000.00	2019-07-01	2
George Miller	Finance	7		85000.00	2017-09-18	3
Hannah Lee	Finance	8	7	82000.00	2021-08-30	4
Alice Johnson	Sales	1		70000.00	2020-01-15	5
Bob Smith	Sales	2	1	65000.00	2021-03-20	6
Ethan Hunt	HR	5		60000.00	2022-02-10	7
Fiona Green	HR	6	5	58000.00	2023-05-12	8


--Use RANK() to rank employees by salary.

SELECT 
    *,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

4	Diana Prince	IT	3	95000.00	2018-11-11	1
3	Charlie Brown	IT		90000.00	2019-07-01	2
7	George Miller	Finance		85000.00	2017-09-18	3
8	Hannah Lee	Finance	7	82000.00	2021-08-30	4
1	Alice Johnson	Sales		70000.00	2020-01-15	5
2	Bob Smith	Sales	1	65000.00	2021-03-20	6
5	Ethan Hunt	HR		60000.00	2022-02-10	7
6	Fiona Green	HR	5	58000.00	2023-05-12	8

--. Use DENSE_RANK() to rank employees by salary
  
SELECT 
    *,
    dense_rank() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
--output

4	Diana Prince	IT	3	95000.00	2018-11-11	1
3	Charlie Brown	IT		90000.00	2019-07-01	2
7	George Miller	Finance		85000.00	2017-09-18	3
8	Hannah Lee	Finance	7	82000.00	2021-08-30	4
1	Alice Johnson	Sales		70000.00	2020-01-15	5
2	Bob Smith	Sales	1	65000.00	2021-03-20	6
5	Ethan Hunt	HR		60000.00	2022-02-10	7
6	Fiona Green	HR	5	58000.00	2023-05-12	8

-- Find the top 3 highest-paid employees using a window function.
SELECT *
FROM (
    SELECT 
        *,
        RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
) ranked_employees
WHERE salary_rank <= 3;

--output

4	Diana Prince	IT	3	95000.00	2018-11-11	1
3	Charlie Brown	IT		90000.00	2019-07-01	2
7	George Miller	Finance		85000.00	2017-09-18	3

--Display the highest salary in each department using a window function.

SELECT *,
       RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS rankk
FROM employees;

--output

7	George Miller	Finance		85000.00	2017-09-18	1
8	Hannah Lee	Finance	7	82000.00	2021-08-30	2
5	Ethan Hunt	HR		60000.00	2022-02-10	1
6	Fiona Green	HR	5	58000.00	2023-05-12	2
4	Diana Prince	IT	3	95000.00	2018-11-11	1
3	Charlie Brown	IT		90000.00	2019-07-01	2
1	Alice Johnson	Sales		70000.00	2020-01-15	1
2	Bob Smith	Sales	1	65000.00	2021-03-20	2

--. Calculate the running total of order amounts ordered by order_date.

select *,
      sum(total_amount) over (order by order_date ) as running_total
       from orders;

--output

101	1	1	2024-01-10	500.00	500.00
102	2	2	2024-01-11	700.00	1200.00
103	1	1	2024-01-15	1200.00	2400.00
104	3	3	2024-01-18	300.00	2700.00
105	4	4	2024-01-20	900.00	3600.00
106	5	2	2024-01-25	1500.00	5100.00
107	2	1	2024-02-01	650.00	5750.00
108	1	3	2024-02-05	1100.00	6850.00
109	3	4	2024-02-10	400.00	7250.00
110	4	2	2024-02-15	950.00	8200.00
111	5	1	2024-02-20	2000.00	10200.00
112	1	4	2024-02-25	750.00	10950.00


