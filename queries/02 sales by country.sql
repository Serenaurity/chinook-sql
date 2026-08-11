USE chinook;

select
	BillingCountry,
    count(*) as invoice_count,
    round(sum(Total), 2) as total_sales

from Invoice
group by BillingCountry
order by total_sales desc;