**Schema (MySQL v5.7)**

    -- Sample table
    CREATE TABLE test_strings (
      id INT,
      sample_text VARCHAR(100)
    );
    
    INSERT INTO test_strings VALUES
    (1, '123ABc'),
    (2, 'abc123'),
    (3, '123abc567'),
    (4, 'abcdefghi123'),
    (5, 'karthik@gmail.com'),
    (6, '+91-9989454737');
    
    

---

**Query #1**

    -- 1. Check if string contains digits
    SELECT sample_text, sample_text REGEXP '[0-9]' AS has_digit
    FROM test_strings;

| sample_text       | has_digit |
| ----------------- | --------- |
| 123ABc            | 1         |
| abc123            | 1         |
| 123abc567         | 1         |
| abcdefghi123      | 1         |
| karthik@gmail.com | 0         |
| +91-9989454737    | 1         |

---
**Query #2**

    -- 2. Check if string contains alphabets
    SELECT sample_text, sample_text REGEXP '[A-Za-z]' AS has_alpha
    FROM test_strings;

| sample_text       | has_alpha |
| ----------------- | --------- |
| 123ABc            | 1         |
| abc123            | 1         |
| 123abc567         | 1         |
| abcdefghi123      | 1         |
| karthik@gmail.com | 1         |
| +91-9989454737    | 0         |

---
**Query #3**

    -- 3. Starts with digit (^)
    SELECT sample_text, sample_text REGEXP '^[0-9]' AS starts_with_digit
    FROM test_strings;

| sample_text       | starts_with_digit |
| ----------------- | ----------------- |
| 123ABc            | 1                 |
| abc123            | 0                 |
| 123abc567         | 1                 |
| abcdefghi123      | 0                 |
| karthik@gmail.com | 0                 |
| +91-9989454737    | 0                 |

---
**Query #4**

    -- 4. Ends with digit ($)
    SELECT sample_text, sample_text REGEXP '[0-9]$' AS ends_with_digit
    FROM test_strings;

| sample_text       | ends_with_digit |
| ----------------- | --------------- |
| 123ABc            | 0               |
| abc123            | 1               |
| 123abc567         | 1               |
| abcdefghi123      | 1               |
| karthik@gmail.com | 0               |
| +91-9989454737    | 1               |

---
**Query #5**

    -- 5. Exact number of characters { }
    SELECT sample_text, sample_text REGEXP '[0-9]{2}' AS has_two_digits
    FROM test_strings;

| sample_text       | has_two_digits |
| ----------------- | -------------- |
| 123ABc            | 1              |
| abc123            | 1              |
| 123abc567         | 1              |
| abcdefghi123      | 1              |
| karthik@gmail.com | 0              |
| +91-9989454737    | 1              |

---
**Query #6**

    SELECT sample_text, sample_text REGEXP '[A-Za-z]{2}' AS has_two_alphas
    FROM test_strings;

| sample_text       | has_two_alphas |
| ----------------- | -------------- |
| 123ABc            | 1              |
| abc123            | 1              |
| 123abc567         | 1              |
| abcdefghi123      | 1              |
| karthik@gmail.com | 1              |
| +91-9989454737    | 0              |

---
**Query #7**

    -- 6. One or more continuous matches (+)
    SELECT sample_text, sample_text REGEXP '[0-9]+' AS has_digit_block
    FROM test_strings;

| sample_text       | has_digit_block |
| ----------------- | --------------- |
| 123ABc            | 1               |
| abc123            | 1               |
| 123abc567         | 1               |
| abcdefghi123      | 1               |
| karthik@gmail.com | 0               |
| +91-9989454737    | 1               |

---
**Query #8**

    SELECT sample_text, sample_text REGEXP '[A-Za-z]+' AS has_alpha_block
    FROM test_strings;

| sample_text       | has_alpha_block |
| ----------------- | --------------- |
| 123ABc            | 1               |
| abc123            | 1               |
| 123abc567         | 1               |
| abcdefghi123      | 1               |
| karthik@gmail.com | 1               |
| +91-9989454737    | 0               |

---
**Query #9**

    -- 7. Email validation regex
    SELECT sample_text,
           CASE WHEN sample_text REGEXP '^[A-Za-z0-9._-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,3}$'
                THEN 'Valid'
                ELSE 'Invalid'
           END AS email_status
    FROM test_strings;

| sample_text       | email_status |
| ----------------- | ------------ |
| 123ABc            | Invalid      |
| abc123            | Invalid      |
| 123abc567         | Invalid      |
| abcdefghi123      | Invalid      |
| karthik@gmail.com | Valid        |
| +91-9989454737    | Invalid      |

---
**Query #10**

    -- 8. Phone number validation
    SELECT sample_text,
           CASE WHEN sample_text REGEXP '^\\+91-[0-9]{10}$'
                THEN 'Valid Phone'
                ELSE 'Invalid Phone'
           END AS phone_status
    FROM test_strings;

| sample_text       | phone_status  |
| ----------------- | ------------- |
| 123ABc            | Invalid Phone |
| abc123            | Invalid Phone |
| 123abc567         | Invalid Phone |
| abcdefghi123      | Invalid Phone |
| karthik@gmail.com | Invalid Phone |
| +91-9989454737    | Valid Phone   |

---
