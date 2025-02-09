-- Library Management System

-- Create the Database and Tables
---------------------------------------------

-- 1 Create the database
CREATE DATABASE library;
USE library;

-- Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create the Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


-- 2: Insert Sample Data
----------------------------------------

-- Insert 10 records into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St, City A', '111-111-1111'),
(2, 102, '456 Elm St, City B', '222-222-2222'),
(3, 103, '789 Oak St, City C', '333-333-3333'),
(4, 104, '321 Pine St, City D', '444-444-4444'),
(5, 105, '654 Maple St, City E', '555-555-5555'),
(6, 106, '987 Birch St, City F', '666-666-6666'),
(7, 107, '135 Cedar St, City G', '777-777-7777'),
(8, 108, '246 Walnut St, City H', '888-888-8888'),
(9, 109, '369 Spruce St, City I', '999-999-9999'),
(10, 110, '480 Cherry St, City J', '000-000-0000');

-- Insert 10 records into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'John Doe', 'Manager', 60000, 1),
(102, 'Jane Smith', 'Librarian', 45000, 2),
(103, 'Alice Johnson', 'Assistant Librarian', 40000, 3),
(104, 'Bob Brown', 'Clerk', 35000, 4),
(105, 'Charlie Davis', 'Manager', 62000, 5),
(106, 'Eva Green', 'Librarian', 47000, 6),
(107, 'Frank White', 'Assistant Librarian', 41000, 7),
(108, 'Grace Lee', 'Clerk', 36000, 8),
(109, 'Henry Carter', 'Manager', 63000, 9),
(110, 'Ivy Hall', 'Librarian', 48000, 10);

-- Insert 10 records into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('ISBN001', 'The Great Gatsby', 'Fiction', 10.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('ISBN002', 'To Kill a Mockingbird', 'Fiction', 12.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('ISBN003', '1984', 'Fiction', 11.00, 'no', 'George Orwell', 'Secker & Warburg'),
('ISBN004', 'Pride and Prejudice', 'Fiction', 9.00, 'yes', 'Jane Austen', 'T. Egerton'),
('ISBN005', 'The Catcher in the Rye', 'Fiction', 10.50, 'no', 'J.D. Salinger', 'Little, Brown and Company'),
('ISBN006', 'The Hobbit', 'Fantasy', 15.00, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
('ISBN007', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 14.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('ISBN008', 'The Da Vinci Code', 'Mystery', 13.00, 'no', 'Dan Brown', 'Doubleday'),
('ISBN011', 'The Little Prince', 'Adventure', 28.00, 'no', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock'),
('ISBN009', 'The Alchemist', 'Adventure', 12.50, 'yes', 'Paulo Coelho', 'HarperCollins'),
('ISBN010', 'Sapiens: A Brief History of Humankind', 'History', 18.00, 'yes', 'Yuval Noah Harari', 'Harper');


-- Insert 10 records into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Alice Johnson', '789 Oak St, City A', '2021-12-01'),
(2, 'Bob Brown', '321 Pine St, City B', '2022-03-15'),
(3, 'Charlie Davis', '654 Maple St, City C', '2021-11-20'),
(4, 'Diana Evans', '987 Birch St, City D', '2023-01-10'),
(5, 'Eva Green', '135 Cedar St, City E', '2022-07-05'),
(6, 'Frank White', '246 Walnut St, City F', '2021-09-12'),
(7, 'Grace Lee', '369 Spruce St, City G', '2023-04-18'),
(8, 'Henry Carter', '480 Cherry St, City H', '2022-05-22'),
(9, 'Ivy Hall', '123 Main St, City I', '2021-08-30'),
(11, 'Ivu lee', '126 Main Ctrl, City H', '2020-08-30'),
(10, 'Jack King', '456 Elm St, City J', '2023-06-25');

-- Insert 10 records into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'The Great Gatsby', '2023-06-01', 'ISBN001'),
(2, 2, 'To Kill a Mockingbird', '2023-06-05', 'ISBN002'),
(3, 3, '1984', '2023-06-10', 'ISBN003'),
(4, 4, 'Pride and Prejudice', '2023-06-15', 'ISBN004'),
(5, 5, 'The Catcher in the Rye', '2023-06-20', 'ISBN005'),
(6, 6, 'The Hobbit', '2023-06-25', 'ISBN006'),
(7, 7, 'Harry Potter and the Sorcerer\'s Stone', '2023-06-30', 'ISBN007'),
(8, 8, 'The Da Vinci Code', '2023-07-01', 'ISBN008'),
(9, 9, 'The Alchemist', '2023-07-05', 'ISBN009'),
(10, 10, 'Sapiens: A Brief History of Humankind', '2023-07-10', 'ISBN010'),
(11, 11, 'The Little Prince Adventure', '2021-07-05', 'ISBN011');


-- Insert 10 records into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'The Great Gatsby', '2023-06-15', 'ISBN001'),
(2, 2, 'To Kill a Mockingbird', '2023-06-20', 'ISBN002'),
(3, 3, '1984', '2023-06-25', 'ISBN003'),
(4, 4, 'Pride and Prejudice', '2023-06-30', 'ISBN004'),
(5, 5, 'The Catcher in the Rye', '2023-07-05', 'ISBN005'),
(6, 6, 'The Hobbit', '2023-07-10', 'ISBN006'),
(7, 7, 'Harry Potter and the Sorcerer\'s Stone', '2023-07-15', 'ISBN007'),
(8, 8, 'The Da Vinci Code', '2023-07-20', 'ISBN008'),
(9, 9, 'The Alchemist', '2023-07-25', 'ISBN009'),
(10, 10, 'Sapiens: A Brief History of Humankind', '2023-07-30', 'ISBN010');

-- Add more employees to Branch_no 1
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(111, 'John Smith', 'Clerk', 30000, 1),
(112, 'Mary Johnson', 'Clerk', 31000, 1),
(113, 'David Brown', 'Clerk', 32000, 1),
(114, 'Laura Davis', 'Clerk', 33000, 1),
(116, 'Lau David', 'Clerk', 33000, 1),
(115, 'Michael Wilson', 'Clerk', 34000, 1);


-- 3: SQL Queries
----------------------------------
-- Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Retrieve book_title from book table containing history.
SELECT Book_title
FROM Books
WHERE Category = 'History';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

-- Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE b.Rental_Price > 25;

