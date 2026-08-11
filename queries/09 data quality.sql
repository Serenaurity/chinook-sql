USE chinook;

select count(*) as orphan_invoice_lines
from invoiceline as il
left join invoice as i on il.invoiceid = i.invoiceid
where i.invoiceid is null;

select count(*) as orphan_tracks
from invoiceline as il
left join track as t on il.trackid = t.trackid
where t.trackid is null;

select
	sum(customerid is null) as null_customer_ids,
    sum(invoicedate is null) as null_invoice_dates,
    sum(total is null) as null_totals
from invoice;