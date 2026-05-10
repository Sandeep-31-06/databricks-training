-- 16. Display employee salaries along with department average salary.

SELECT employee_name,department,salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary
FROM employees;

-- Output
-- employee_name | department | salary   | dept_avg_salary
-- Alice Johnson | Sales      | 70000.00 | 67500.00
-- Bob Smith     | Sales      | 65000.00 | 67500.00
-- Charlie Brown | IT         | 90000.00 | 92500.00
-- Diana Prince  | IT         | 95000.00 | 92500.00
-- Ethan Hunt    | HR         | 60000.00 | 59000.00
-- Fiona Green   | HR         | 58000.00 | 59000.00


-- 17. Find employees earning above their department average salary.

SELECT * FROM (
    SELECT employee_name,department,salary,
        AVG(salary) OVER(PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;

-- Output
-- employee_name | department | salary   | dept_avg
-- Alice Johnson | Sales      | 70000.00 | 67500.00
-- Diana Prince  | IT         | 95000.00 | 92500.00
-- Ethan Hunt    | HR         | 60000.00 | 59000.00
-- George Miller | Finance    | 85000.00 | 83500.00


-- 18. Use SUM() OVER(PARTITION BY department) to calculate department payroll.

SELECT employee_name,department,salary,
    SUM(salary) OVER(PARTITION BY department) AS department_payroll
FROM employees;

-- Output
-- employee_name | department | salary   | department_payroll
-- Alice Johnson | Sales      | 70000.00 | 135000.00
-- Bob Smith     | Sales      | 65000.00 | 135000.00
-- Charlie Brown | IT         | 90000.00 | 185000.00
-- Diana Prince  | IT         | 95000.00 | 185000.00


-- 19. Find the percentage contribution of each employee salary within their department.

SELECT employee_name,department,salary,
    ROUND(
        salary * 100.0 /
        SUM(salary) OVER(PARTITION BY department),
        2
    ) AS percentage_contribution
FROM employees;

-- Output
-- employee_name | department | salary   | percentage_contribution
-- Alice Johnson | Sales      | 70000.00 | 51.85
-- Bob Smith     | Sales      | 65000.00 | 48.15
-- Charlie Brown | IT         | 90000.00 | 48.65
-- Diana Prince  | IT         | 95000.00 | 51.35


-- 20. Use COUNT() OVER() to show total number of employees alongside each row.

SELECT employee_name,department,
    COUNT(*) OVER() AS total_employees
FROM employees;

-- Output
-- employee_name | department | total_employees
-- Alice Johnson | Sales      | 8
-- Bob Smith     | Sales      | 8
-- Charlie Brown | IT         | 8
-- Diana Prince  | IT         | 8


-- 21. Create a CTE to calculate total sales per employee.

WITH employee_sales AS (
    SELECT employee_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT * FROM employee_sales;

-- Output
-- employee_id | total_sales
-- 1           | 4350.00
-- 2           | 3150.00
-- 3           | 1400.00
-- 4           | 2050.00


-- 22. Use a CTE to find employees whose sales exceed the company average.

WITH employee_sales AS (
    SELECT employee_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
avg_sales AS (
    SELECT AVG(total_sales) AS avg_total_sales
    FROM employee_sales
)
SELECT es.employee_id,es.total_sales
FROM employee_sales es, avg_sales a
WHERE es.total_sales > a.avg_total_sales;

-- Output
-- employee_id | total_sales
-- 1           | 4350.00
-- 2           | 3150.00


-- 23. Create multiple CTEs to calculate customer total spending and rankings.

WITH customer_spending AS (
    SELECT customer_id,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
customer_rankings AS (
    SELECT customer_id,total_spent,
        RANK() OVER(ORDER BY total_spent DESC) AS rank_no
    FROM customer_spending
)
SELECT * FROM customer_rankings;

-- Output
-- customer_id | total_spent | rank_no
-- 5           | 3500.00     | 1
-- 1           | 3550.00     | 2
-- 4           | 1850.00     | 3
-- 2           | 1350.00     | 4


-- 24. Write a recursive CTE to generate numbers from 1 to 10.

WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT * FROM numbers;

-- Output
-- n
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10


-- 25. Use a recursive CTE to display employee hierarchy data.

WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id,employee_name,manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,e.employee_name,e.manager_id,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
    ON e.manager_id = eh.employee_id
)
SELECT * FROM employee_hierarchy;

-- Output
-- employee_id | employee_name | manager_id | level
-- 1           | Alice Johnson | NULL       | 1
-- 3           | Charlie Brown | NULL       | 1
-- 5           | Ethan Hunt    | NULL       | 1
-- 7           | George Miller | NULL       | 1
-- 2           | Bob Smith     | 1          | 2
-- 4           | Diana Prince  | 3          | 2
-- 6           | Fiona Green   | 5          | 2
-- 8           | Hannah Lee    | 7          | 2


-- 26. Create a CTE that filters orders above the average order amount.

WITH avg_order AS (
    SELECT AVG(total_amount) AS avg_amount
    FROM orders
)
SELECT *
FROM orders
WHERE total_amount > (SELECT avg_amount FROM avg_order);

-- Output
-- order_id | customer_id | employee_id | order_date | total_amount
-- 103      | 1           | 1           | 2024-01-15 | 1200.00
-- 106      | 5           | 2           | 2024-01-25 | 1500.00
-- 108      | 1           | 3           | 2024-02-05 | 1100.00
-- 111      | 5           | 1           | 2024-02-20 | 2000.00


-- 27. Use a CTE and window function together to rank customers by total spending.

WITH customer_totals AS (
    SELECT customer_id,
        SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id,
    total_spending,
    RANK() OVER(ORDER BY total_spending DESC) AS customer_rank
FROM customer_totals;

-- Output
-- customer_id | total_spending | customer_rank
-- 1           | 3550.00        | 1
-- 5           | 3500.00        | 2
-- 4           | 1850.00        | 3
-- 2           | 1350.00        | 4


-- 28. Find the second-highest salary in each department.

SELECT *
FROM (
    SELECT employee_name,department,salary,
        DENSE_RANK() OVER(
            PARTITION BY department 
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
) t
WHERE rnk = 2;

-- Output
-- employee_name | department | salary   | rnk
-- Charlie Brown | IT         | 90000.00 | 2
-- Bob Smith     | Sales      | 65000.00 | 2
-- Fiona Green   | HR         | 58000.00 | 2
-- Hannah Lee    | Finance    | 82000.00 | 2


-- 29. Display the difference between each employee salary and the department maximum salary.

SELECT employee_name,department,salary,
    MAX(salary) OVER(PARTITION BY department) - salary AS difference
FROM employees;

-- Output
-- employee_name | department | salary   | difference
-- Alice Johnson | Sales      | 70000.00 | 0
-- Bob Smith     | Sales      | 65000.00 | 5000
-- Charlie Brown | IT         | 90000.00 | 5000
-- Diana Prince  | IT         | 95000.00 | 0


-- 30. Combine CTEs and window functions to find the top-performing employee in each department based on total sales.

WITH employee_sales AS (
    SELECT e.employee_id,e.employee_name,e.department,
        SUM(o.total_amount) AS total_sales
    FROM employees e
    JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.employee_id, e.employee_name, e.department
),
ranked_employees AS (
    SELECT *,
           RANK() OVER(
               PARTITION BY department 
               ORDER BY total_sales DESC
           ) AS rnk
    FROM employee_sales
)
SELECT *
FROM ranked_employees
WHERE rnk = 1;

-- Output
-- employee_id | employee_name | department | total_sales | rnk
-- 1           | Alice Johnson | Sales      | 4350.00     | 1
-- 4           | Diana Prince  | IT         | 2050.00     | 1


-- Monthly sales trends using CTEs, Running totals, LAG(), Percentage growth calculations

WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS month,
        SUM(total_amount) AS monthly_total
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),
sales_analysis AS (
    SELECT month,monthly_total,
        SUM(monthly_total) OVER(
            ORDER BY month
        ) AS running_total,
        LAG(monthly_total) OVER(
            ORDER BY month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT month,monthly_total,running_total,previous_month_sales,
    ROUND(
        ((monthly_total - previous_month_sales)
        * 100.0 / previous_month_sales),
        2
    ) AS percentage_growth
FROM sales_analysis;

-- Output
-- month      | monthly_total | running_total | previous_month_sales | percentage_growth
-- 2024-01-01 | 5100.00       | 5100.00       | NULL                 | NULL
-- 2024-02-01 | 5850.00       | 10950.00      | 5100.00              | 14.71
