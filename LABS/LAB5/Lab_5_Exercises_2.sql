--Exercise 2
--a
select distinct s.starname
from StarsIn s
join Movie m on s.movieTitle = m.title and s.movieYear = m.year
where m.directorName = 'Jon Watts'

--b
select sh.movieTitle, sum(sh.spectators) as total_spectators
from Show sh
join Theater t on sh.theaterName = t.theaterName
where t.city = 'LA'
group by sh.movieTitle

--c
select b.custName 
from Booking b
join show sh on b.showId = sh.showId
group by b.custName
having count(distinct sh.movieTitle) > 1

--d
select t.theaterName, sum(sh.ticketPrice*sh.spectators) as total_income
from Theater t
join Show sh on t.theaterName = sh.theaterName
group by t.theaterName
having sum(sh.ticketPrice*sh.spectators) > 50000

--e
select b.custName
from booking b
join Show sh on b.showId = sh.showId
group by b.custName
having count(distinct sh.theaterName) > 1