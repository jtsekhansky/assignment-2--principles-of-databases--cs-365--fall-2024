DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE passwords.websites (
    website_name    VARCHAR(100)    NOT NULL,
    website_url     VARCHAR(128)    NOT NULL,
    PRIMARY KEY (website_name)
);

Insert into passwords.websites
 (website_name, website_url)
 values
 ("bing", "https://www.bing.com"),
 ("hartford", "https://www.hartford.edu"),
 ("cheshire high school", "https://www.cheshire.k12.ct.us"),
 ("olympic taekwondo academy", "https://otacheshire.com"),
 ("cheshire public library", "https://www.cheshirelibrary.org"),
 ("toyota", "https://www.toyota.com"),
 ("BJs wholesale club", "https://www.bjs.com"),
 ("Stop and Shop", "https://stopandshop.com"),
 ("Costco", "https://www.costco.com"),
 ("Amazon", "https://www.amazon.com");