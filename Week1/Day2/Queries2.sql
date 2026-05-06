-- 25. Select the department with the highest average salary
SELECT department_id, AVG(salary) AS avg_salary FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- 26. Select departments with more than 2 employees
SELECT department_id, COUNT(*) AS employee_count FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27. Select departments with an average salary greater than 55000
SELECT department_id, AVG(salary) AS avg_salary FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28. Select years with more than 1 employee hired
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- 29. Select departments with a total salary expense less than 100000
SELECT department_id, SUM(salary) AS total_salary FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- 30. Select departments with the maximum salary above 75000
SELECT department_id, MAX(salary) AS max_salary FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- 31. Select all employees ordered by salary ascending
SELECT * FROM Employee ORDER BY salary ASC;

-- 32. Select all employees ordered by age descending
SELECT * FROM Employee ORDER BY age DESC;

-- 33. Select all employees ordered by hire date ascending
SELECT * FROM Employee ORDER BY hire_date ASC;

-- 34. Select employees ordered by department and salary
SELECT * FROM Employee ORDER BY department_id, salary;

-- 35. Select departments ordered by total salary
SELECT department_id, SUM(salary) AS total_salary FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;

-- 36. Select employee names along with department names
SELECT e.name AS employee_name, d.name AS department_name FROM Employee e
JOIN Department d ON e.department_id = d.department_id;

-- 37. Select project names along with department names
SELECT p.name AS project_name, d.name AS department_name FROM Project p
JOIN Department d ON p.department_id = d.department_id;

-- 38. Select employee names and their corresponding project names
SELECT e.name AS employee_name, p.name AS project_name FROM Employee e
JOIN Project p ON e.department_id = p.department_id;

-- 39. Select all employees and their departments, including those without a department
SELECT e.name AS employee_name, d.name AS department_name FROM Employee e
LEFT JOIN Department d ON e.department_id = d.department_id;

-- 40. Select all departments and their employees, including departments without employees
SELECT d.name AS department_name, e.name AS employee_name FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id;

-- 41. Select employees who are not assigned to any project
SELECT e.* FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

-- 42. Select employees and the number of projects their department is working on
SELECT e.name, COUNT(p.project_id) AS project_count FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

-- 43. Select departments that have no employees
SELECT d.* FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44. Select employee names who share the same department with 'John Doe'
SELECT name FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
)
AND name <> 'John Doe';

-- 45. Select the department name with the highest average salary
SELECT d.name, AVG(e.salary) AS avg_salary FROM Employee e
JOIN Department d ON e.department_id = d.department_id
GROUP BY d.name
ORDER BY avg_salary DESC
LIMIT 1;

-- 46. Select the employee with the highest salary
SELECT * FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- 47. Select employees whose salary is above the average salary
SELECT * FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- 48. Select the second highest salary
SELECT MAX(salary) AS second_highest_salary FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- 49. Select the department with the most employees
SELECT department_id, COUNT(*) AS employee_count FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

-- 50. Select employees who earn more than the average salary of their department
SELECT * FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 51. Select the 3rd highest salary
SELECT DISTINCT salary FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 52. Select employees older than all employees in the HR department
SELECT * FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = (
        SELECT department_id
        FROM Department
        WHERE name = 'HR'
    )
);

-- 53. Select departments where average salary is greater than 55000
SELECT department_id, AVG(salary) AS avg_salary FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 54. Select employees who work in a department with at least 2 projects
SELECT * FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(*) >= 2
);

-- 55. Select employees hired on the same date as Jane Smith
SELECT * FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);

-- 56. Select total salary of employees hired in 2020
SELECT SUM(salary) AS total_salary FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 57. Select average salary in each department ordered descending
SELECT department_id, AVG(salary) AS avg_salary FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC;

-- 58. Select departments with more than 1 employee and average salary > 55000
SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;

-- 59. Select employees hired in the last 2 years ordered by hire date
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;

-- 60. Select total employees and average salary for departments with more than 2 employees
SELECT department_id,
       COUNT(*) AS total_employees,
       AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 61. Select employees whose salary is above department average
SELECT name, salary FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 62. Select employees hired on same date as oldest employee
SELECT name FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE age = (
        SELECT MAX(age)
        FROM Employee
    )
);

-- 63. Select department names and total projects ordered by projects
SELECT d.name, COUNT(p.project_id) AS total_projects FROM Department d
LEFT JOIN Project p ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY total_projects DESC;

-- 64. Select employee with highest salary in each department
SELECT e.name, e.department_id, e.salary FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 65. Select employees older than average age of their department
SELECT name, salary FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);

