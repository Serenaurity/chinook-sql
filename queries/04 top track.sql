USE chinook;

select
	t.TrackId,
    t.Name as track_name,
    ar.Name as artist_name,
    sum(il.Quantity) as units_sold,
    round(sum(il.UnitPrice * il.Quantity), 2) as revenue

from InvoiceLine as il
join Track as t on il.TrackId = t.TrackId
join Album as al on t.AlbumId = al.AlbumId
join Artist as ar on al.ArtistId = ar.ArtistId

group by t.TrackId, t.Name, ar.Name
order by units_sold desc, revenue desc

limit 10;