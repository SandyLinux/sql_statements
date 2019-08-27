select count(emp_no), dept_no
from dept_emp
where (dept_no = 'd007') 
and (
exists 
(select emp_no from salaries where emp_no = dept_emp.emp_no and 
salary > 50000

)
)
group by dept_no
having count(emp_no) > 20000
order by dept_no
;

-- massive data 1

--- massive data

SELECT film.film_id,film.description

FROM film INNER JOIN (

    SELECT film_id FROM film ORDER BY title LIMIT 50,5

) AS tmp USING(film_id);


select * from employees
inner join (select emp_no
from employees
order by emp_no
limit 300000,10) as tmp
using (emp_no);

---------- add a sequence number in the result

SELECT (@rowNum:=0) AS rowNo,
concat('this is a list:', GROUP_CONCAT((@rowNum:=@rowNum+1),dept_no separator '.'))

from smalldept_emp
group by dept_no;
