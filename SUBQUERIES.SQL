-- ✅ Displays each employee's details along with the average salary.
SELECT EmployeeID, Name, 
       (SELECT AVG(Salary) FROM Employees) AS AvgSalary
FROM Employees;


-- ✅ Groups salary by department using a subquery.
SELECT Department, AvgSalary
FROM (SELECT Department, AVG(Salary) AS AvgSalary FROM Employees GROUP BY Department) AS SalaryStats;


-- ✅ Finds employees earning above the average salary.
SELECT * FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


-- ✅ Departments with an above-average salary.
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > (SELECT AVG(Salary) FROM Employees);


-- ✅ Finds employees working in New York-based departments.
SELECT * FROM Employees 
WHERE Department IN (SELECT DeptName FROM Departments WHERE Location = 'New York');


-- ✅ Excludes employees from New York-based departments.
SELECT * FROM Employees 
WHERE Department NOT IN (SELECT DeptName FROM Departments WHERE Location = 'New York');


-- ✅ Returns employees only if IT exists in the Departments table.
SELECT * FROM Employees e
WHERE EXISTS (SELECT 1 FROM Departments d WHERE d.DeptID = e.DeptID AND d.DeptName = 'IT');


-- ✅ Finds employees who are not managing any projects.
SELECT * FROM Employees e
WHERE NOT EXISTS (SELECT 1 FROM Projects p WHERE p.ManagerID = e.EmployeeID);


-- ✅ Finds employees earning above the average salary of their department.
SELECT e1.EmployeeID, e1.Name, e1.Salary
FROM Employees e1
WHERE Salary > (SELECT AVG(e2.Salary) FROM Employees e2 WHERE e2.Department = e1.Department);


-- ✅ Finds employees who were absent for more than 5 days.
SELECT * FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID FROM Attendance WHERE DaysAbsent > 5);