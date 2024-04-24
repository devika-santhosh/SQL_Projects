/*data preparation*/
CREATE DATABASE mysql_bootcamp;
USE mysql_bootcamp;
CREATE TABLE cats
	(
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    breed VARCHAR(50),
	age INT NOT NULL,
    PRIMARY KEY(cat_id)
    );

INSERT INTO cats(name, breed, age)
	VALUES('Ringo', 'Tabby', 4),
		   ('Cindy', 'Maine Coon', 10),
		   ('Dumbledore', 'Maine Coon', 11),
		   ('Egg', 'Persian', 4),
		   ('Misty', 'Tabby', 13),
		   ('George Michael', 'Ragdoll', 9),
		   ('Jackson', 'Sphynx', 7);
    
    #--------------------------#
#id only
SELECT cat_id FROM cats;

#name,breed columns
SELECT name,breed
FROM cats;

#just Tabby breed cats only
SELECT name,age
FROM cats
WHERE breed LIKE 'Tabby';

#cat id same as age
SELECT cat_id,age
FROM cats
WHERE cat_id = age;

#Change Jackson's name to "Jack"
UPDATE cats
SET name = 'Jack'
WHERE name ='Jackson';

#Change Ringo's breed to "British Shorthair"
UPDATE cats
SET breed = 'British Shorthair'
WHERE name = 'Ringo';

#Update both Maine Coons' ages to be 12
UPDATE cats
SET age = 12
WHERE breed = 'Maine Coon';

#DELETE all 4 year old cats
DELETE FROM cats
WHERE age = 4;

#DELETE cats whose age is the same as their cat_id
DELETE FROM cats
WHERE cat_id = age;

#DELETE all cats
DELETE FROM cats;
    #--------------------------#
    
/*
Shirt table
*/ /*
shirt_id	article			color	shirt_size	last_worn
---------------------------------------------------------
1			t-shirt			white	S			10
2			t-shirt			green	S			200
3			polo shirt		black	M			10
4			tank top		blue	S			50
5			t-shirt			pink	S			0
6			polo shirt		red		M			5
7			tank top		white	S			200
8			tank top		blue	M			15

*/
/*create table shirts*/
CREATE TABLE shirts(
	shirt_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	article VARCHAR(50),
	color VARCHAR(50),
	shirt_size VARCHAR(1),
	last_worn INT
);

SHOW TABLES;

DESC shirts;


/*add values*/
INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

/*Add A New Shirt
Purple polo shirt, size M last worn 50 days ago*/
INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES ('polo shirt','purple','M',50);


/*Update all polo shirts
Change their size to L*/
UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';

/*alter table of shirtsize*/
ALTER TABLE shirts
MODIFY COLUMN shirt_size VARCHAR(2);

/*Update all white shirts
Change size to 'XS' and color to 'off white'*/
UPDATE shirts
SET shirt_size = 'XS',
	color = 'off white'
WHERE color = 'white';

/*Delete all shirts*/
DELETE FROM shirts;