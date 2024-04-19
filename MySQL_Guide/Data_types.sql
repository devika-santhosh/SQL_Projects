USE mysql_bootcamp;
/* data prep */
CREATE TABLE people 
	(
    name VARCHAR(100), 
    birthdate DATE, 
    birthtime TIME, 
    birthdt DATETIME
    );

INSERT INTO people (name, birthdate, birthtime, birthdt)
	VALUES
    ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO people (name, birthdate, birthtime, birthdt)
	VALUES
    ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 /*-----------------------------------*/
/*
Date time functions

CURDATE()	- gives current date

CURTIME()	- gives current time

NOW()		- gives current datetime

Date time format


DAY()

DAYNAME()

DAYOFWEEK()

DAY OF YEAR()
*/
   
/*dd-MM-YY*/
SELECT birthdate, DATE_FORMAT(birthdate, '%d-%m-%y at %h-%m') AS 'formated_date'
FROM people;

SELECT 
    birthdate, 
    DATEDIFF(NOW(), birthdate) AS 'number_of_days_between_today_and_birthdate',
    DATEDIFF(NOW(), birthdate) / 365 AS Age
FROM people;
/*-----------------------------------*/

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Richard', CURDATE(), CURTIME(), NOW());

SELECT birthdate, DAYOFYEAR('2024-04-19')
FROM people;

/*-----------------------------------*/

/*Print Out The Current Time*/
SELECT CURTIME();

/*Print Out The Current Date (but not time)*/
SELECT CURDATE();

/*Print Out The Current Day Of The Week (the number)*/
SELECT DAY(NOW());
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;

/*Print Out The Current Day Of The Week (The Day Name)*/
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

/*Print out the current day and time using this format:mm/dd/yyyy*/
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

/*Print out the current day and time using this format:
January 2nd at 3:15 O/ April 1st at 10:18
https://www.w3resource.com/mysql/date-and-time-functions/mysql-date_format-function.php
*/
SELECT DATE_FORMAT(NOW(),'%M %D at %H:%m');
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

/*Create a tweets table that stores:
The Tweet content
A Username
Time it was created*/
CREATE TABLE tweets(
	tweet VARCHAR(140) NOT NULL,
	username VARCHAR(100) NOT NULL,
	created_at	TIMESTAMP DEFAULT NOW()
);