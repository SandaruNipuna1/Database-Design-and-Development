---Excercise-2
---a)

ALTER TABLE MovieStar
ADD rank INT DEFAULT 0;

CREATE OR ALTER PROCEDURE UpdateMovieStarRank
AS
BEGIN
    -- Reset all ranks
    UPDATE MovieStar
    SET rank = 0;

    -- Update rank based on count of 'lead' roles in StarsIn
    UPDATE MovieStar
    SET rank = (
        SELECT COUNT(*)
        FROM StarsIn
        WHERE StarsIn.starname = MovieStar.name
          AND LOWER(LTRIM(RTRIM(role))) = 'lead'
    );
END;
GO

EXEC UpdateMovieStarRank;
SELECT name, rank FROM MovieStar;

---b)
CREATE OR ALTER TRIGGER trg_UpdateRankOnStarsInInsert
ON StarsIn
AFTER INSERT
AS
BEGIN
    UPDATE MovieStar
    SET rank = rank + 1
    WHERE name IN (
        SELECT starname
        FROM inserted
        WHERE LOWER(LTRIM(RTRIM(role))) = 'lead'
    );
END;
GO

-- Insert a new lead role
INSERT INTO StarsIn VALUES ('Avengers', 2018, 'Tom Holland', 'lead');

-- Check updated rank
SELECT name, rank FROM MovieStar WHERE name = 'Tom Holland';
