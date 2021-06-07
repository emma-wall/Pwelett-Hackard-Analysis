# Pwelett-Hackard-Analysis

## Overview
This analysis uses SQL via PGAdmin to analyze retirement data from Pewlett Hackard. Specifically, I was curious about the number of positions the company is going to have to replace due to employees getting ready retire in the next couple of years based on their age. Anyone employee born between 1962 and 1965 is considered eligible for retirement. 

## Results
-	
-	The unique titles table shows us that over 90,000 employees meet the retirement eligibility requirement. 
Retiring titles
-	From the retirement_titles table it is apparent that they are going to have to replace almost 30,000 Senior Engineers and 30,000 Senior Staff 
-	Over 1,500 employees that are eligible for retirement were born in 1965, which means that they are eligible for the mentorship program. 

## Summary
Over 90,000 rolls will need to be filled in the next couple of years if Pewlett Hackard wants to remain it’s head count. However, there are not enough employees that are eligible for the mentorship program. Pewlett Hackard should look at expanding eligibility for the mentorship program to employees born from 1966 to 1970. We can expand the eligibility with the below code 
```
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
	LEFT JOIN dept_emp AS de
		ON (e.emp_no=de.emp_no)
	LEFT JOIN titles AS t
		ON (e.emp_no=t.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1970-12-31')
ORDER BY e.emp_no;
```

Pewlett Hackard should also look at the number of eligible retirees based on department, to see what departments are going to need to hire the most people. From the table below, we can see that the Production and Developement departments will need to fill the most spots
![Screen Shot 2021-06-07 at 12 22 56 AM](https://user-images.githubusercontent.com/80648379/120958948-bc7e2380-c726-11eb-9c64-a9e8ac173c84.png)


