USE chinook;

with customer_spend as (
	select
		c.customerid,
        concat(c.firstname, ' ', c.lastname) as customer_name,
        round(sum(i.total), 2) as total_spent
        
	from customer as c
    join invoice as i on c.customerid = i.customerid
    group by c.customerid, c.firstname, c.lastname
)

select 
	customer_name,
    total_spent,
    dense_rank() over (order by total_spent desc) as spend_rank

from customer_spend
order by spend_rank