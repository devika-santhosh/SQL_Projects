USE mysql_bootcamp;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

#----------------------------------------------------------------------------------------#

/*I need full name of authors*/
SELECT CONCAT(author_fname,' ',author_lname) as name
FROM books;

/*concat_ws with seperator between all specified columns*/
SELECT CONCAT_WS(' - ',author_fname,author_lname) as name
FROM books;

/*result: hell*/
SELECT SUBSTRING('Helloworld',1,4);

/*World*/
SELECT SUBSTRING('Hello World', 7);

/*rld*/
SELECT SUBSTRING('Hello World', -3);

/*SUBSTRING = SUBSTR*/
SELECT SUBSTR('hello world',-3);

/*shorten book's title ...*/
SELECT 
	CONCAT(SUBSTR(title,1,10), '___')
FROM books;

/*replace Hell with %$#@ 
Result => %$#@o World
*/
SELECT REPLACE('Hello World', 'Hell', '%$#@');

/*Result => dlroW olleH*/
SELECT REVERSE('Hello World');

/*Result => 11*/
SELECT CHAR_LENGTH('Hello World');

/*HELLO WORLD*/
SELECT UPPER('Hello World');

/*
'I-like-cats'
*/
SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
  
  /*Print book titles and the length of each title
+-----------------------------------------------------+-----------------+
| title                                               | character count |
+-----------------------------------------------------+-----------------+
| The Namesake                                        |              12 |
-------------------------------------------------------------------------
*/
SELECT title,LENGTH(title) AS 'character count'
FROM books;

/*
+---------------+-------------+--------------+
| short title   | author      | quantity     |
+---------------+-------------+--------------+
| American G... | Gaiman,Neil | 12 in stock  |
| A Heartbre... | Eggers,Dave | 104 in stock |
+---------------+-------------+--------------+
*/
SELECT CONCAT(SUBSTR(title,1,10),'...') AS 'short title',
	CONCAT(author_lname,',',author_fname) AS author,
	CONCAT(stock_quantity,' in stock') AS quantity
FROM books
ORDER BY 1;

/*Find the longest book (but took long as 2 quries have to run)*/
SELECT *
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
/* Faster way */
SELECT * FROM books
ORDER BY pages DESC
LIMIT 1;

/*Find the year each author published their first book*/
SELECT author_fname, MIN(released_year) AS first_published_year
FROM books
GROUP BY author_fname;
/* ---------------------------- */
