drop table membership_eligibilityjoins;

SELECT e.emp_no,
     e.first_name,
     e.last_name,
	 e.birth_date,
	 ti.title,
	 ti.from_date,
	 ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no;
---
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC limit 10;
---
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM mentorship_eligibility
---
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles 

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY
    title
ORDER BY (count) DESC; 

SELECT * FROM retiring_titles
---Mentorship Eligibility table
SELECT emp_no, first_name, last_name, birth_date
FROM employees

SELECT from_date, to_date
FROM Dept_Emp

SELECT title
FROM titles


SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
birth_date
INTO mentorship_eligibility
FROM employees;
SELECT * FROM mentorship_eligibility
---JOINS Mentorship_eligibility and titles
SELECT mentorship_eligibility.emp_no,
	titles.title,
	titles.from_date,
	titles.to_date
FROM mentorship_eligibility
INNER JOIN titles
ON mentorship_eligibility.emp_no = titles.emp_no;
---JOINS Mentorship_eligibility and Dept_Emp tables(note, modified the steps from the module assignment)
SELECT DISTINCT mentorship_eligibility.emp_no,
	t.title,
	mentorship_eligibility.first_name,
	mentorship_eligibility.last_name,
	mentorship_eligibility.birth_date,
	Dept_Emp.from_date,
	Dept_Emp.to_date
INTO membership_eligibilityjoins
FROM mentorship_eligibility
INNER JOIN Dept_Emp
ON mentorship_eligibility.emp_no = Dept_Emp.emp_no
INNER JOIN titles as t 
ON t.emp_no = Dept_Emp.emp_no
WHERE t.to_date = '9999-01-01'
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY mentorship_eligibility.emp_no limit 10;

SELECT * FROM membership_eligibilityjoins

