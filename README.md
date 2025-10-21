# SQL-Intership
  
## Library Management System (MySQL)

##  Objective
Design and implement a relational database schema for a **Library Management System** to manage 
authors, books, members, and book loans.

---

##  Tools Used
- MySQL
- MySQL Workbench 
- GitHub

---

##  Database Design Overview

###  Entities
1. **Author** – Stores details about authors.  
2. **Book** – Stores book details and references authors.  
3. **Member** – Library users who borrow books.  
4. **Loan** – Records issued and returned books.

---

## 🧾 Table Details

### `author`
| Column         | Type            | Constraints                  |
|----------------|------------------|-------------------------------|
| author_id      | INT              | PRIMARY KEY, AUTO_INCREMENT   |
| name           | VARCHAR(100)     | NOT NULL                      |
| country        | VARCHAR(50)      |                               |

---

### `book`
| Column            | Type            | Constraints                                                |
|---------------------|-----------------|-------------------------------------------------------------|
| book_id             | INT             | PRIMARY KEY, AUTO_INCREMENT                                 |
| title               | VARCHAR(100)    | NOT NULL                                                   |
| author_id           | INT             | FOREIGN KEY → author(author_id)                             |
| publication_year    | YEAR            |                                                             |

- **On Delete:** `SET NULL` (keeps book record if author is deleted)  
- **On Update:** `CASCADE` (updates foreign key if author_id changes)

---

### `member`
| Column        | Type            | Constraints                        |
|---------------|------------------|-------------------------------------|
| member_id     | INT              | PRIMARY KEY, AUTO_INCREMENT         |
| name          | VARCHAR(100)     | NOT NULL                            |
| email         | VARCHAR(100)     | UNIQUE                              |
| join_date     | DATE             |                                     |

---

### `loan`
| Column         | Type            | Constraints                                                      |
|----------------|------------------|-------------------------------------------------------------------|
| loan_id        | INT              | PRIMARY KEY, AUTO_INCREMENT                                       |
| book_id        | INT              | FOREIGN KEY → book(book_id)                                       |
| member_id      | INT              | FOREIGN KEY → member(member_id)                                   |
| issue_date     | DATE             | NOT NULL                                                          |
| return_date    | DATE             | NULL (until book is returned)                                     |

- **On Delete:** `CASCADE` (loan deleted if member/book deleted)  
- **On Update:** `CASCADE`

---

## 🧰 SQL Script

```sql
CREATE DATABASE library_db;
USE library_db;

CREATE TABLE author (
   author_id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   country VARCHAR(50)
);

CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
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
