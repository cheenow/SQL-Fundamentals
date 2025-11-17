-- Create tables --

-- Departments table
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL
);

-- Employees table
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- Projects table
CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(50) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- Prepared dataset inserts --

-- Insert Departments
INSERT INTO Departments (Department_ID, Department_Name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'IT'),
(7, 'Customer Support'),
(8, 'Operations'),
(9, 'Legal'),
(10, 'Research and Development'),
(20, 'Generator');   -- Your additional department

-- Insert Employees
INSERT INTO Employees (Employee_ID, Employee_Name, Department_ID) VALUES
(101, 'Alice Johnson', 1),
(102, 'Bob Smith', 2),
(103, 'Carol White', 3),
(104, 'David Brown', 4),
(105, 'Eve Davis', 5),
(106, 'Frank Wilson', 6),
(107, 'Grace Lee', 7),
(108, 'Henry Clark', 8),
(109, 'Ivy Scott', 9),
(110, 'Jack Miller', 10);

-- Insert Projects
INSERT INTO Projects (Project_ID, Project_Name, Department_ID) VALUES
(201, 'Employee Onboarding', 1),
(202, 'Quarterly Budget', 2),
(203, 'System Upgrade', 3),
(204, 'Social Media Campaign', 4),
(205, 'Customer Outreach', 5),
(206, 'Network Security', 6),
(207, '24/7 Support', 7),
(208, 'Warehouse Optimization', 8),
(209, 'Contract Review', 9),
(210, 'New Product Research', 10);

-- Validate data content --

-- View all departments
SELECT * 
FROM Departments;

-- View employees with their department names
SELECT 
    d.Department_Name,
    e.Employee_Name
FROM Departments d
LEFT JOIN Employees e 
    ON d.Department_ID = e.Department_ID;

-- View projects with their department names
SELECT
    p.Project_Name,
    d.Department_Name
FROM Projects p
JOIN Departments d
    ON p.Department_ID = d.Department_ID;
