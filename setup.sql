DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE passwords.websites (
    website_name    VARCHAR(100)    ,
    website_url     VARCHAR(128)    NOT NULL,
    PRIMARY KEY (website_name)
);

CREATE TABLE passwords.users (
    user_name        VARCHAR(32)    ,
    first_name      VARCHAR(32)     NOT NULL,
    last_name       VARCHAR(32)     NOT NULL,
    email           VARCHAR(320)    NOT NULL,
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