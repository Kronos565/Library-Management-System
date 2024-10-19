CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),  
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);


CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;


INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(101, 101, 'MG Road, Kochi', '9876543210'),
(102, 102, 'Palayam, Kozhikode', '9845123456'),
(103, 103, 'Vazhuthacaud, Thiruvananthapuram', '9800012345');


INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'Rajesh Kumar', 'Manager', 75000, 101),
(102, 'Anil Kumar', 'Manager', 72000, 102),
(103, 'Suresh Nair', 'Manager', 68000, 103),
(104, 'Meera S', 'Assistant', 45000, 101),
(105, 'Ramesh R', 'Assistant', 48000, 102),
(106, 'Nisha P', 'Clerk', 35000, 103),
(107, 'Ajay M', 'Assistant', 50000, 101),
(110, 'Vishnu S', 'Developer', 40000, 101),
(111, 'Anitha M', 'Librarian', 32000, 101),
(112, 'Rajesh K', 'Assistant', 28000, 101),
(113, 'Meera T', 'Manager', 60000, 101),
(114, 'Sneha P', 'Support Staff', 25000, 101),
(115, 'Sandeep N', 'Support Staff', 23000, 101),
(116, 'Gokul R', 'Assistant', 28000, 102),
(117, 'Kiran J', 'Support Staff', 24000, 102),
(118, 'Ramya V', 'Support Staff', 25000, 102),
(119, 'Arya M', 'Developer', 48000, 102),
(120, 'Akhil L', 'Librarian', 35000, 102),
(121, 'Suresh B', 'Manager', 65000, 103),
(122, 'Divya K', 'Assistant', 28000, 103);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(101, 'Introduction to Algorithms', 'Technology', 30.00, 'yes', 'Cormen', 'MIT Press'),
(102, 'Database Systems', 'Technology', 25.00, 'no', 'Navathe', 'Pearson'),
(103, 'History of the World', 'History', 20.00, 'yes', 'John Smith', 'OUP'),
(104, 'Python Programming', 'Technology', 28.00, 'yes', 'Guido van Rossum', 'Reilly'),
(105, 'World War II', 'History', 35.00, 'no', 'Max Hastings', 'HarperCollins'),
(106, 'The Rise of Empires', 'History', 40.00, 'yes', 'William H', 'Penguin');


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(201, 'Akhil P', 'Kochi', '2021-11-15'),
(202, 'Neha R', 'Kozhikode', '2022-02-10'),
(203, 'Divya S', 'Thiruvananthapuram', '2021-12-20'),
(204, 'Rahul M', 'Kannur', '2023-01-05'),
(205, 'Sneha V', 'Thrissur', '2021-05-20');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(301, 201, 'Introduction to Algorithms', '2023-06-05', 101),
(302, 203, 'History of the World', '2023-06-12', 103),
(303, 204, 'Python Programming', '2023-07-01', 104);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(401, 201, 'Introduction to Algorithms', '2023-06-20', 101),
(402, 203, 'History of the World', '2023-06-25', 103);


-- 1.Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name 
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs. 50,000.
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT C.Customer_name 
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT C.Customer_name 
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

-- 9. Retrieve book_title from the books table containing 'history'.
SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%History%';


-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address 
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT C.Customer_name 
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE B.Rental_Price > 25;









