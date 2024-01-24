-- Count the number of athletes from each country
SELECT Country, COUNT() AS TotalAthletes
FROM athletes
GROUP BY Country
ORDER BY TotalAthletes DESC;

-- Calculate the total medals won by each country
SELECT
Team_Country,
SUM(Gold) AS Total_Gold,
SUM(Silver) AS Total_Silver,
SUM(Bronze) AS Total_Bronze
FROM medals
GROUP BY Team_Country
ORDER BY Total_Gold DESC;

-- Calculate the average number of entries by gender for each discipline
SELECT Discipline,
AVG(Female) AS Avg_Female,
AVG(Male) AS Avg_Male
FROM entriesgender
GROUP BY Discipline;
