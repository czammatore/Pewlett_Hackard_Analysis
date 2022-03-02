SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM titles as t
INNER JOIN employees as e
	ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

--Distinct On for Unique Titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--Count of Employee Titles
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

--Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no)e.emp_no,
		e.first_name,
		e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        t.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles as t
				ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;
