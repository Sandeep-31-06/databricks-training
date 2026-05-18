**Schema (MySQL v5.7)**

    CREATE TABLE regex_practice (
    id INT,
    full_text VARCHAR(200),
    email VARCHAR(100),
    phone VARCHAR(30),
    mixed_value VARCHAR(100)
    );
    
    INSERT INTO regex_practice VALUES
    (1,'EMP001_IN_91','karthik@gmail.com','+91-9876543210','abc123xyz'),
    (2,'EMP002_US_01','rahul@yahoo.com','+1-7654321098','test45done'),
    (3,'EMP003_UK_44','john@outlook.com','+44-9988776655','run9fast'),
    (4,'EMP004_AU_61','steve@gmail.com','+61-8899776655','go88home'),
    (5,'EMP005_IN_91','arjun@company.in','+91-7788996655','data77lake'),
    (6,'EMP006_US_01','meera@gmail.com','+1-9090909090','spark12sql'),
    (7,'EMP007_UK_44','rohan@yahoo.com','+44-7878787878','etl999job'),
    (8,'EMP008_AU_61','alice@company.au','+61-6665554443','cloud7aws'),
    (9,'EMP009_IN_91','vinay@gmail.com','+91-9988776655','hdfs34node'),
    (10,'EMP010_US_01','sam@outlook.com','+1-6767676767','map5reduce'),
    (11,'USR11_IN','neha@gmail.com','91-8899001122','abc1'),
    (12,'USR12_US','tom@yahoo.com','01-9988776655','x9'),
    (13,'USR13_UK','harry@company.co.uk','44-6677889900','z88'),
    (14,'USR14_AU','olivia@gmail.com','61-4455667788','q777'),
    (15,'USR15_IN','ankit@company.in','91-9988001122','karthik99'),
    (16,'ACC_1001_91','user1@gmail.com','+91-8877665544','etl1'),
    (17,'ACC_1002_01','user2@yahoo.com','+1-2233445566','etl22'),
    (18,'ACC_1003_44','user3@outlook.com','+44-3344556677','etl333'),
    (19,'ACC_1004_61','user4@gmail.com','+61-5566778899','etl4444'),
    (20,'ACC_1005_91','user5@company.in','+91-6677889900','etl55555'),
    (21,'ORD-11-IN','a@gmail.com','91-9998887776','a1b2'),
    (22,'ORD-22-US','b@yahoo.com','01-1112223334','x2y'),
    (23,'ORD-33-UK','c@outlook.com','44-5556667778','m33n'),
    (24,'ORD-44-AU','d@gmail.com','61-8887776665','k444'),
    (25,'ORD-55-IN','e@company.in','91-4445556667','job5'),
    (26,'LOG91DATA','x@gmail.com','91-9090909090','log99'),
    (27,'LOG01DATA','y@yahoo.com','01-8080808080','log8'),
    (28,'LOG44DATA','z@outlook.com','44-7070707070','log777'),
    (29,'LOG61DATA','p@gmail.com','61-6060606060','log6666'),
    (30,'LOG91DATA','q@company.in','91-5050505050','log55555'),
    (31,'IND91CODE','aa@gmail.com','+91-8889990001','aa1'),
    (32,'USA01CODE','bb@yahoo.com','+1-7776665554','bb22'),
    (33,'UK44CODE','cc@outlook.com','+44-6665554443','cc333'),
    (34,'AUS61CODE','dd@gmail.com','+61-5554443332','dd4444'),
    (35,'IND91CODE','ee@company.in','+91-4443332221','ee55555'),
    (36,'TEST001','test1@gmail.com','91-1111111111','t1'),
    (37,'TEST002','test2@yahoo.com','01-2222222222','t22'),
    (38,'TEST003','test3@outlook.com','44-3333333333','t333'),
    (39,'TEST004','test4@gmail.com','61-4444444444','t4444'),
    (40,'TEST005','test5@company.in','91-5555555555','t55555');
    

---

**Query #1**

    -- Q1: Digits at the beginning
    SELECT id, mixed_value,
           SUBSTRING(mixed_value, 1, LOCATE(SUBSTRING(mixed_value, '[^0-9]'), mixed_value)-1) AS start_digits
    FROM regex_practice;

| id  | mixed_value | start_digits |
| --- | ----------- | ------------ |
| 1   | abc123xyz   |              |
| 2   | test45done  |              |
| 3   | run9fast    |              |
| 4   | go88home    |              |
| 5   | data77lake  |              |
| 6   | spark12sql  |              |
| 7   | etl999job   |              |
| 8   | cloud7aws   |              |
| 9   | hdfs34node  |              |
| 10  | map5reduce  |              |
| 11  | abc1        |              |
| 12  | x9          |              |
| 13  | z88         |              |
| 14  | q777        |              |
| 15  | karthik99   |              |
| 16  | etl1        |              |
| 17  | etl22       |              |
| 18  | etl333      |              |
| 19  | etl4444     |              |
| 20  | etl55555    |              |
| 21  | a1b2        |              |
| 22  | x2y         |              |
| 23  | m33n        |              |
| 24  | k444        |              |
| 25  | job5        |              |
| 26  | log99       |              |
| 27  | log8        |              |
| 28  | log777      |              |
| 29  | log6666     |              |
| 30  | log55555    |              |
| 31  | aa1         |              |
| 32  | bb22        |              |
| 33  | cc333       |              |
| 34  | dd4444      |              |
| 35  | ee55555     |              |
| 36  | t1          |              |
| 37  | t22         |              |
| 38  | t333        |              |
| 39  | t4444       |              |
| 40  | t55555      |              |

---
**Query #2**

    -- Q2: Digits at the end
    SELECT id, mixed_value,
           SUBSTRING(mixed_value, LENGTH(mixed_value) - LOCATE(SUBSTRING(REVERSE(mixed_value), '[^0-9]'), REVERSE(mixed_value)) + 2) AS end_digits
    FROM regex_practice;

| id  | mixed_value | end_digits |
| --- | ----------- | ---------- |
| 1   | abc123xyz   |            |
| 2   | test45done  |            |
| 3   | run9fast    |            |
| 4   | go88home    |            |
| 5   | data77lake  |            |
| 6   | spark12sql  |            |
| 7   | etl999job   |            |
| 8   | cloud7aws   |            |
| 9   | hdfs34node  |            |
| 10  | map5reduce  |            |
| 11  | abc1        |            |
| 12  | x9          |            |
| 13  | z88         |            |
| 14  | q777        |            |
| 15  | karthik99   |            |
| 16  | etl1        |            |
| 17  | etl22       |            |
| 18  | etl333      |            |
| 19  | etl4444     |            |
| 20  | etl55555    |            |
| 21  | a1b2        |            |
| 22  | x2y         |            |
| 23  | m33n        |            |
| 24  | k444        |            |
| 25  | job5        |            |
| 26  | log99       |            |
| 27  | log8        |            |
| 28  | log777      |            |
| 29  | log6666     |            |
| 30  | log55555    |            |
| 31  | aa1         |            |
| 32  | bb22        |            |
| 33  | cc333       |            |
| 34  | dd4444      |            |
| 35  | ee55555     |            |
| 36  | t1          |            |
| 37  | t22         |            |
| 38  | t333        |            |
| 39  | t4444       |            |
| 40  | t55555      |            |

---
**Query #3**

    -- Q3: First single character
    SELECT id, mixed_value, LEFT(mixed_value,1) AS first_char
    FROM regex_practice;

| id  | mixed_value | first_char |
| --- | ----------- | ---------- |
| 1   | abc123xyz   | a          |
| 2   | test45done  | t          |
| 3   | run9fast    | r          |
| 4   | go88home    | g          |
| 5   | data77lake  | d          |
| 6   | spark12sql  | s          |
| 7   | etl999job   | e          |
| 8   | cloud7aws   | c          |
| 9   | hdfs34node  | h          |
| 10  | map5reduce  | m          |
| 11  | abc1        | a          |
| 12  | x9          | x          |
| 13  | z88         | z          |
| 14  | q777        | q          |
| 15  | karthik99   | k          |
| 16  | etl1        | e          |
| 17  | etl22       | e          |
| 18  | etl333      | e          |
| 19  | etl4444     | e          |
| 20  | etl55555    | e          |
| 21  | a1b2        | a          |
| 22  | x2y         | x          |
| 23  | m33n        | m          |
| 24  | k444        | k          |
| 25  | job5        | j          |
| 26  | log99       | l          |
| 27  | log8        | l          |
| 28  | log777      | l          |
| 29  | log6666     | l          |
| 30  | log55555    | l          |
| 31  | aa1         | a          |
| 32  | bb22        | b          |
| 33  | cc333       | c          |
| 34  | dd4444      | d          |
| 35  | ee55555     | e          |
| 36  | t1          | t          |
| 37  | t22         | t          |
| 38  | t333        | t          |
| 39  | t4444       | t          |
| 40  | t55555      | t          |

---
**Query #4**

    -- Q4: Last single character
    SELECT id, mixed_value, RIGHT(mixed_value,1) AS last_char
    FROM regex_practice;

| id  | mixed_value | last_char |
| --- | ----------- | --------- |
| 1   | abc123xyz   | z         |
| 2   | test45done  | e         |
| 3   | run9fast    | t         |
| 4   | go88home    | e         |
| 5   | data77lake  | e         |
| 6   | spark12sql  | l         |
| 7   | etl999job   | b         |
| 8   | cloud7aws   | s         |
| 9   | hdfs34node  | e         |
| 10  | map5reduce  | e         |
| 11  | abc1        | 1         |
| 12  | x9          | 9         |
| 13  | z88         | 8         |
| 14  | q777        | 7         |
| 15  | karthik99   | 9         |
| 16  | etl1        | 1         |
| 17  | etl22       | 2         |
| 18  | etl333      | 3         |
| 19  | etl4444     | 4         |
| 20  | etl55555    | 5         |
| 21  | a1b2        | 2         |
| 22  | x2y         | y         |
| 23  | m33n        | n         |
| 24  | k444        | 4         |
| 25  | job5        | 5         |
| 26  | log99       | 9         |
| 27  | log8        | 8         |
| 28  | log777      | 7         |
| 29  | log6666     | 6         |
| 30  | log55555    | 5         |
| 31  | aa1         | 1         |
| 32  | bb22        | 2         |
| 33  | cc333       | 3         |
| 34  | dd4444      | 4         |
| 35  | ee55555     | 5         |
| 36  | t1          | 1         |
| 37  | t22         | 2         |
| 38  | t333        | 3         |
| 39  | t4444       | 4         |
| 40  | t55555      | 5         |

---
**Query #5**

    -- Q5: Exactly two consecutive digits
    SELECT id, mixed_value,
           SUBSTRING(mixed_value, LOCATE(SUBSTRING(mixed_value,'[0-9]{2}'), mixed_value), 2) AS two_digits
    FROM regex_practice;

| id  | mixed_value | two_digits |
| --- | ----------- | ---------- |
| 1   | abc123xyz   | ab         |
| 2   | test45done  | te         |
| 3   | run9fast    | ru         |
| 4   | go88home    | go         |
| 5   | data77lake  | da         |
| 6   | spark12sql  | sp         |
| 7   | etl999job   | et         |
| 8   | cloud7aws   | cl         |
| 9   | hdfs34node  | hd         |
| 10  | map5reduce  | ma         |
| 11  | abc1        | ab         |
| 12  | x9          | x9         |
| 13  | z88         | z8         |
| 14  | q777        | q7         |
| 15  | karthik99   | ka         |
| 16  | etl1        | et         |
| 17  | etl22       | et         |
| 18  | etl333      | et         |
| 19  | etl4444     | et         |
| 20  | etl55555    | et         |
| 21  | a1b2        | a1         |
| 22  | x2y         | x2         |
| 23  | m33n        | m3         |
| 24  | k444        | k4         |
| 25  | job5        | jo         |
| 26  | log99       | lo         |
| 27  | log8        | lo         |
| 28  | log777      | lo         |
| 29  | log6666     | lo         |
| 30  | log55555    | lo         |
| 31  | aa1         | aa         |
| 32  | bb22        | bb         |
| 33  | cc333       | cc         |
| 34  | dd4444      | dd         |
| 35  | ee55555     | ee         |
| 36  | t1          | t1         |
| 37  | t22         | t2         |
| 38  | t333        | t3         |
| 39  | t4444       | t4         |
| 40  | t55555      | t5         |

---
**Query #6**

    -- Q6: Exactly one digit anywhere
    SELECT id, mixed_value,
           SUBSTRING(mixed_value, LOCATE(SUBSTRING(mixed_value,'[0-9]'), mixed_value), 1) AS one_digit
    FROM regex_practice;

| id  | mixed_value | one_digit |
| --- | ----------- | --------- |
| 1   | abc123xyz   | a         |
| 2   | test45done  | t         |
| 3   | run9fast    | r         |
| 4   | go88home    | g         |
| 5   | data77lake  | d         |
| 6   | spark12sql  | s         |
| 7   | etl999job   | e         |
| 8   | cloud7aws   | c         |
| 9   | hdfs34node  | h         |
| 10  | map5reduce  | m         |
| 11  | abc1        | a         |
| 12  | x9          | x         |
| 13  | z88         | z         |
| 14  | q777        | q         |
| 15  | karthik99   | k         |
| 16  | etl1        | e         |
| 17  | etl22       | e         |
| 18  | etl333      | e         |
| 19  | etl4444     | e         |
| 20  | etl55555    | e         |
| 21  | a1b2        | a         |
| 22  | x2y         | x         |
| 23  | m33n        | m         |
| 24  | k444        | k         |
| 25  | job5        | j         |
| 26  | log99       | l         |
| 27  | log8        | l         |
| 28  | log777      | l         |
| 29  | log6666     | l         |
| 30  | log55555    | l         |
| 31  | aa1         | a         |
| 32  | bb22        | b         |
| 33  | cc333       | c         |
| 34  | dd4444      | d         |
| 35  | ee55555     | e         |
| 36  | t1          | t         |
| 37  | t22         | t         |
| 38  | t333        | t         |
| 39  | t4444       | t         |
| 40  | t55555      | t         |

---
**Query #7**

    -- Q7: Country code from phone
    SELECT id, phone,
           SUBSTRING(phone, LOCATE('+',phone)+1, LOCATE('-',phone)-LOCATE('+',phone)-1) AS country_code
    FROM regex_practice;

| id  | phone          | country_code |
| --- | -------------- | ------------ |
| 1   | +91-9876543210 | 91           |
| 2   | +1-7654321098  | 1            |
| 3   | +44-9988776655 | 44           |
| 4   | +61-8899776655 | 61           |
| 5   | +91-7788996655 | 91           |
| 6   | +1-9090909090  | 1            |
| 7   | +44-7878787878 | 44           |
| 8   | +61-6665554443 | 61           |
| 9   | +91-9988776655 | 91           |
| 10  | +1-6767676767  | 1            |
| 11  | 91-8899001122  | 91           |
| 12  | 01-9988776655  | 01           |
| 13  | 44-6677889900  | 44           |
| 14  | 61-4455667788  | 61           |
| 15  | 91-9988001122  | 91           |
| 16  | +91-8877665544 | 91           |
| 17  | +1-2233445566  | 1            |
| 18  | +44-3344556677 | 44           |
| 19  | +61-5566778899 | 61           |
| 20  | +91-6677889900 | 91           |
| 21  | 91-9998887776  | 91           |
| 22  | 01-1112223334  | 01           |
| 23  | 44-5556667778  | 44           |
| 24  | 61-8887776665  | 61           |
| 25  | 91-4445556667  | 91           |
| 26  | 91-9090909090  | 91           |
| 27  | 01-8080808080  | 01           |
| 28  | 44-7070707070  | 44           |
| 29  | 61-6060606060  | 61           |
| 30  | 91-5050505050  | 91           |
| 31  | +91-8889990001 | 91           |
| 32  | +1-7776665554  | 1            |
| 33  | +44-6665554443 | 44           |
| 34  | +61-5554443332 | 61           |
| 35  | +91-4443332221 | 91           |
| 36  | 91-1111111111  | 91           |
| 37  | 01-2222222222  | 01           |
| 38  | 44-3333333333  | 44           |
| 39  | 61-4444444444  | 61           |
| 40  | 91-5555555555  | 91           |

---
**Query #8**

    -- Q8: Numeric portion between alphabets
    SELECT id, mixed_value,
           SUBSTRING(mixed_value, LOCATE(SUBSTRING(mixed_value,'[0-9]+'), mixed_value), 
                     LENGTH(SUBSTRING(mixed_value,'[0-9]+'))) AS middle_digits
    FROM regex_practice;

| id  | mixed_value | middle_digits |
| --- | ----------- | ------------- |
| 1   | abc123xyz   |               |
| 2   | test45done  |               |
| 3   | run9fast    |               |
| 4   | go88home    |               |
| 5   | data77lake  |               |
| 6   | spark12sql  |               |
| 7   | etl999job   |               |
| 8   | cloud7aws   |               |
| 9   | hdfs34node  |               |
| 10  | map5reduce  |               |
| 11  | abc1        |               |
| 12  | x9          |               |
| 13  | z88         |               |
| 14  | q777        |               |
| 15  | karthik99   |               |
| 16  | etl1        |               |
| 17  | etl22       |               |
| 18  | etl333      |               |
| 19  | etl4444     |               |
| 20  | etl55555    |               |
| 21  | a1b2        |               |
| 22  | x2y         |               |
| 23  | m33n        |               |
| 24  | k444        |               |
| 25  | job5        |               |
| 26  | log99       |               |
| 27  | log8        |               |
| 28  | log777      |               |
| 29  | log6666     |               |
| 30  | log55555    |               |
| 31  | aa1         |               |
| 32  | bb22        |               |
| 33  | cc333       |               |
| 34  | dd4444      |               |
| 35  | ee55555     |               |
| 36  | t1          |               |
| 37  | t22         |               |
| 38  | t333        |               |
| 39  | t4444       |               |
| 40  | t55555      |               |

---
**Query #9**

    -- Q9: Text before @ in email
    SELECT id, email, SUBSTRING_INDEX(email,'@',1) AS username
    FROM regex_practice;

| id  | email               | username |
| --- | ------------------- | -------- |
| 1   | karthik@gmail.com   | karthik  |
| 2   | rahul@yahoo.com     | rahul    |
| 3   | john@outlook.com    | john     |
| 4   | steve@gmail.com     | steve    |
| 5   | arjun@company.in    | arjun    |
| 6   | meera@gmail.com     | meera    |
| 7   | rohan@yahoo.com     | rohan    |
| 8   | alice@company.au    | alice    |
| 9   | vinay@gmail.com     | vinay    |
| 10  | sam@outlook.com     | sam      |
| 11  | neha@gmail.com      | neha     |
| 12  | tom@yahoo.com       | tom      |
| 13  | harry@company.co.uk | harry    |
| 14  | olivia@gmail.com    | olivia   |
| 15  | ankit@company.in    | ankit    |
| 16  | user1@gmail.com     | user1    |
| 17  | user2@yahoo.com     | user2    |
| 18  | user3@outlook.com   | user3    |
| 19  | user4@gmail.com     | user4    |
| 20  | user5@company.in    | user5    |
| 21  | a@gmail.com         | a        |
| 22  | b@yahoo.com         | b        |
| 23  | c@outlook.com       | c        |
| 24  | d@gmail.com         | d        |
| 25  | e@company.in        | e        |
| 26  | x@gmail.com         | x        |
| 27  | y@yahoo.com         | y        |
| 28  | z@outlook.com       | z        |
| 29  | p@gmail.com         | p        |
| 30  | q@company.in        | q        |
| 31  | aa@gmail.com        | aa       |
| 32  | bb@yahoo.com        | bb       |
| 33  | cc@outlook.com      | cc       |
| 34  | dd@gmail.com        | dd       |
| 35  | ee@company.in       | ee       |
| 36  | test1@gmail.com     | test1    |
| 37  | test2@yahoo.com     | test2    |
| 38  | test3@outlook.com   | test3    |
| 39  | test4@gmail.com     | test4    |
| 40  | test5@company.in    | test5    |

---
**Query #10**

    -- Q10: Text after @ in email
    SELECT id, email, SUBSTRING_INDEX(email,'@',-1) AS domain_with_extension
    FROM regex_practice;

| id  | email               | domain_with_extension |
| --- | ------------------- | --------------------- |
| 1   | karthik@gmail.com   | gmail.com             |
| 2   | rahul@yahoo.com     | yahoo.com             |
| 3   | john@outlook.com    | outlook.com           |
| 4   | steve@gmail.com     | gmail.com             |
| 5   | arjun@company.in    | company.in            |
| 6   | meera@gmail.com     | gmail.com             |
| 7   | rohan@yahoo.com     | yahoo.com             |
| 8   | alice@company.au    | company.au            |
| 9   | vinay@gmail.com     | gmail.com             |
| 10  | sam@outlook.com     | outlook.com           |
| 11  | neha@gmail.com      | gmail.com             |
| 12  | tom@yahoo.com       | yahoo.com             |
| 13  | harry@company.co.uk | company.co.uk         |
| 14  | olivia@gmail.com    | gmail.com             |
| 15  | ankit@company.in    | company.in            |
| 16  | user1@gmail.com     | gmail.com             |
| 17  | user2@yahoo.com     | yahoo.com             |
| 18  | user3@outlook.com   | outlook.com           |
| 19  | user4@gmail.com     | gmail.com             |
| 20  | user5@company.in    | company.in            |
| 21  | a@gmail.com         | gmail.com             |
| 22  | b@yahoo.com         | yahoo.com             |
| 23  | c@outlook.com       | outlook.com           |
| 24  | d@gmail.com         | gmail.com             |
| 25  | e@company.in        | company.in            |
| 26  | x@gmail.com         | gmail.com             |
| 27  | y@yahoo.com         | yahoo.com             |
| 28  | z@outlook.com       | outlook.com           |
| 29  | p@gmail.com         | gmail.com             |
| 30  | q@company.in        | company.in            |
| 31  | aa@gmail.com        | gmail.com             |
| 32  | bb@yahoo.com        | yahoo.com             |
| 33  | cc@outlook.com      | outlook.com           |
| 34  | dd@gmail.com        | gmail.com             |
| 35  | ee@company.in       | company.in            |
| 36  | test1@gmail.com     | gmail.com             |
| 37  | test2@yahoo.com     | yahoo.com             |
| 38  | test3@outlook.com   | outlook.com           |
| 39  | test4@gmail.com     | gmail.com             |
| 40  | test5@company.in    | company.in            |

---
**Query #11**

    -- Q11: Domain name only (without @)
    SELECT id, email,
           SUBSTRING_INDEX(SUBSTRING_INDEX(email,'@',-1),'.',1) AS domain_name
    FROM regex_practice;

| id  | email               | domain_name |
| --- | ------------------- | ----------- |
| 1   | karthik@gmail.com   | gmail       |
| 2   | rahul@yahoo.com     | yahoo       |
| 3   | john@outlook.com    | outlook     |
| 4   | steve@gmail.com     | gmail       |
| 5   | arjun@company.in    | company     |
| 6   | meera@gmail.com     | gmail       |
| 7   | rohan@yahoo.com     | yahoo       |
| 8   | alice@company.au    | company     |
| 9   | vinay@gmail.com     | gmail       |
| 10  | sam@outlook.com     | outlook     |
| 11  | neha@gmail.com      | gmail       |
| 12  | tom@yahoo.com       | yahoo       |
| 13  | harry@company.co.uk | company     |
| 14  | olivia@gmail.com    | gmail       |
| 15  | ankit@company.in    | company     |
| 16  | user1@gmail.com     | gmail       |
| 17  | user2@yahoo.com     | yahoo       |
| 18  | user3@outlook.com   | outlook     |
| 19  | user4@gmail.com     | gmail       |
| 20  | user5@company.in    | company     |
| 21  | a@gmail.com         | gmail       |
| 22  | b@yahoo.com         | yahoo       |
| 23  | c@outlook.com       | outlook     |
| 24  | d@gmail.com         | gmail       |
| 25  | e@company.in        | company     |
| 26  | x@gmail.com         | gmail       |
| 27  | y@yahoo.com         | yahoo       |
| 28  | z@outlook.com       | outlook     |
| 29  | p@gmail.com         | gmail       |
| 30  | q@company.in        | company     |
| 31  | aa@gmail.com        | gmail       |
| 32  | bb@yahoo.com        | yahoo       |
| 33  | cc@outlook.com      | outlook     |
| 34  | dd@gmail.com        | gmail       |
| 35  | ee@company.in       | company     |
| 36  | test1@gmail.com     | gmail       |
| 37  | test2@yahoo.com     | yahoo       |
| 38  | test3@outlook.com   | outlook     |
| 39  | test4@gmail.com     | gmail       |
| 40  | test5@company.in    | company     |

---
**Query #12**

    -- Q12: Text after last dot in email
    SELECT id, email, SUBSTRING_INDEX(email,'.',-1) AS extension
    FROM regex_practice;

| id  | email               | extension |
| --- | ------------------- | --------- |
| 1   | karthik@gmail.com   | com       |
| 2   | rahul@yahoo.com     | com       |
| 3   | john@outlook.com    | com       |
| 4   | steve@gmail.com     | com       |
| 5   | arjun@company.in    | in        |
| 6   | meera@gmail.com     | com       |
| 7   | rohan@yahoo.com     | com       |
| 8   | alice@company.au    | au        |
| 9   | vinay@gmail.com     | com       |
| 10  | sam@outlook.com     | com       |
| 11  | neha@gmail.com      | com       |
| 12  | tom@yahoo.com       | com       |
| 13  | harry@company.co.uk | uk        |
| 14  | olivia@gmail.com    | com       |
| 15  | ankit@company.in    | in        |
| 16  | user1@gmail.com     | com       |
| 17  | user2@yahoo.com     | com       |
| 18  | user3@outlook.com   | com       |
| 19  | user4@gmail.com     | com       |
| 20  | user5@company.in    | in        |
| 21  | a@gmail.com         | com       |
| 22  | b@yahoo.com         | com       |
| 23  | c@outlook.com       | com       |
| 24  | d@gmail.com         | com       |
| 25  | e@company.in        | in        |
| 26  | x@gmail.com         | com       |
| 27  | y@yahoo.com         | com       |
| 28  | z@outlook.com       | com       |
| 29  | p@gmail.com         | com       |
| 30  | q@company.in        | in        |
| 31  | aa@gmail.com        | com       |
| 32  | bb@yahoo.com        | com       |
| 33  | cc@outlook.com      | com       |
| 34  | dd@gmail.com        | com       |
| 35  | ee@company.in       | in        |
| 36  | test1@gmail.com     | com       |
| 37  | test2@yahoo.com     | com       |
| 38  | test3@outlook.com   | com       |
| 39  | test4@gmail.com     | com       |
| 40  | test5@company.in    | in        |

---
**Query #13**

    -- Q13: Alphabetic continuous sequence
    SELECT id, mixed_value,
           SUBSTRING(mixed_value, LOCATE(SUBSTRING(mixed_value,'[A-Za-z]+'), mixed_value),
                     LENGTH(SUBSTRING(mixed_value,'[A-Za-z]+'))) AS alpha_seq
    FROM regex_practice;

| id  | mixed_value | alpha_seq |
| --- | ----------- | --------- |
| 1   | abc123xyz   |           |
| 2   | test45done  |           |
| 3   | run9fast    |           |
| 4   | go88home    |           |
| 5   | data77lake  |           |
| 6   | spark12sql  |           |
| 7   | etl999job   |           |
| 8   | cloud7aws   |           |
| 9   | hdfs34node  |           |
| 10  | map5reduce  |           |
| 11  | abc1        |           |
| 12  | x9          |           |
| 13  | z88         |           |
| 14  | q777        |           |
| 15  | karthik99   |           |
| 16  | etl1        |           |
| 17  | etl22       |           |
| 18  | etl333      |           |
| 19  | etl4444     |           |
| 20  | etl55555    |           |
| 21  | a1b2        |           |
| 22  | x2y         |           |
| 23  | m33n        |           |
| 24  | k444        |           |
| 25  | job5        |           |
| 26  | log99       |           |
| 27  | log8        |           |
| 28  | log777      |           |
| 29  | log6666     |           |
| 30  | log55555    |           |
| 31  | aa1         |           |
| 32  | bb22        |           |
| 33  | cc333       |           |
| 34  | dd4444      |           |
| 35  | ee55555     |           |
| 36  | t1          |           |
| 37  | t22         |           |
| 38  | t333        |           |
| 39  | t4444       |           |
| 40  | t55555      |           |

---
**Query #14**

    -- Q14: Numeric continuous sequence
    SELECT id, mixed_value,
           SUBSTRING(mixed_value, LOCATE(SUBSTRING(mixed_value,'[0-9]+'), mixed_value),
                     LENGTH(SUBSTRING(mixed_value,'[0-9]+'))) AS num_seq
    FROM regex_practice;

| id  | mixed_value | num_seq |
| --- | ----------- | ------- |
| 1   | abc123xyz   |         |
| 2   | test45done  |         |
| 3   | run9fast    |         |
| 4   | go88home    |         |
| 5   | data77lake  |         |
| 6   | spark12sql  |         |
| 7   | etl999job   |         |
| 8   | cloud7aws   |         |
| 9   | hdfs34node  |         |
| 10  | map5reduce  |         |
| 11  | abc1        |         |
| 12  | x9          |         |
| 13  | z88         |         |
| 14  | q777        |         |
| 15  | karthik99   |         |
| 16  | etl1        |         |
| 17  | etl22       |         |
| 18  | etl333      |         |
| 19  | etl4444     |         |
| 20  | etl55555    |         |
| 21  | a1b2        |         |
| 22  | x2y         |         |
| 23  | m33n        |         |
| 24  | k444        |         |
| 25  | job5        |         |
| 26  | log99       |         |
| 27  | log8        |         |
| 28  | log777      |         |
| 29  | log6666     |         |
| 30  | log55555    |         |
| 31  | aa1         |         |
| 32  | bb22        |         |
| 33  | cc333       |         |
| 34  | dd4444      |         |
| 35  | ee55555     |         |
| 36  | t1          |         |
| 37  | t22         |         |
| 38  | t333        |         |
| 39  | t4444       |         |
| 40  | t55555      |         |

---
**Query #15**

    -- Q15: First three characters of full_text
    SELECT id, full_text, LEFT(full_text,3) AS first_three
    FROM regex_practice;

| id  | full_text    | first_three |
| --- | ------------ | ----------- |
| 1   | EMP001_IN_91 | EMP         |
| 2   | EMP002_US_01 | EMP         |
| 3   | EMP003_UK_44 | EMP         |
| 4   | EMP004_AU_61 | EMP         |
| 5   | EMP005_IN_91 | EMP         |
| 6   | EMP006_US_01 | EMP         |
| 7   | EMP007_UK_44 | EMP         |
| 8   | EMP008_AU_61 | EMP         |
| 9   | EMP009_IN_91 | EMP         |
| 10  | EMP010_US_01 | EMP         |
| 11  | USR11_IN     | USR         |
| 12  | USR12_US     | USR         |
| 13  | USR13_UK     | USR         |
| 14  | USR14_AU     | USR         |
| 15  | USR15_IN     | USR         |
| 16  | ACC_1001_91  | ACC         |
| 17  | ACC_1002_01  | ACC         |
| 18  | ACC_1003_44  | ACC         |
| 19  | ACC_1004_61  | ACC         |
| 20  | ACC_1005_91  | ACC         |
| 21  | ORD-11-IN    | ORD         |
| 22  | ORD-22-US    | ORD         |
| 23  | ORD-33-UK    | ORD         |
| 24  | ORD-44-AU    | ORD         |
| 25  | ORD-55-IN    | ORD         |
| 26  | LOG91DATA    | LOG         |
| 27  | LOG01DATA    | LOG         |
| 28  | LOG44DATA    | LOG         |
| 29  | LOG61DATA    | LOG         |
| 30  | LOG91DATA    | LOG         |
| 31  | IND91CODE    | IND         |
| 32  | USA01CODE    | USA         |
| 33  | UK44CODE     | UK4         |
| 34  | AUS61CODE    | AUS         |
| 35  | IND91CODE    | IND         |
| 36  | TEST001      | TES         |
| 37  | TEST002      | TES         |
| 38  | TEST003      | TES         |
| 39  | TEST004      | TES         |
| 40  | TEST005      | TES         |

---
**Query #16**

    -- Q16: Last two characters of full_text
    SELECT id, full_text, RIGHT(full_text,2) AS last_two
    FROM regex_practice;

| id  | full_text    | last_two |
| --- | ------------ | -------- |
| 1   | EMP001_IN_91 | 91       |
| 2   | EMP002_US_01 | 01       |
| 3   | EMP003_UK_44 | 44       |
| 4   | EMP004_AU_61 | 61       |
| 5   | EMP005_IN_91 | 91       |
| 6   | EMP006_US_01 | 01       |
| 7   | EMP007_UK_44 | 44       |
| 8   | EMP008_AU_61 | 61       |
| 9   | EMP009_IN_91 | 91       |
| 10  | EMP010_US_01 | 01       |
| 11  | USR11_IN     | IN       |
| 12  | USR12_US     | US       |
| 13  | USR13_UK     | UK       |
| 14  | USR14_AU     | AU       |
| 15  | USR15_IN     | IN       |
| 16  | ACC_1001_91  | 91       |
| 17  | ACC_1002_01  | 01       |
| 18  | ACC_1003_44  | 44       |
| 19  | ACC_1004_61  | 61       |
| 20  | ACC_1005_91  | 91       |
| 21  | ORD-11-IN    | IN       |
| 22  | ORD-22-US    | US       |
| 23  | ORD-33-UK    | UK       |
| 24  | ORD-44-AU    | AU       |
| 25  | ORD-55-IN    | IN       |
| 26  | LOG91DATA    | TA       |
| 27  | LOG01DATA    | TA       |
| 28  | LOG44DATA    | TA       |
| 29  | LOG61DATA    | TA       |
| 30  | LOG91DATA    | TA       |
| 31  | IND91CODE    | DE       |
| 32  | USA01CODE    | DE       |
| 33  | UK44CODE     | DE       |
| 34  | AUS61CODE    | DE       |
| 35  | IND91CODE    | DE       |
| 36  | TEST001      | 01       |
| 37  | TEST002      | 02       |
| 38  | TEST003      | 03       |
| 39  | TEST004      | 04       |
| 40  | TEST005      | 05       |

---
**Query #17**

    -- Q17: Employee number between prefix and underscore
    SELECT id, full_text,
           SUBSTRING_INDEX(SUBSTRING_INDEX(full_text,'_',2),'_',-1) AS emp_number
    FROM regex_practice;

| id  | full_text    | emp_number |
| --- | ------------ | ---------- |
| 1   | EMP001_IN_91 | IN         |
| 2   | EMP002_US_01 | US         |
| 3   | EMP003_UK_44 | UK         |
| 4   | EMP004_AU_61 | AU         |
| 5   | EMP005_IN_91 | IN         |
| 6   | EMP006_US_01 | US         |
| 7   | EMP007_UK_44 | UK         |
| 8   | EMP008_AU_61 | AU         |
| 9   | EMP009_IN_91 | IN         |
| 10  | EMP010_US_01 | US         |
| 11  | USR11_IN     | IN         |
| 12  | USR12_US     | US         |
| 13  | USR13_UK     | UK         |
| 14  | USR14_AU     | AU         |
| 15  | USR15_IN     | IN         |
| 16  | ACC_1001_91  | 1001       |
| 17  | ACC_1002_01  | 1002       |
| 18  | ACC_1003_44  | 1003       |
| 19  | ACC_1004_61  | 1004       |
| 20  | ACC_1005_91  | 1005       |
| 21  | ORD-11-IN    | ORD-11-IN  |
| 22  | ORD-22-US    | ORD-22-US  |
| 23  | ORD-33-UK    | ORD-33-UK  |
| 24  | ORD-44-AU    | ORD-44-AU  |
| 25  | ORD-55-IN    | ORD-55-IN  |
| 26  | LOG91DATA    | LOG91DATA  |
| 27  | LOG01DATA    | LOG01DATA  |
| 28  | LOG44DATA    | LOG44DATA  |
| 29  | LOG61DATA    | LOG61DATA  |
| 30  | LOG91DATA    | LOG91DATA  |
| 31  | IND91CODE    | IND91CODE  |
| 32  | USA01CODE    | USA01CODE  |
| 33  | UK44CODE     | UK44CODE   |
| 34  | AUS61CODE    | AUS61CODE  |
| 35  | IND91CODE    | IND91CODE  |
| 36  | TEST001      | TEST001    |
| 37  | TEST002      | TEST002    |
| 38  | TEST003      | TEST003    |
| 39  | TEST004      | TEST004    |
| 40  | TEST005      | TEST005    |

---
**Query #18**

    -- Q18: Country code at end of full_text
    SELECT id, full_text, SUBSTRING_INDEX(full_text,'_',-1) AS country_code
    FROM regex_practice;

| id  | full_text    | country_code |
| --- | ------------ | ------------ |
| 1   | EMP001_IN_91 | 91           |
| 2   | EMP002_US_01 | 01           |
| 3   | EMP003_UK_44 | 44           |
| 4   | EMP004_AU_61 | 61           |
| 5   | EMP005_IN_91 | 91           |
| 6   | EMP006_US_01 | 01           |
| 7   | EMP007_UK_44 | 44           |
| 8   | EMP008_AU_61 | 61           |
| 9   | EMP009_IN_91 | 91           |
| 10  | EMP010_US_01 | 01           |
| 11  | USR11_IN     | IN           |
| 12  | USR12_US     | US           |
| 13  | USR13_UK     | UK           |
| 14  | USR14_AU     | AU           |
| 15  | USR15_IN     | IN           |
| 16  | ACC_1001_91  | 91           |
| 17  | ACC_1002_01  | 01           |
| 18  | ACC_1003_44  | 44           |
| 19  | ACC_1004_61  | 61           |
| 20  | ACC_1005_91  | 91           |
| 21  | ORD-11-IN    | ORD-11-IN    |
| 22  | ORD-22-US    | ORD-22-US    |
| 23  | ORD-33-UK    | ORD-33-UK    |
| 24  | ORD-44-AU    | ORD-44-AU    |
| 25  | ORD-55-IN    | ORD-55-IN    |
| 26  | LOG91DATA    | LOG91DATA    |
| 27  | LOG01DATA    | LOG01DATA    |
| 28  | LOG44DATA    | LOG44DATA    |
| 29  | LOG61DATA    | LOG61DATA    |
| 30  | LOG91DATA    | LOG91DATA    |
| 31  | IND91CODE    | IND91CODE    |
| 32  | USA01CODE    | USA01CODE    |
| 33  | UK44CODE     | UK44CODE     |
| 34  | AUS61CODE    | AUS61CODE    |
| 35  | IND91CODE    | IND91CODE    |
| 36  | TEST001      | TEST001      |
| 37  | TEST002      | TEST002      |
| 38  | TEST003      | TEST003      |
| 39  | TEST004      | TEST004      |
| 40  | TEST005      | TEST005      |

---
**Query #19**

    -- Q19: Alphabetic text between underscores
    SELECT id, full_text,
           SUBSTRING_INDEX(SUBSTRING_INDEX(full_text,'_',2),'_',-1) AS between_underscores
    FROM regex_practice;

| id  | full_text    | between_underscores |
| --- | ------------ | ------------------- |
| 1   | EMP001_IN_91 | IN                  |
| 2   | EMP002_US_01 | US                  |
| 3   | EMP003_UK_44 | UK                  |
| 4   | EMP004_AU_61 | AU                  |
| 5   | EMP005_IN_91 | IN                  |
| 6   | EMP006_US_01 | US                  |
| 7   | EMP007_UK_44 | UK                  |
| 8   | EMP008_AU_61 | AU                  |
| 9   | EMP009_IN_91 | IN                  |
| 10  | EMP010_US_01 | US                  |
| 11  | USR11_IN     | IN                  |
| 12  | USR12_US     | US                  |
| 13  | USR13_UK     | UK                  |
| 14  | USR14_AU     | AU                  |
| 15  | USR15_IN     | IN                  |
| 16  | ACC_1001_91  | 1001                |
| 17  | ACC_1002_01  | 1002                |
| 18  | ACC_1003_44  | 1003                |
| 19  | ACC_1004_61  | 1004                |
| 20  | ACC_1005_91  | 1005                |
| 21  | ORD-11-IN    | ORD-11-IN           |
| 22  | ORD-22-US    | ORD-22-US           |
| 23  | ORD-33-UK    | ORD-33-UK           |
| 24  | ORD-44-AU    | ORD-44-AU           |
| 25  | ORD-55-IN    | ORD-55-IN           |
| 26  | LOG91DATA    | LOG91DATA           |
| 27  | LOG01DATA    | LOG01DATA           |
| 28  | LOG44DATA    | LOG44DATA           |
| 29  | LOG61DATA    | LOG61DATA           |
| 30  | LOG91DATA    | LOG91DATA           |
| 31  | IND91CODE    | IND91CODE           |
| 32  | USA01CODE    | USA01CODE           |
| 33  | UK44CODE     | UK44CODE            |
| 34  | AUS61CODE    | AUS61CODE           |
| 35  | IND91CODE    | IND91CODE           |
| 36  | TEST001      | TEST001             |
| 37  | TEST002      | TEST002             |
| 38  | TEST003      | TEST003             |
| 39  | TEST004      | TEST004             |
| 40  | TEST005      | TEST005             |

---
**Query #20**

    -- Q20: Digits after plus sign in phone (country code only)
    SELECT id, phone,
           SUBSTRING(phone, LOCATE('+',phone)+1, LOCATE('-',phone)-LOCATE('+',phone)-1) AS plus_country_code
    FROM regex_practice;

| id  | phone          | plus_country_code |
| --- | -------------- | ----------------- |
| 1   | +91-9876543210 | 91                |
| 2   | +1-7654321098  | 1                 |
| 3   | +44-9988776655 | 44                |
| 4   | +61-8899776655 | 61                |
| 5   | +91-7788996655 | 91                |
| 6   | +1-9090909090  | 1                 |
| 7   | +44-7878787878 | 44                |
| 8   | +61-6665554443 | 61                |
| 9   | +91-9988776655 | 91                |
| 10  | +1-6767676767  | 1                 |
| 11  | 91-8899001122  | 91                |
| 12  | 01-9988776655  | 01                |
| 13  | 44-6677889900  | 44                |
| 14  | 61-4455667788  | 61                |
| 15  | 91-9988001122  | 91                |
| 16  | +91-8877665544 | 91                |
| 17  | +1-2233445566  | 1                 |
| 18  | +44-3344556677 | 44                |
| 19  | +61-5566778899 | 61                |
| 20  | +91-6677889900 | 91                |
| 21  | 91-9998887776  | 91                |
| 22  | 01-1112223334  | 01                |
| 23  | 44-5556667778  | 44                |
| 24  | 61-8887776665  | 61                |
| 25  | 91-4445556667  | 91                |
| 26  | 91-9090909090  | 91                |
| 27  | 01-8080808080  | 01                |
| 28  | 44-7070707070  | 44                |
| 29  | 61-6060606060  | 61                |
| 30  | 91-5050505050  | 91                |
| 31  | +91-8889990001 | 91                |
| 32  | +1-7776665554  | 1                 |
| 33  | +44-6665554443 | 44                |
| 34  | +61-5554443332 | 61                |
| 35  | +91-4443332221 | 91                |
| 36  | 91-1111111111  | 91                |
| 37  | 01-2222222222  | 01                |
| 38  | 44-3333333333  | 44                |
| 39  | 61-4444444444  | 61                |
| 40  | 91-5555555555  | 91                |

---
