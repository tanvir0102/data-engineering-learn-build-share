
# Library Data Model Analysis Using SQL

### Create Authors Table to store author details
```
CREATE TABLE authors (
  author_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
```

### Create Books Table to store book details
```
CREATE TABLE books (
  book_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author_id INT NOT NULL,
  isbn VARCHAR(13) NOT NULL,
  FOREIGN KEY (author_id) REFERENCES authors (author_id)
);
```

### Create Borrowers Table to store borrower details
```
CREATE TABLE borrowers (
  borrower_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL
);
```
