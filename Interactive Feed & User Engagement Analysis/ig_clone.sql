/*We want to reward our users who have been around the longest.  
Find the 5 oldest users.*/
SELECT *
FROM users
ORDER BY created_at 
limit 5;

/*What day of the week do most users register on?
We need to figure out when to schedule an ad campgain*/
SELECT date_format(created_at,'%W') AS 'day of the week', COUNT(*) AS 'total registration'/*This part of the query formats the created_at column, which presumably contains date and time information, to only display the day of the week. %W is a format specifier that represents the full weekday name */
FROM users
GROUP BY 1
ORDER BY 2 DESC;

/*We want to target our inactive users with an email campaign.
Find the users who have never posted a photo*/
SELECT username
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

/*We're running a new contest to see who can get the most likes on a single photo.
WHO WON??!!*/
SELECT MAX(users.username) AS username, photos.id, photos.image_url, COUNT(*) AS Total_Likes
FROM likes
JOIN photos ON photos.id = likes.photo_id
JOIN users ON users.id = likes.user_id
GROUP BY photos.id
ORDER BY Total_Likes DESC
LIMIT 1;

/*Our Investors want to know...
How many times does the average user post?*/
/*total number of photos/total number of users*/
SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users),2);

/*user ranking by postings higher to lower*/
SELECT users.username,COUNT(photos.image_url)
FROM users
JOIN photos ON users.id = photos.user_id
GROUP BY users.id
ORDER BY 2 DESC;

/*Total Posts by users (longer versionof SELECT COUNT(*)FROM photos) */
SELECT SUM(user_posts.total_posts_per_user)
FROM (SELECT users.username,COUNT(photos.image_url) AS total_posts_per_user
		FROM users
		JOIN photos ON users.id = photos.user_id
		GROUP BY users.id) AS user_posts;
        
/*total numbers of users who have posted at least one time */
SELECT COUNT(DISTINCT(users.id)) AS total_number_of_users_with_posts
FROM users
JOIN photos ON users.id = photos.user_id;

/*A brand wants to know which hashtags to use in a post
What are the top 5 most commonly used hashtags?*/
SELECT tag_name, COUNT(tag_name) AS total
FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC;

/*We have a small problem with bots on our site...
Find users who have liked every single photo on the site*/
SELECT users.id,username, COUNT(users.id) As total_likes_by_user
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes_by_user = (SELECT COUNT(*) FROM photos);

/*We also have a problem with celebrities
Find users who have never commented on a photo*/
SELECT username,comment_text
FROM users
LEFT JOIN comments ON users.id = comments.user_id
GROUP BY users.id
HAVING comment_text IS NULL;

SELECT COUNT(*) AS total_number_of_users_without_comments
FROM
    (SELECT users.id
    FROM users
    LEFT JOIN comments ON users.id = comments.user_id
    GROUP BY users.id
    HAVING COUNT(comment_text) = 0) AS total_users_without_comments;
    
/*Find users who have ever commented on a photo*/
SELECT username,comment_text
FROM users
LEFT JOIN comments ON users.id = comments.user_id
GROUP BY users.id
HAVING comment_text IS NOT NULL;

SELECT COUNT(*) AS total_number_users_with_comments
FROM
    (SELECT users.id
    FROM users
    LEFT JOIN comments ON users.id = comments.user_id
    GROUP BY users.id
    HAVING COUNT(comment_text) > 0) AS total_users_with_comments;
