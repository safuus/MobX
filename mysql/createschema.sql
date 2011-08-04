CREATE DATABASE  mobx default charset utf8;

CREATE USER 'mobx'@'%' identified by 'm06x$$*l';

GRANT ALL PRIVILEGES on mobx.* to mobx@'%';

FLUSH PRIVILEGES;

-- create tables --

CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(128),
    location varchar(128),
    iphone_udid varchar(64),
    photo BLOB,
    photo_path varchar(256),
    created_date TIMESTAMP DEFAULT NOW()
);

