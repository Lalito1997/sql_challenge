-- (1) I used e as an alias in order to retrun the emp no., last/first_name, sex and salary not to mention that the empolyees table has all 
-- of the data and both tables share the column emp_no
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- (2) I created a time frame at the bottom ranging from the beginning of the year to the last so I dont get dates ranging between the two
-- I tried filtering it by the year being equal to 1986 but it wouldnt work
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- (3) since I am gathering data from multiple tables i ahd to make multiple alias's in order for the code ot understand where
-- the data was coming from. by doing so i am able to query from department and dept_manager on dept_no and emp_no for the last line
SELECT d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- (4) the same as the previous example in logic as we are joining on common columns on emp_no and emp_no
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- (5) since we are only focusing on one table we only need to use the employees table and set the first name to hercules and 
-- and any nal,e that starts with B. the % dictates if it starts with.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- (6) this one is similar to the previous questions as we want to return a specific department number wiht the WHERE function is equal to
-- the department name which is sales
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- (7) same as the previous example we want those in departments sales and development but since first and last name 
-- as in a differnet data ser we need emp_no to query for that data
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- (8) we are only using the employees table and ordering them by descending order by last name and using count to obviously count 
-- the number of last names and storing it in freq to make a columnof the repeating last names 
SELECT last_name, COUNT(*) AS freq
FROM employees
GROUP BY last_name
ORDER BY freq DESC;


