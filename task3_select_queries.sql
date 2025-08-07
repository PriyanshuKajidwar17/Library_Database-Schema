
-- 1. SELECT All Columns
SELECT * FROM students;

-- 2. SELECT Specific Columns
SELECT first_name, last_name, grade FROM students;

-- 3. WHERE Clause (Filter by city)
SELECT * FROM students
WHERE city = 'Mumbai';

-- 4. WHERE with AND (Multiple Conditions)
SELECT * FROM students
WHERE city = 'Pune' AND grade > 8.0;

-- 5. WHERE with OR
SELECT * FROM students
WHERE city = 'Pune' OR city = 'Nagpur';

-- 6. LIKE (Pattern Matching)
SELECT * FROM students
WHERE first_name LIKE 'A%';

-- 7. BETWEEN (Range Filtering)
SELECT * FROM students
WHERE age BETWEEN 18 AND 22;

-- 8. ORDER BY (Sorting)
SELECT * FROM students
ORDER BY grade DESC;

-- 9. LIMIT (Restricting Number of Rows)
SELECT * FROM students
ORDER BY grade DESC
LIMIT 5;
