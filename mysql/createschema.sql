CREATE DATABASE  mobx default charset utf8;

CREATE USER 'mobx'@'192.168.1.0/255.255.255.0' identified by 'm06x$&*l';

GRANT ALL PRIVILEGES on mobx.* to mobx@'192.168.1.0/255.255.255.0';

-- create tables --

CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(128),
    location varchar(128),
    iphone_udid varchar(64),
    created_date TIMESTAMP DEFAULT NOW()
);

