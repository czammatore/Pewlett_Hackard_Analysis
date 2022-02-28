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

--Mentorship Eligibility Table
SELECT e.emp_no,
		e.first_name,
		e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        t.title
INTO mentorship_eligibility
