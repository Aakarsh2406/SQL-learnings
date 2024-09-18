'''
EMP_ID	NAME	MANGERID
1	Aditya	    null
2	Aakarsh	    1
3	Abhishek	2
4	Jatin	    null
5	Prakhar	    4
6	Ayushi	    5
'''

with cte1 as
(select emp_id from employees where mangerid is null)
,cte2 as (select e.emp_id from employees e
inner join cte1 c
on e.mangerid = c.emp_id)

select e.* from employees e
inner join cte2 c
on e.mangerid = c.emp_id

