**Schema (MySQL v5.7)**

    -- 1. Sample Table Structure
    CREATE TABLE orders (
      order_id INT PRIMARY KEY,
      customer_name VARCHAR(50),
      order_date DATE,
      order_timestamp TIMESTAMP,
      delivery_date DATE,
      order_amount DECIMAL(10,2)
    );
    
    -- 2. Insert Sample Data
    INSERT INTO orders VALUES
    (1, 'Karthik', '2024-01-15', '2024-01-15 10:30:45', '2024-01-20', 2500.00),
    (2, 'Veena', '2024-02-18', '2024-02-18 18:45:20', '2024-02-22', 3200.50),
    (3, 'Ravi', '2024-03-02', '2024-03-02 09:15:10', '2024-03-08', 4100.75),
    (4, 'Anil', '2024-03-09', '2024-03-09 14:05:55', '2024-03-15', 1800.00),
    (5, 'Suresh', '2024-01-07', '2024-01-07 23:55:00', '2024-01-12', 2900.00);
    

---

**Query #1**

    --  Current Date & Time Functions
    SELECT CURDATE();

| CURDATE()  |
| ---------- |
| 2026-05-17 |

---
**Query #2**

    SELECT CURRENT_DATE();

| CURRENT_DATE() |
| -------------- |
| 2026-05-17     |

---
**Query #3**

    SELECT CURTIME();

| CURTIME() |
| --------- |
| 04:26:07  |

---
**Query #4**

    SELECT CURRENT_TIME();

| CURRENT_TIME() |
| -------------- |
| 04:26:07       |

---
**Query #5**

    SELECT NOW();

| NOW()               |
| ------------------- |
| 2026-05-17 04:26:07 |

---
**Query #6**

    SELECT CURRENT_TIMESTAMP;

| CURRENT_TIMESTAMP   |
| ------------------- |
| 2026-05-17 04:26:07 |

---
**Query #7**

    --  Date & Timestamp Data Types
    -- DATE: YYYY-MM-DD
    -- TIME: HH:MM:SS
    -- DATETIME: Date + time (no timezone)
    -- TIMESTAMP: Date + time (timezone aware)
    
    --  Extracting Year, Month, Day
    SELECT YEAR(order_date), MONTH(order_date), DAY(order_date) FROM orders;

| YEAR(order_date) | MONTH(order_date) | DAY(order_date) |
| ---------------- | ----------------- | --------------- |
| 2024             | 1                 | 15              |
| 2024             | 2                 | 18              |
| 2024             | 3                 | 2               |
| 2024             | 3                 | 9               |
| 2024             | 1                 | 7               |

---
**Query #8**  --  Extract using EXTRACT()

    SELECT EXTRACT(YEAR FROM order_date),
           EXTRACT(MONTH FROM order_date),
           EXTRACT(DAY FROM order_date)
    FROM orders;

| EXTRACT(YEAR FROM order_date) | EXTRACT(MONTH FROM order_date) | EXTRACT(DAY FROM order_date) |
| ----------------------------- | ------------------------------ | ---------------------------- |
| 2024                          | 1                              | 15                           |
| 2024                          | 2                              | 18                           |
| 2024                          | 3                              | 2                            |
| 2024                          | 3                              | 9                            |
| 2024                          | 1                              | 7                            |

---
**Query #9**--  Month Name and Day Name

    SELECT MONTHNAME(order_date), DAYNAME(order_date) FROM orders;

| MONTHNAME(order_date) | DAYNAME(order_date) |
| --------------------- | ------------------- |
| January               | Monday              |
| February              | Sunday              |
| March                 | Saturday            |
| March                 | Saturday            |
| January               | Sunday              |

---
**Query #10**--  Weekday and Day of Week

    SELECT WEEKDAY(order_date), DAYOFWEEK(order_date) FROM orders;

| WEEKDAY(order_date) | DAYOFWEEK(order_date) |
| ------------------- | --------------------- |
| 0                   | 2                     |
| 6                   | 1                     |
| 5                   | 7                     |
| 5                   | 7                     |
| 6                   | 1                     |

---
**Query #11**-- Identify Weekends

    SELECT order_id, order_date FROM orders WHERE DAYNAME(order_date) IN ('Saturday','Sunday');

| order_id | order_date |
| -------- | ---------- |
| 2        | 2024-02-18 |
| 3        | 2024-03-02 |
| 4        | 2024-03-09 |
| 5        | 2024-01-07 |

---
**Query #12**-- Identify Weekends

    SELECT order_id, order_date FROM orders WHERE DAYOFWEEK(order_date) IN (1,7);

| order_id | order_date |
| -------- | ---------- |
| 2        | 2024-02-18 |
| 3        | 2024-03-02 |
| 4        | 2024-03-09 |
| 5        | 2024-01-07 |

---
**Query #13**--  Identify Weekdays

    SELECT order_id, order_date FROM orders WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;

| order_id | order_date |
| -------- | ---------- |
| 1        | 2024-01-15 |

---
**Query #14**--  Date Arithmetic

    SELECT order_date, DATE_ADD(order_date, INTERVAL 5 DAY) FROM orders;

| order_date | DATE_ADD(order_date, INTERVAL 5 DAY) |
| ---------- | ------------------------------------ |
| 2024-01-15 | 2024-01-20                           |
| 2024-02-18 | 2024-02-23                           |
| 2024-03-02 | 2024-03-07                           |
| 2024-03-09 | 2024-03-14                           |
| 2024-01-07 | 2024-01-12                           |

---
**Query #15**--  Date Arithmetic

    SELECT order_date, DATE_SUB(order_date, INTERVAL 3 DAY) FROM orders;

| order_date | DATE_SUB(order_date, INTERVAL 3 DAY) |
| ---------- | ------------------------------------ |
| 2024-01-15 | 2024-01-12                           |
| 2024-02-18 | 2024-02-15                           |
| 2024-03-02 | 2024-02-28                           |
| 2024-03-09 | 2024-03-06                           |
| 2024-01-07 | 2024-01-04                           |

---
**Query #16**--  Date Arithmetic

    SELECT DATE_ADD(order_date, INTERVAL 1 MONTH) FROM orders;

| DATE_ADD(order_date, INTERVAL 1 MONTH) |
| -------------------------------------- |
| 2024-02-15                             |
| 2024-03-18                             |
| 2024-04-02                             |
| 2024-04-09                             |
| 2024-02-07                             |

---
**Query #17**--  Date Arithmetic

    SELECT DATE_SUB(order_date, INTERVAL 2 MONTH) FROM orders;

| DATE_SUB(order_date, INTERVAL 2 MONTH) |
| -------------------------------------- |
| 2023-11-15                             |
| 2023-12-18                             |
| 2024-01-02                             |
| 2024-01-09                             |
| 2023-11-07                             |

---
**Query #18**--  Date Arithmetic

    SELECT DATE_ADD(order_date, INTERVAL 1 YEAR) FROM orders;

| DATE_ADD(order_date, INTERVAL 1 YEAR) |
| ------------------------------------- |
| 2025-01-15                            |
| 2025-02-18                            |
| 2025-03-02                            |
| 2025-03-09                            |
| 2025-01-07                            |

---
**Query #19** --  DATEDIFF

    SELECT order_id, DATEDIFF(delivery_date, order_date) AS delivery_days FROM orders;

| order_id | delivery_days |
| -------- | ------------- |
| 1        | 5             |
| 2        | 4             |
| 3        | 6             |
| 4        | 6             |
| 5        | 5             |

---
**Query #20**--  TIMESTAMPDIFF

    SELECT TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_diff,
           TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_diff
    FROM orders;

| days_diff | months_diff |
| --------- | ----------- |
| 5         | 0           |
| 4         | 0           |
| 6         | 0           |
| 6         | 0           |
| 5         | 0           |

---
**Query #21** --  Last Day of Month

    SELECT LAST_DAY(order_date) FROM orders;

| LAST_DAY(order_date) |
| -------------------- |
| 2024-01-31           |
| 2024-02-29           |
| 2024-03-31           |
| 2024-03-31           |
| 2024-01-31           |

---
**Query #22** --  First Day of Month

    SELECT DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY) FROM orders;

| DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY) |
| ---------------------------------------------------- |
| 2024-01-01                                           |
| 2024-02-01                                           |
| 2024-03-01                                           |
| 2024-03-01                                           |
| 2024-01-01                                           |

---
**Query #23** --  Date Format

    SELECT DATE_FORMAT(order_date, '%d-%m-%Y') FROM orders;

| DATE_FORMAT(order_date, '%d-%m-%Y') |
| ----------------------------------- |
| 15-01-2024                          |
| 18-02-2024                          |
| 02-03-2024                          |
| 09-03-2024                          |
| 07-01-2024                          |

---
**Query #24** --  Date Format

    SELECT DATE_FORMAT(order_date, '%M %d, %Y') FROM orders;

| DATE_FORMAT(order_date, '%M %d, %Y') |
| ------------------------------------ |
| January 15, 2024                     |
| February 18, 2024                    |
| March 02, 2024                       |
| March 09, 2024                       |
| January 07, 2024                     |

---
**Query #25**--  String to Date

    SELECT STR_TO_DATE('15-01-2024', '%d-%m-%Y');

| STR_TO_DATE('15-01-2024', '%d-%m-%Y') |
| ------------------------------------- |
| 2024-01-15                            |

---
**Query #26**--  Timestamp Formatting

    SELECT DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s') FROM orders;

| DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s') |
| ------------------------------------------------- |
| 15-01-2024 10:30:45                               |
| 18-02-2024 18:45:20                               |
| 02-03-2024 09:15:10                               |
| 09-03-2024 14:05:55                               |
| 07-01-2024 23:55:00                               |

---
**Query #27**--  Filter by Month

    SELECT * FROM orders WHERE MONTH(order_date) = 1;

| order_id | customer_name | order_date | order_timestamp     | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------------- | ------------- | ------------ |
| 1        | Karthik       | 2024-01-15 | 2024-01-15 10:30:45 | 2024-01-20    | 2500.0       |
| 5        | Suresh        | 2024-01-07 | 2024-01-07 23:55:00 | 2024-01-12    | 2900.0       |

---
**Query #28**  -- January

    SELECT * FROM orders WHERE MONTHNAME(order_date) = 'February';

| order_id | customer_name | order_date | order_timestamp     | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------------- | ------------- | ------------ |
| 2        | Veena         | 2024-02-18 | 2024-02-18 18:45:20 | 2024-02-22    | 3200.5       |

---
**Query #29** --  Financial Year Logic

    SELECT order_date,
    CASE
      WHEN MONTH(order_date) >= 4 THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
      ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
    END AS financial_year
    FROM orders;

| order_date | financial_year |
| ---------- | -------------- |
| 2024-01-15 | 2023-2024      |
| 2024-02-18 | 2023-2024      |
| 2024-03-02 | 2023-2024      |
| 2024-03-09 | 2023-2024      |
| 2024-01-07 | 2023-2024      |

---
**Query #30**-- Real-Time Business Use Cases

    
    SELECT * FROM orders WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

There are no results to be displayed.

---
**Query #31**-- Real-Time Business Use Cases

    SELECT * FROM orders WHERE DATE(order_timestamp) = CURDATE();

There are no results to be displayed.

---
