
USE library1_db;

CREATE TABLE Author(
author_id INT AUTO_INCREMENT PRIMARY KEY,
namee VARCHAR(100) NOT NULL,
country VARCHAR(50)
);
CREATE TABLE Book(
book_id INT AUTO_INCREMENT PRIMARY KEY ,
title VARCHAR(100) NOT NULL,
author_id INT ,
publication_year INT,
FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

CREATE TABLE IF NOT EXISTS Member (
member_id INT AUTO_INCREMENT PRIMARY KEY ,
namee VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
join_date DATE
);

CREATE TABLE IF NOT EXISTS Loan(
loan_id INT AUTO_INCREMENT PRIMARY KEY ,
book_id INT,
member_id INT,
issue_date DATE,
return_date DATE,
FOREIGN KEY (book_id) REFERENCES Book(book_id),
FOREIGN KEY (member_id) REFERENCES Member(member_id)
);


 