-- Exercise 1
CREATE TABLE users(
id    INT          NOT NULL,
name  VARCHAR (20) NOT NULL,
color VARCHAR (20) NOT NULL) 

ALTER TABLE users
ADD COLUMN additionals VARCHAR (50) NOT NULL;

CREATE TABLE copy_of_1
AS SELECT * FROM users
WITH NO DATA;

DROP TABLE users;


-- Exercise 2
CREATE TABLE users3(
id    INT          NOT NULL,
name  VARCHAR (20) NOT NULL,
color VARCHAR (20) NOT NULL) 

CREATE INDEX index1 ON users3 (name asc);

ALTER INDEX index1 RENAME TO index_color;

DROP INDEX index_color;



-- Exercise 3
CREATE TABLE users5(
id    INT,
name  VARCHAR (20),
color VARCHAR (20));

BEGIN TRANSACTION;

INSERT INTO users5 (name) VALUES ('Waldek');

SELECT * FROM users5;

ROLLBACK TRANSACTION;