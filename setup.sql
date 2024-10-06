DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE passwords.websites (
    website_name    VARCHAR(100)    ,
    website_url     VARCHAR(128)    NOT NULL,
    PRIMARY KEY (website_name)
);

CREATE TABLE passwords.users (
    user_name        VARCHAR(45)    ,
    first_name      VARCHAR(45)     NOT NULL,
    last_name       VARCHAR(45)     NOT NULL,
    email           VARCHAR(45)    NOT NULL,
    PRIMARY KEY (user_name)
);

CREATE TABLE passwords.logins (
    user_name        VARCHAR(45)    ,
    website_name     VARCHAR(100)    NOT NULL,
    password        LONGBLOB    NOT NULL,
    comment         VARCHAR(2000)    NOT NULL,
    update_time     DATETIME    NOT NULL,
    PRIMARY KEY (user_name)
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

 Insert into passwords.users
 (user_name, first_name, Last_name, email)
 values
("jtisawesome", "jacob", "tsekansky", "j@bing.com"),
("collegegood", "jacob", "tsekansky", "j@h0rtfurd.com"),
("schoolgreat", "david", "tsekansky", "d@cheshire.com"),
("blackbelt", "joe", "schmoe", "j@schmoe.com"),
("bookwarrior", "rahn", "kazowski", "rkazowski@books.org"),
("bestdriver", "lexi", "brimmings", "lbrims@toyota.com"),
("gurl479", "leah", "stephens", "stephens@gmail.com"),
("saleshopstop", "brenna", "mullings", "mulls@stopshop.com"),
("savingbrands", "rahn", "kazowski", "kaz@brand.com"),
("warehouselifter", "lexi", "brimmings", "bestlift@atoz.com");
Insert into passwords.logins
 (user_name, website_name, password, comment, update_time)
 values
 ("jtisawesome", "bing", aes_encrypt('dirtman', 'secret password'), "no comment", '2024-09-28 17:00:00'),
 ("collegegood", "hartford", aes_encrypt('roomdorm', 'secret password'), "nice school", '2024-09-28 17:00:00'),
 ("schoolgreat", "cheshire high school", aes_encrypt('moreclass', 'secret password'), "nice school", '2024-09-28 17:00:00'),
 ("blackbelt", "olympic taekwondo academy", aes_encrypt('nobelt', 'secret password'), "many different rankings", '2014-08-26 08:00:00'),
 ("bookwarrior", "cheshire public library", aes_encrypt('bookmark', 'secret password'), "too many books", '2021-06-03 08:00:00'),
 ("bestdriver", "toyota", aes_encrypt('goodspeed', 'secret password'), "comfortable cars", '2023-06-09 08:00:00'),
 ("gurl1479", "BJs wholesale club", aes_encrypt('dropshop', 'secret password'), "variety of fruit", '2022-05-14 08:00:00'),
 ("saleshopstop", "Stop and Shop", aes_encrypt('shopstop', 'secret password'), "lots of food", '2016-12-01 08:00:00'),
 ("savingbrands", "Costco", aes_encrypt('coupon', 'secret password'), "lots of food", '2008-04-15 08:00:00'),
 ("warehouselifter", "Amazon", aes_encrypt('boxes', 'secret password'), "free shipping", '2020-06-10 08:00:00');