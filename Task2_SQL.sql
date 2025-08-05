
-- Table creation
CREATE TABLE Students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    age INTEGER,
    city TEXT DEFAULT 'Unknown'
);

-- INSERT INTO (with NULLs and Defaults)
INSERT INTO Students (id, name, email, age, city)
VALUES (1, 'Priya', 'priya@example.com', 22, 'Delhi');

INSERT INTO Students (id, name, email, age, city)
VALUES (2, 'Aashu', NULL, 23, 'Mumbai');

INSERT INTO Students (id, name, email, age)
VALUES (3, 'Ravi', 'ravi@example.com', 21);

INSERT INTO Students (id, name, email, age, city)
VALUES (4, 'Meena', 'meena@example.com', NULL, 'Pune');

INSERT INTO Students (id, name)
VALUES (5, 'Karan');

-- UPDATE (Handling NULLs or correcting info)
UPDATE Students
SET city = 'Bangalore'
WHERE name = 'Ravi';

UPDATE Students
SET email = 'aashu123@example.com'
WHERE name = 'Aashu';

UPDATE Students
SET age = 20
WHERE name = 'Meena';

-- DELETE (with WHERE clause)
DELETE FROM Students
WHERE name = 'Karan';

DELETE FROM Students
WHERE city = 'Mumbai';
