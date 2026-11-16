-- (a) Create a view to display the list of movie titles, movie year, director name along with the number of theaters they have been shown in

CREATE VIEW MovieTheaterCount AS
SELECT 
    m.title,
    m.year,
    m.directorName,
    COUNT(DISTINCT s.theaterName) as theaterCount
FROM Movie m
LEFT JOIN Show s ON m.title = s.movieTitle
GROUP BY m.title, m.year, m.directorName;

-- (b) Create a view that lists each theater, its city, and the total number of movies shown there

CREATE VIEW TheaterMovieCount AS
SELECT 
    t.theaterName,
    t.city,
    COUNT(DISTINCT s.movieTitle) as movieCount
FROM Theater t
LEFT JOIN Show s ON t.theaterName = s.theaterName
GROUP BY t.theaterName, t.city;

-- (c) Create a function that returns the number of movies they have acted in given a star name

CREATE FUNCTION GetStarMovieCount (@starName VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COUNT(DISTINCT movieTitle)
    FROM StarIn
    WHERE starName = @starName;
    RETURN @count;
END;

-- (d) Create a function that returns the total number of spectators given the theater name

CREATE FUNCTION GetTheaterSpectators (@theaterName VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @totalSpectators INT;
    SELECT @totalSpectators = SUM(b.numTickets)
    FROM Booking b
    JOIN Show s ON b.showId = s.showId
    WHERE s.theaterName = @theaterName;
    RETURN ISNULL(@totalSpectators, 0);
END;