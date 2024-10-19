# Library Management System

## Project Overview

This Library Management System is a database management project built using MySQL. It tracks the essential details of a library, including the books available, employees, customers, and the status of book issues and returns. The project demonstrates relational database principles with foreign key constraints, simplifying library operations such as book rentals, employee management, and branch tracking.

## Features

- Track the availability, category, and rental price of books.
- Manage branch information, employee details, and their salaries.
- Track customer registration and book-issue information.
- Record issue and return statuses of books.
- Queries that demonstrate typical operations, such as retrieving available books, displaying employee details, counting books by category, etc.

## Database Structure

The system consists of six tables:

1. **Branch**
    - `Branch_no` (Primary Key)
    - `Manager_Id`
    - `Branch_address`
    - `Contact_no`

2. **Employee**
    - `Emp_Id` (Primary Key)
    - `Emp_name`
    - `Position`
    - `Salary`
    - `Branch_no` (Foreign Key)

3. **Books**
    - `ISBN` (Primary Key)
    - `Book_title`
    - `Category`
    - `Rental_Price`
    - `Status`
    - `Author`
    - `Publisher`

4. **Customer**
    - `Customer_Id` (Primary Key)
    - `Customer_name`
    - `Customer_address`
    - `Reg_date`

5. **IssueStatus**
    - `Issue_Id` (Primary Key)
    - `Issued_cust` (Foreign Key)
    - `Issued_book_name`
    - `Issue_date`
    - `Isbn_book` (Foreign Key)

6. **ReturnStatus**
    - `Return_Id` (Primary Key)
    - `Return_cust`
    - `Return_book_name`
    - `Return_date`
    - `Isbn_book2` (Foreign Key)

## Queries and Screenshots

This project includes a series of SQL queries that perform different operations on the database. Below is a list of 12 queries, with screenshots provided for their outputs:

1. Retrieve book title, category, and rental price of all available books.![Screenshot (16)](https://github.com/user-attachments/assets/1a92f697-7f42-47bf-8c5f-19734adcf1c5)

2. List employee names and salaries in descending order of salary.![Screenshot (17)](https://github.com/user-attachments/assets/df2dd008-0bce-458d-9493-02a418c35b51)

3. Retrieve book titles and corresponding customers who have issued those books.![Screenshot (18)](https://github.com/user-attachments/assets/2f0a68d2-b4ca-44bc-a947-319d7258b564)

4. Display the total count of books in each category.![Screenshot (19)](https://github.com/user-attachments/assets/a847eddd-99e5-4df5-aa90-4a57263eca2c)

5. Retrieve employee names and positions for employees with salaries above Rs. 50,000.![Screenshot (20)](https://github.com/user-attachments/assets/e0917498-5c69-433a-9d8c-d0f3a56746d3)

6. List customer names who registered before 2022-01-01 and have not issued any books.![Screenshot (21)](https://github.com/user-attachments/assets/70326c52-5004-4c24-98e1-e483f94594d8)

7. Display branch numbers and the total count of employees in each branch.![Screenshot (22)](https://github.com/user-attachments/assets/e5610c4f-3ae5-43ad-8d9a-9e033ff7ed21)

8. Display customer names who have issued books in June 2023.![Screenshot (23)](https://github.com/user-attachments/assets/b6f38375-7cf4-4539-970a-1ce45abb01ce)

9. Retrieve book titles that contain 'history'.![Screenshot (24)](https://github.com/user-attachments/assets/43d9f609-72f9-4f14-a4a1-e710bd6918e9)

10. Retrieve branch numbers with a count of employees for branches having more than 5 employees.![Screenshot (25)](https://github.com/user-attachments/assets/3552fd25-7fbf-4138-a264-617f20f16463)

11. Retrieve names of employees who manage branches and their branch addresses.![Screenshot (26)](https://github.com/user-attachments/assets/78ed2b58-03ec-4dee-a1ca-75d5db4cf0c5)

12. Display names of customers who have issued books with a rental price higher than Rs. 25.![Screenshot (27)](https://github.com/user-attachments/assets/a8cf3c4b-d570-47ed-a777-c50109aa5d67)



## How to Run the Project

1. Clone the repository.
    ```bash
    git clone https://github.com/Kronos565/library-management-system.git
    ```
2. Import the SQL schema and data into your MySQL database.

3. Execute the queries in any MySQL environment (e.g., MySQL Workbench, phpMyAdmin).

4. Verify the outputs by checking the provided screenshots.


