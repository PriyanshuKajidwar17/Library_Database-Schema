📑 Step 1: Create Base Tables
-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name TEXT,
    course TEXT
);

-- Marks Table
CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject TEXT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

✅ Sample Data Inserted
INSERT INTO students VALUES 
(1, 'Priya', 'MCA'), 
(2, 'Aashu', 'BCA'), 
(3, 'Ravi', 'MCA');

INSERT INTO marks VALUES 
(101, 1, 'DBMS', 85), 
(102, 2, 'DBMS', 65), 
(103, 3, 'DBMS', 92);

📑 Step 2: Create Views
1. Simple View (Filter by Course)
CREATE VIEW MCA_Students AS
SELECT student_id, name
FROM students
WHERE course = 'MCA';


Usage:

SELECT * FROM MCA_Students;


Output:

student_id	name
1	Priya
3	Ravi
2. Complex View (Join Students + Marks)
CREATE VIEW StudentMarks AS
SELECT s.student_id, s.name, s.course, m.subject, m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id;


Usage:

SELECT * FROM StudentMarks WHERE marks > 80;


Output:

student_id	name	course	subject	marks
1	Priya	MCA	DBMS	85
3	Ravi	MCA	DBMS	92
3. Security View (Hide Student ID)
CREATE VIEW PublicMarks AS
SELECT name, subject, marks
FROM StudentMarks;


Usage:

SELECT * FROM PublicMarks;


Output:

name	subject	marks
Priya	DBMS	85
Aashu	DBMS	65
Ravi	DBMS	92
