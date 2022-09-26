# SQL-Analysis-of-Movies
Aim of this repo  is use SQL to analyze the movies dataset and creating insights from findings.

## Introduction

	I've decided to analyze movies produced between 1980 and 2020. I've gathered data from Kaggle, cleaned
	the data using excel, and imported it into SQL Server.
	
	
![proxy](https://user-images.githubusercontent.com/67477345/192287302-492ebab9-0522-47f7-99e8-295faf3f602e.jpg)

## Dataset
Click <a href='https://www.kaggle.com/datasets/danielgrijalva /movies?resource=download'> here </a> to download the dataset. 

## Content

	There are 6820 movies in the dataset. Each movie has the following attributes:
	budget: the budget of a movie. Some movies don't have this, so it appears as 0
	company: the production company
	country: country of origin
	director: the director
	genre: main genre of the movie.
	gross: revenue of the movie
	name: name of the movie
	rating: rating of the movie (R, PG, etc.)
	released: release date (YYYY-MM-DD)
	runtime: duration of the movie
	score: IMDb user rating
	votes: number of user votes
	star: main actor/actress
	writer: writer of the movie
	year: year of release

## Investigate the dataset
	Ask question to get insights from data using SQL. Note: All querying was done using SQL Server
	
Questions like:

	Total Gross and Budget from all movies
	Total Revenue that is generated from all movies
	Total Revenue for each decade "1980-1989" and "1990-1999"etc
	Top 10 Movies by Revenue
	Filter Genres by Total Revenue
	Top 10 Movies by Score
	Filter Score by Revenue to show who's the highest Revenue
	Top 10 Countries whose highest gross
	Top 10 Gross Movies and their respective Countries
	TOP 5 Movie directors, and movie stars for the highest score
	Numbers of movies and Average of movies per Director
	Top 10 Companies who produced the most movies
	Show the difference between top 5 movies with their most votes and most gross 
	
## Insights
	i. The action genre of movies generated more revenues for movie producers.
	
	ii. The United States is a good area for movie production.
	
	iii. Action, Animation, and comedy movies generate more revenue than romance movies.
	
	iv. "The Shawshank Redemption" of 1994 is the most scored movie with a 9.3 rating.
	
	v. "Avatar" of 2009 is the most gross movie with a $ 2,847,246,203
	
	vi. "Martin Scorsese" has 19 movies that total average is 7.67 while "Christopher Nolan" has 11 movies that total average is 8.16.
	
	vii. "Universal Pictures" Company produced 330 movies and total revenue is $ 35,251,375,417 during 40 years.
	
