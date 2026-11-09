--Ans of a

CREATE TABLE Writers (
    writer_id INT,
    name VARCHAR2(50),
    contact_info VARCHAR2(11),
    experience VARCHAR2(300),
    constraints pk_id PRIMARY KEY(writer_id)
);


CREATE TABLE Comics (
    comic_id INT ,
    writer_id INT,
    comic_title VARCHAR2(50),
    genre VARCHAR2(50),
    no_of_characters INT,
    summary VARCHAR2(300),
    constraints pk_id PRIMARY KEY(comic_id),
    constraints fk_id FOREIGN KEY (writer_id) REFERENCES Writers(writer_id)
);


CREATE TABLE Reviewers (
    reviewer_id INT,
    name VARCHAR2(50),
    address VARCHAR2(50),
    age INT,
    gender VARCHAR2(1),
    constraints pk_id PRIMARY KEY(reviewer_id)
);


CREATE TABLE Ratings (
    rating_id INT,
    comic_id INT,
    reviewer_id INT,
    rating INT,
    comment VARCHAR2(150),
    constraints pk_id PRIMARY KEY(rating_id),
    constraints fk_id1 FOREIGN KEY (comic_id) REFERENCES Comics(comic_id),
    constraints fk_id2 FOREIGN KEY (reviewer_id) REFERENCES Reviewers(reviewer_id)
);

--Ans of b

1.

SELECT c.genre
FROM Comics c
JOIN Ratings r ON c.comic_id = r.comic_id
JOIN Reviewers rv ON r.reviewer_id = rv.reviewer_id
GROUP BY c.genre
HAVING
    (SELECT COUNT(DISTINCT reviewer_id) FROM Ratings WHERE comic_id = c.comic_id AND rv.gender = 'F') >
    (SELECT COUNT(DISTINCT reviewer_id) FROM Ratings WHERE comic_id = c.comic_id AND rv.gender = 'M');


2.

SELECT w.writer_id, w.name AS author_name, COUNT(r.rating_id) AS num_ratings
FROM Writers w
JOIN Comics c ON w.writer_id = c.writer_id
JOIN Ratings r ON c.comic_id = r.comic_id
GROUP BY w.writer_id, author_name
HAVING AVG(r.rating) > (SELECT AVG(rating) FROM Ratings)
ORDER BY num_ratings DESC
LIMIT 3;

--Ans of c

CREATE OR REPLACE VIEW ComicInfo AS
SELECT c.comic_id, c.comic_title, c.genre, c.no_of_characters, c.summary,
       COUNT(r.rating_id) AS num_ratings,
       AVG(r.rating) AS avg_rating
FROM Comics c
JOIN Ratings r ON c.comic_id = r.comic_id
GROUP BY c.comic_id, c.comic_title, c.genre, c.no_of_characters, c.summary;

