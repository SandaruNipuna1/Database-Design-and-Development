SELECT t.name AS TableName,
       STRING_AGG(c.name, ', ') AS Columns
FROM sys.tables t
JOIN sys.columns c ON t.object_id = c.object_id
GROUP BY t.name
ORDER BY t.name;

--Exercise1
--a
create view showDetails_1122
as
select s.movieTitle,s.theaterName,t.city,t.country
from show s,theater t
where s.theaterName = t.theaterName and s.spectators = t.capacity

select * from showDetails_1122

--b
create view showDetails(Name,Country,NoOfMovies)
as
select ms.name, ms.country, count(s.movieTitle)
from MovieStar ms, StarsIn s
where ms.name = s.starname
group by ms.name, ms.country

select * from showDetails

--c
create function DisplaytotalEarnings(@mtitle char(25)) returns int
as
begin
    declare @totalEarnings int
    select @totalEarnings = sum(s.ticketPrice*s.spectators)
    from Show s
    where s.movieTitle = @mtitle
    return @totalEarnings
end;

declare @result int
exec @result = DisplaytotalEarnings 'Spider-man'
print @result

--d
create function DisplayRemainingSeats(@show int) returns int
as
begin
    declare @remainingSeats int
    select @remainingSeats = t.capacity-s.spectators
    from Show s, Theater t
    where s.theaterName = t.theaterName and s.showId = @show
    return @remainingSeats
end;

declare @result int
exec @result = DisplayRemainingSeats 3
print @result





