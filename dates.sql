-- get the first day of certain month

set @intervalss = dayofmonth(current_date()) - 1;
-- select @intervalss;

select date_sub(current_date(), interval @intervalss day );

--- get a day after x year x month x day later or ago
select date_add(
    date_add(
        date_add(current_date(), interval 1 year), interval 2 month),
        interval 3 day
    ) 
as newdate;


-- calculate average and store into variable 

select @ams := avg(order_amount) from orders;

SELECT (order_amount) FROM mydb1.orders
where order_amount > @ams;

-- generate a list of datatype
select if ( 12 in 
                (select 12 as vl union all select 14 as vl),
			'yes',
            'no');


select if
 ( 
	112 = any(select 12 as vl union all select 14 as vl),
    'yes',
    'no'
    );


-- update multiple records in a single query
update customer 

set address = case cust_id
             when 5 then '123 street' 
			 when 6 then '666'
             else 'defautl'
             end
             
where address is null and cust_id in (5,6,7);



set @prefix := 'membership';

update customer
set cust_name = 
case
when cust_id = 4 then 'customer4'
when cust_id = 5 then concat(@prefix , 5)
else @prefix
end
where cust_id > 0;



/*
Escape keyword.
The ESCAPE keyword is used to escape pattern matching characters such as the (%) percentage and underscore (_) if they form part of the data.
 Let's suppose that we want to check for the string "67%" we can use;
LIKE '67#%%' ESCAPE '#';
If we want to search for the movie "67% Guilty", we can use the script shown below to do that.
SELECT * FROM movies WHERE title LIKE '67#%%' ESCAPE '#';
*/


SELECT * FROM mydb1.customers
where address like '%=%%' escape '=';

SELECT *
FROM customers
left  join orders
on customers.CustomerID = orders.customerid

union

SELECT *
FROM customers
right  join orders
on customers.CustomerID = orders.customerid;

