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



