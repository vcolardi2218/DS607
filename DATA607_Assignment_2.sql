DROP SCHEMA IF EXISTS `movies_master`;
CREATE SCHEMA `movies_master`;
USE `movies_master`;
DROP TABLE IF EXISTS `movies`;
DROP TABLE IF EXISTS `critics`;
DROP TABLE IF EXISTS `ratings`;

CREATE TABLE critics (
personid int NOT NULL AUTO_INCREMENT,
firstname varchar(255) NOT NULL,
lastname varchar(255) NOT NULL,
PRIMARY KEY (`personid`)
);

LOCK TABLES critics WRITE;
INSERT INTO critics (firstname,lastname) VALUES 
('John','Doe'), 
('Jane','Smith'), 
('Rich','Sampson'), 
('Jim','Bunyan'), 
('Jimmy','Hendrix');
UNLOCK TABLES;

CREATE TABLE movies (
movieid int NOT NULL AUTO_INCREMENT,
name varchar(255) NOT NULL,
PRIMARY KEY (`movieid`)
);
LOCK TABLES movies WRITE;
INSERT INTO movies (name) VALUES 
('Black Panther'), 
('Jurassic World Falling Kingdom'), 
('Avengers Affinity War'), 
('Crazy Rich Asians'), 
('Thor Ragnarok'),
('A Quiet Place');
UNLOCK TABLES;

CREATE TABLE ratings (
ratingsid int NOT NULL AUTO_INCREMENT,
rating int ,
movieid int NOT NULL,
personid int,
PRIMARY KEY (`ratingsid`),
FOREIGN KEY (movieid) REFERENCES movies (movieid) ON UPDATE CASCADE,
FOREIGN KEY (personid) REFERENCES critics (personid) ON UPDATE CASCADE
);

LOCK TABLES ratings WRITE;
INSERT INTO ratings (movieid,personid,rating) 
VALUES 
(1,1,1), (1,2,2), (1,3,3), (1,4,4), (1,5,5), 
(2,1,5), (2,2,4), (2,3,3), (2,4,2), (2,5,1), 
(3,1,1), (3,2,2), (3,3,3), (3,4,4), (3,5,5),
(4,1,5), (4,2,4), (4,3,3), (4,4,2), (4,5,1),
(5,1,1), (5,2,2), (5,3,3), (5,4,4), (5,5,5),
(6,1,5), (6,2,4), (6,3,3), (6,4,2), (6,5,1);
UNLOCK TABLES;
