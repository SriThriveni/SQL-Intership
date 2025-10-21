
CREATE DATABASE library_db;
USE library_db;

CREATE TABLE author (
   author_id INT AUTO_INCREMENT PRIMARY KEY ,
   name VARCHAR(100) NOT NULL,
   country VARCHAR(50)
   );
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY ,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES author(author_id)
           ON DELETE SET NULL
           ON UPDATE CASCADE
);

CREATE TABLE member (
     member_id INT AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(100) NOT NULL,
     email VARCHAR(100) UNIQUE,
     join_date DATE
);

CREATE TABLE loan ( 
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES book(book_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
	FOREIGN KEY (member_id) REFERENCES member(member_id)
			      ON DELETE CASCADE
            ON UPDATE CASCADE
	);
