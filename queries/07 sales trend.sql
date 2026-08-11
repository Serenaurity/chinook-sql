USE chinook;

select
	date_format(invoicedate, '%Y-%m') as sales_month,
    count(*) as invoice_count,
    round(sum(total), 2) as revenue
    
From invoice
group by date_format(invoicedate, '%Y-%m')
order by sales_month;
