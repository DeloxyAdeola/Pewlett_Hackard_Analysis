
SELECT e.emp_no,
    e.first_name,
e.last_name,
    ti.title,
    ti.from_date,
	ti.to_date
INTO retirements_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     ORDER BY e.emp_no DESC;
	 
SELECT * FROM retirements_titles
	 
-- -- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (emp_no) emp_no,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- WHERE _______
-- ORDER BY _____, _____ DESC;

-- SELECT DISTINCT ON (emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	to_date
INTO unique_titles 
FROM retirements_titles as rt 
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

--number of employees by their most recent titles who are about to retire.
--Use unique_titles to create summary pivot table of # of positions per 
-- retiring titles.

SELECT count(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

--******************************************
--DELIVERABLE 2
--The employees eligible for mentorship program to train

SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND ( de.to_date = '9999-01-01')
ORDER BY e.emp_no, to_date DESC;


SELECT * FROM mentorship_eligibility;

	 






