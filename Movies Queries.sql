use Movies;

-- Retrieve Data
select * from Movies;

-- Total Gross and Budget from all movies
SELECT 
	name, SUM(gross) AS Total_Gross, SUM(budget) AS Total_Budget
FROM 
	Movies
WHERE gross <> 0 AND budget <> 0
GROUP BY name;

-- Total Revenue that is generated from all movies where "budget" and "gross" is not equal 0
SELECT 
	(SUM(gross) - SUM(budget)) AS Total_Revenue 
FROM
	Movies
WHERE gross <> 0  AND budget <> 0;

-- Total Revenue for each decade "1980-1989" and "1990-1999"etc... 
WITH CTE AS
(
	SELECT 
		year, (SUM(gross)-SUM(budget)) Revenue
	FROM
		Movies
	WHERE gross <> 0 AND BUDGET <> 0
	GROUP BY year
)
SELECT
	SUM(CASE WHEN year BETWEEN 1980 AND 1989 THEN Revenue ELSE 0 END) AS '1980_1989Revenue',
	SUM(CASE WHEN year BETWEEN 1990 AND 1999 THEN Revenue ELSE 0 END) AS '1990_1999Revenue',
	SUM(CASE WHEN year BETWEEN 2000 AND 2009 THEN Revenue ELSE 0 END) AS '2000_2009Revenue',
	SUM(CASE WHEN year BETWEEN 2010 AND 2020 THEN Revenue ELSE 0 END) AS '2010_2020Revenue'
FROM
	CTE;

-- Top 10 Movies by Revenue
SELECT
	TOP 10.name, (gross - budget) AS Revenue
FROM 
	Movies
WHERE gross <> 0  AND budget <> 0
ORDER BY Revenue DESC;

-- Filter Genres by Total Revenue
SELECT 
	genre, (SUM(gross)-SUM(budget)) Total_Revenue
FROM
	Movies
WHERE gross <> 0  AND budget <> 0
GROUP BY genre
ORDER BY 2 DESC;

-- Top 10 Movies by Score
SELECT 
	TOP 10.name, score
FROM
	Movies
ORDER BY score DESC;

-- Filter Score by Revenue to show who's the highest Revenue
SELECT 
	score, (SUM(gross) - SUM(budget)) Total_Revenue 
FROM 
	Movies
WHERE gross <> 0 AND budget <> 0
GROUP BY score
Order by 2 DESC;

-- Top 10 Countries whose highest gross
SELECT 
	TOP 10.country, SUM(gross) Total_Gross
FROM 
	Movies
GROUP BY country
ORDER BY 2 DESC;

-- Top 10 Gross Movies and their respective Countries
SELECT 
	TOP 10.name, country, SUM(gross) Total_Gross
FROM 
	Movies
GROUP BY name,country
ORDER BY 3 DESC;

-- TOP 5 Movie directors, and movie stars for the highest score
SELECT
	TOP 5.name, director, star, score
FROM 
	Movies
ORDER BY score DESC;

-- Numbers of movies and Average of movies per Director
SELECT
	director, COUNT(*) AS CountOfMovies, ROUND(AVG(score),2) AS Avg_Score
FROM 
	Movies
GROUP BY director
-- Whose get Avg_Score more than 7.5:
-- HAVING AVG(score) > 7.5
ORDER BY 2 DESC,3 DESC;

-- Top 10 Companies who produced the most movies
SELECT
	TOP 10.company, COUNT(*) Num_Of_Productions, (SUM(gross)-SUM(budget)) Total_Revenue
FROM 
	Movies
WHERE gross <> 0 AND budget <> 0
GROUP BY company
ORDER BY 2 DESC;

-- Show the difference between top 5 movies with the most votes and most gross 
SELECT 
	G.*
FROM(
	SELECT
		TOP 5.name, votes, year, gross
	FROM 
		Movies
	ORDER BY 2 DESC ) G
UNION ALL
SELECT 
	V.* 
FROM (
	SELECT
		TOP 5.name, votes, year, gross
	FROM 
		Movies
	ORDER BY 4 DESC) V
--ORDER BY name