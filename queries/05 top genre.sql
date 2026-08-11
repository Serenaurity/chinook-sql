USE chinook;

select
	g.name as genre_name,
    sum(il.Quantity) as units_sold,
    round(sum(il.UnitPrice * il.Quantity), 2) as revenue
    
from invoiceline il
join track as t on il.trackid = t.trackid
join genre as g on t.genreid = g.genreid

group by g.genreid, g.name
order by revenue desc;