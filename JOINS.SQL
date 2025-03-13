-- List all projects and their respective departments.
select p.name, d.name as department  from projects p 
INNER join departments d
on p.department_id = d.id 

-- Get a list of all projects along with their clients' names.
select p.name, c.name as client from projects p 
INNER join clients c 
on p.client_id = c.id 

-- Find all employees and their managers (self-join).
select e.name, em.name as manager from employees e 
INNER join employees em 
on e.manager_id = em.id 
where e.manager_id is not null

-- List all sales, including the product name and employee name who made the sale.
select s.id, p.name as product, e.name as employee from sales s 
INNER join employees e on s.employee_id = e.id 
INNER join products p on s.product_id = p.id


-- List all employees and their respective departments, including employees without a department.
select e.name, d.name as department from employees e  
left join departments d 
on e.department_id = d.id

-- Get a list of all products along with the sales data, including products that have never been sold.
select p.name, s.sale_date, s.total from products p 
left join sales s 
on p.id = s.product_id 

-- List all projects and their associated clients, including projects without a client.
select p.name, c.name as client from projects p 
left join clients c 
on p.client_id = c.id 

-- Find all employees, including those without a manager.
select e.name, em.name as manager  from employees e 
left join employees em 
on e.manager_id = em.id 

-- List all clients and the projects they are associated with, including clients with no projects.
select c.name, p.name as project from clients c 
left join projects p 
on c.id = p.client_id 

-- List all departments and employees working in each department, including departments with no employees.
select d.name, e.name as employees from departments d 
right join employees e 
on d.id = e.department_id 

-- Show all projects and their clients, including clients with no projects.
select p.name, c.name as clients from projects p 
right join clients c 
on p.client_id = c.id

-- List all sales along with product name, employee name, and department.
select s.id, p.name as product, e.name as employee, d.name as department from sales s 
INNER join products p on p.id = s.product_id
INNER join employees e on e.id = s.employee_id
INNER join departments d on e.department_id = d.id 


-- Show all employees with their departments, managers, and projects they are working on.
select e.name, em.name as manager, d.name as department, p.name as project from employees e 
INNER join departments d on d.id = e.department_id  
INNER join employees em on e.manager_id = em.id 
INNER join projects p on p.department_id = d.id

-- List all projects with their department, client, and manager's name.
select p.name as projects, d.name as department, c.name as client, em.name as manager from projects p 
INNER join departments d on p.department_id = d.id 
INNER join clients c on c.id = d.client_id 
INNER join employees e on p.employee_id = e.id
INNER join employees em on e.manager_id = em.id 

-- Find all sales with details about the product sold, the employee who made the sale, 
-- and the client associated with the project (if any) that funded the sale.
select s.id, p.name as projects, e.name as employees, c.name as client from sales s 
INNER join projects p on s.product_id = p.id 
INNER join employees e on s.employee_id = e.id 
INNER join clients c on p.client_id = c.id
