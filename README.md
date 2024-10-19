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

1. Retrieve book title, category, and rental price of all available books.
2. List employee names and salaries in descending order of salary.
3. Retrieve book titles and corresponding customers who have issued those books.
4. Display the total count of books in each category.
5. Retrieve employee names and positions for employees with salaries above Rs. 50,000.
6. List customer names who registered before 2022-01-01 and have not issued any books.
7. Display branch numbers and the total count of employees in each branch.
8. Display customer names who have issued books in June 2023.
9. Retrieve book titles that contain 'history'.
10. Retrieve branch numbers with a count of employees for branches having more than 5 employees.
11. Retrieve names of employees who manage branches and their branch addresses.
12. Display names of customers who have issued books with a rental price higher than Rs. 25.

### [Link to Screenshots](#) (replace with your actual link)

## How to Run the Project

1. Clone the repository.
    ```bash
    git clone https://github.com/yourusername/library-management-system.git
    ```
2. Import the SQL schema and data into your MySQL database.

3. Execute the queries in any MySQL environment (e.g., MySQL Workbench, phpMyAdmin).

4. Verify the outputs by checking the provided screenshots.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
