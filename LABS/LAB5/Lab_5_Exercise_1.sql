--Exercise 1
--a
select distinct m.directorName
from Movie m
join StarsIn s on m.title = s.movieTitle and m.year = s.movieYear
join MovieStar ms on s.starname = ms.name
where ms.country = 'America'

--b
select sh.movieTitle
from Show sh
join Movie m on sh.movieTitle = m.title
join Theater t on sh.theaterName = t.theaterName
where m.language = 'English' and sh.spectators = t.capacity

--c
select s.starname, count(distinct s.movieTitle) as num_movies
from StarsIn s
join MovieStar ms on s.starname = ms.name
where s.movieYear between 2017 and 2018
group by s.starname, s.movieyear
having count(distinct s.movieTitle) >= 3

--d
select m.title, sum(sh.spectators) as total_spectators
from Movie m
join Show sh on sh.MovieTitle = m.title
where m.filmtype = 'F'
group by m.title
having sum(sh.spectators) >= 1000000

--e
select sh.movieTitle, sum(sh.ticketPrice*sh.spectators) as total_income
from Show sh
join Theater t on t.theaterName = sh.theaterName
where t.country = 'America'
group by sh.movieTitle