-- Create Retirement Table
SELECT 
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees AS e
	LEFT JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.to_date DESC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Retiring titles 
SELECT COUNT(unique_titles) AS count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
SELECT * FROM retiring_titles


--Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
	LEFT JOIN dept_emp AS de
		ON (e.emp_no=de.emp_no)
	LEFT JOIN titles AS t
		ON (e.emp_no=t.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

--Mentorship Eligibility table- expanded 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility_expanded
FROM employees AS e
	LEFT JOIN dept_emp AS de
		ON (e.emp_no=de.emp_no)
	LEFT JOIN titles AS t
		ON (e.emp_no=t.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1970-12-31')
ORDER BY e.emp_no;

--retirement by dept
SELECT 
d.dept_no,
d.dept_name,
COUNT(ut.emp_no)
FROM unique_titles AS ut
	LEFT JOIN dept_emp AS de
		ON (ut.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no=d.dept_no)
GROUP BY d.dept_no

