/****************************************/
/*   30 SQL Queries    */
/****************************************/

CREATE DATABASE Employee_db;
/*1. Delete table Employee, Department and Company.*/
USE Employee_db;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Company;

/*
2. Create tables:
Employee with attributes (id, name, city, department, salary)
Department with attributes (id, name)
Company with attributes (id, name, revenue)
*/
CREATE TABLE Department(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL
    );
CREATE TABLE Company(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    revenue int
    );
CREATE TABLE Employee(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(150) NOT NULL,
    department_id INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY(department_id) REFERENCES department(id)
);
/*
3. Add rows into Department table
(1, 'IT'),
(2, 'Management'),
(3, 'IT'),
(4, 'Support');
*/
INSERT INTO Department(name)
VALUES
('IT'),
('Management'),
('IT'),
('Support');

/*
4. Add rows into Company table
(1, 'IBM', 2000000),
(2, 'GOOGLE', 9000000),
(3, 'Apple', 10000000);
*/

INSERT INTO Company(name,revenue)
VALUES
('IBM', 2000000),
('GOOGLE', 9000000),
('Apple', 10000000);

/*
5.Add rows into employee table:
(1, 'David', 'London', 3, 80000),
(2, 'Emily', 'London', 3, 70000),
(3, 'Peter', 'Paris', 3, 60000),
(4, 'Ava', 'Paris', 3, 50000),
(5, 'Penny', 'London', 2, 110000),
(6, 'Jim', 'London', 2, 90000),
(7, 'Amy', 'Rome', 4, 30000),
(8, 'Cloe', 'London', 3, 110000);
*/

INSERT INTO Employee(name, city, department_id, salary)
VALUES
('David', 'London', 3, 80000),
('Emily', 'London', 3, 70000),
('Peter', 'Paris', 3, 60000),
('Ava', 'Paris', 3, 50000),
('Penny', 'London', 2, 110000),
('Jim', 'London', 2, 90000),
('Amy', 'Rome', 4, 30000),
('Cloe', 'London', 3, 110000);

/*
6. Query all rows from Department table
*/
SELECT * FROM Department;

/*
7. Change the name of department with id =  1 to 'Management'
*/
UPDATE Department
SET name = 'Management'
WHERE id = 1;

/*
8. Delete employees with salary greater than 100 000
*/
DELETE FROM Employee
WHERE salary>100000 AND id > 0;

/*
9. Query all companies with revenue smaller than 5 000 000, but you cannot use the '<' operator
*/
SELECT name FROM Company
ORDER BY revenue
LIMIT 1;

/*version 2*/
SELECT * FROM company
WHERE NOT revenue >= 5000000;

/*
10. Query all employees with salary greater than 50 000 and smaller than 70 000 with and without between
*/
SELECT name FROM Employee 
WHERE salary BETWEEN 50000 AND 70000;

/*version 2*/
SELECT name FROM Employee 
WHERE salary >= 50000 AND salary <= 70000;

/*
11. Query all employees with salary not equal to 80 000
*/
SELECT * FROM employee
WHERE salary <> 80000;

/*
12. Query all names of employees with salary greater than 70 000 together with employees who work on the 'IT' department.
*/

SELECT * FROM employee
WHERE salary > 70000 
AND department_id IN(
SELECT id FROM department
    WHERE name = 'IT'
    );

/*
13. Query all employees that work in city that starts with 'L'
*/
SELECT * FROM employee
WHERE city LIKE 'L%';

/*
14. Query all employees that work in city that starts with 'L' or ends with 's'
*/
SELECT * FROM employee
WHERE city LIKE 'L%' OR city LIKE '%s';

/*
15. Query all departments (each name only once)
*/
SELECT DISTINCT name FROM department;

/*
16. Query names of all employees together with id of department they work in, using JOIN
*/

/*
17. Query names of all employees together with id of department they work in, but you cannot use JOIN
*/
SELECT emp.name,dept.id,dept.name
FROM employee emp, department dept
WHERE emp.department_id = dept.id
ORDER BY emp.name, dept.id;

/*
18. Query name of every company together with every department
Personal thoughts: It is kinda weird question, as there is no relationship between company and departement
*/
SELECT com.name,dep.name
FROM company com, department dep
ORDER BY com.name;

/*
19. Query name of every company together with departments without the 'Support' department
*/
SELECT com.name,dep.name
FROM company com, department dep
WHERE dep.name NOT LIKE 'Support'
ORDER BY com.name;

/*
20. Query employee name together with the department name that they are not working in
*/
SELECT emp.name, dep.name
FROM employee emp, department dep
WHERE emp.department_id <> dep.id;

/*
21. Query company name together with other companies names
LIKE:
GOOGLE Apple
GOOGLE IBM
Apple IBM
...
*/
SELECT com1.name, com2.name
FROM company com1, company com2
WHERE com1.name <> com2.name
ORDER BY com1.name,com2.name;


/*
22. Query employee names with salary smaller than 80 000 without using NOT and <
NOTE: for POSTGRESQL only. Mysql doesn't support except
*/
SELECT e1.name FROM employee e1
EXCEPT
SELECT e2.name FROM employee e2 WHERE e2.salary >= 80000;

/*
23. Query all employees that work in same department as Peter
*/
SELECT * FROM employee
WHERE department_id IN(
	SELECT department_id FROM employee
    WHERE name LIKE 'Peter'
)
AND name NOT LIKE 'Peter';

