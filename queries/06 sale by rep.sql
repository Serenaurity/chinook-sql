USE chinook;

select
	e.employeeid,
    concat(e.firstname, ' ', e.lastname) as sales_rep,
    count(distinct c.customerid) as customers,
    count(distinct i.invoiceid) as invoices,
    round(sum(i.total), 2) as revenue
    
from employee as e
join customer as c on e.employeeid = c.supportrepid
join invoice as i on c.customerid = i.customerid

group by e.employeeid , e.firstname , e.lastname
order by revenue desc;
