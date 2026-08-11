USE chinook;

select
	c.CustomerId,
    concat(c.FirstName, ' ', c.LastName) As Customer_name,
    c.Country,
    count(i.InvoiceId) as invoice_count,
    round(sum(i.Total), 2) as total_spent
    
from Customer as c
join Invoice as i
	on c.CustomerId = i.CustomerId
group by
	c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Country
order by total_spent desc
limit 10;