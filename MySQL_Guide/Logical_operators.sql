USE mysql_bootcamp;
/*"Select all books NOT published in 2017"*/
SELECT title
FROM books
WHERE released_year NOT IN(2017);

/*Select all birthdays not between 1990 and 1992*/
SELECT name 
FROM people
WHERE YEAR(birthdate) NOT BETWEEN 1990 AND 1992;

/*Select books with titles that don't start with 'W'*/
SELECT title 
FROM books
WHERE title NOT LIKE 'W%';

/*result: 1*/
SELECT 99 > 1;

/*SELECT books written by Dave Eggers, published after the year 2010*/
SELECT * FROM books
WHERE author_fname = 'Dave'
AND author_lname = 'Eggers'
AND released_year > 2010;

/* AND equals && */
SELECT * FROM books
WHERE author_fname = 'Dave'
&& author_lname = 'Eggers'
&& released_year > 2010;


/* OR equals || */
SELECT * FROM books
WHERE author_lname='Eggers' ||
released_year > 2010;


/*Select all books written by...
Carver
Lahiri
Smith*/
SELECT * FROM books
WHERE author_lname IN ('Carver','Lahiri','Smith');

SELECT * FROM books
WHERE author_lname = 'Carver' OR author_lname = 'Lahiri' OR author_lname = 'Smith';

SELECT * FROM books
WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);


/*I only want books released after 2000 and year is even number*/
SELECT * FROM books
WHERE released_year > 2000
AND released_year % 2 = 0;

SELECT title,released_year,
	CASE
		WHEN released_year >= 2000 THEN 'Modren Lit'
		ELSE '20th Century Lit'
	END AS 'GENRE'
FROM books;

SELECT title, stock_quantity, 
	CASE
		WHEN stock_quantity > 100 THEN '***'
		WHEN stock_quantity >= 50 AND stock_quantity <= 100 THEN '**'
		ELSE '*'
	END AS STOCK
FROM books;

-- Result : 0 (False)
SELECT 10 != 10;

-- Result: 1 (True)
SELECT 15 > 14 && 99 - 5 <= 94;

-- Result: 1 (True)
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;

/*Select all books where author_lname  starts with a 'C' or an 'S''*/
SELECT * FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

-- OR
/*Select all books where author_lname  starts with a 'C' or an 'S''*/
SELECT * FROM books
WHERE SUBSTR(author_lname,1,1) IN ('C','S');

SELECT author_fname, author_lname,CONCAT(CAST(COUNT(*) AS CHAR(4)), ' book(s)') AS 'total books'
FROM books 
GROUP BY author_lname, author_fname;