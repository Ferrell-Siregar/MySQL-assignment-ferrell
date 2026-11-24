
USE library_db;

CREATE DATABASE IF NOT EXISTS library_db;

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year YEAR,
    category_id INT,
    CONSTRAINT fk_books_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


INSERT INTO categories (category_name) VALUES
('Technology'),
('Business'),
('Fiction'),
('Science'),
('History');

INSERT INTO books (title, author, published_year, category_id) VALUES
('Clean Code', 'Robert C. Martin', 2008, 1),
('PHP & MySQL: Server-side Web Development', 'Jon Duckett', 2022, 1),
('The Pragmatic Programmer', 'Andrew Hunt', 2019, 1),
('Atomic Habits', 'James Clear', 2018, 2),
('The Lean Startup', 'Eric Ries', 2011, 2),
('Zero to One', 'Peter Thiel', 2014, 2),
('Project Hail Mary', 'Andy Weir', 2021, 3),
('Laskar Pelangi', 'Andrea Hirata', 2005, 3),
('A Brief History of Time', 'Stephen Hawking', 1988, 4),
('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 2015, 5);


SELECT * FROM books;


SELECT * FROM books
WHERE published_year > 2015;


SELECT * FROM books
ORDER BY published_year DESC;


SELECT b.book_id, b.title, b.author, b.published_year, c.category_name
FROM books b
LEFT JOIN categories c ON b.category_id = c.category_id;


UPDATE books
SET title = 'Clean Code: A Handbook of Agile Software Craftsmanship'
WHERE book_id = 1;


UPDATE books
SET category_id = 4
WHERE book_id = 7;


DELETE FROM books
WHERE book_id = 8;


DELETE FROM categories
WHERE category_id = 5;


SELECT b.title AS book_title, b.author, c.category_name
FROM books b
INNER JOIN categories c ON b.category_id = c.category_id;