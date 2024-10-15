SET SQL_SAFE_UPDATES = 0;
USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('secret password secret password ', 512));
SET @init_vector = X'C777333AAFABDFEA1988998985546789';

-- Create a new entry into the database, which already has your 10 initial entries

Insert into websites
 (website_name, website_url)
 values
 ("Yahoo", "https.//www.Yahoo.com");

 Insert into users
 (user_name, first_name, last_name, email)
 values
 ("flingming", "ming", "kale", "mkale@gmail.com");

 Insert into logins
 (user_name, website_name, password, comment, update_time)
 values
 ("flingming", "Yahoo", aes_encrypt('minmin', @key_str, @init_vector), "no comment", '2013-05-12 17:23:47');

-- Get the password associated with the URL of one of your 10 entries

SELECT CAST(aes_decrypt(logins.password, @key_str, @init_vector) AS CHAR)
FROM logins, websites
WHERE logins.website_name = websites.website_name and
websites.website_url = "https://www.bing.com";

-- Get all the password(user?)-related data, including the password associated with URLs that have https in two or your 10 entries

SELECT logins.user_name, logins.website_name, CAST(aes_decrypt(logins.password, @key_str, @init_vector) AS CHAR), logins.comment, logins.update_time, 
users.first_name, users.last_name, users.email, websites.website_url
FROM logins, users, websites
WHERE 
logins.website_name = websites.website_name and logins.user_name = users.user_name and website_url LIKE 'https%' LIMIT 1,2;

-- change a URL associated with one of the passwords in your 10 entries

 UPDATE websites
 SET website_url = "https://www.facebook.com/OTACheshire/" 
 WHERE
 websites.website_name in (SELECT logins.website_name FROM logins WHERE CAST(aes_decrypt(logins.password, @key_str, @init_vector) AS CHAR) = 'nobelt');

-- Change any password

 UPDATE logins
 SET password = aes_encrypt('snowboard', @key_str, @init_vector)
 WHERE
 logins.user_name = "jtisawesome";

-- Remove a tuple based on a URL

DELETE FROM websites, users, logins
USING websites, users, logins
WHERE
websites.website_url = "https://www.bjs.com" AND
websites.website_name = logins.website_name AND
logins.user_name = users.user_name;

 -- Remove a tuple based on a password

 DELETE FROM websites, users, logins
USING websites, users, logins
WHERE
CAST(aes_decrypt(logins.password, @key_str, @init_vector) AS CHAR) = "roomdorm" AND
websites.website_name = logins.website_name AND
logins.user_name = users.user_name;