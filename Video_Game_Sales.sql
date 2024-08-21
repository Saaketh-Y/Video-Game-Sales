Select * From PortfolioProject..vgsales Order by "RANK"

--- Data Cleaning and Transformation

-- Making sure the platform data hasnt been duplicated in a different way -- 

SELECT DISTINCT(Platform) FROM PortfolioProject..vgsales
SELECT DISTINCT(Genre) FROM PortfolioProject..vgsales
SELECT DISTINCT(Year) FROM PortfolioProject..vgsales

-- We can see 'N/A' in Year so lets replace it with NULL --

UPDATE PortfolioProject..vgsales
SET Year = NULL
WHERE Year = 'N/A';

-- Converting data types to integer, we are altering table as this is a testing environment --

ALTER TABLE PortfolioProject..vgsales
ALTER COLUMN NA_Sales DECIMAL(10, 2);

ALTER TABLE PortfolioProject..vgsales
ALTER COLUMN EU_Sales DECIMAL(10, 2);

ALTER TABLE PortfolioProject..vgsales
ALTER COLUMN JP_Sales DECIMAL(10, 2);

ALTER TABLE PortfolioProject..vgsales
ALTER COLUMN Other_Sales DECIMAL(10, 2);

ALTER TABLE PortfolioProject..vgsales
ALTER COLUMN Global_Sales DECIMAL(10, 2);

--- Exploratory Data Analysis 

-- Top 10 Games by Global Sales --

SELECT TOP 10 Rank, Name, Platform, Year, Genre, Publisher, Global_Sales 
FROM PortfolioProject..vgsales
ORDER BY Global_Sales DESC;

-- Sales Distribution by Region --

SELECT 
SUM(NA_Sales) AS Total_NA_Sales,
SUM(EU_Sales) AS Total_EU_Sales,
SUM(JP_Sales) AS Total_JP_Sales,
SUM(Other_Sales) AS Total_Other_Sales,
SUM(Global_Sales) AS Total_Global_Sales
FROM PortfolioProject..vgsales;

-- Genre-wise Sales Statistics --

SELECT Genre,
COUNT(*) AS Games_Count,
AVG(Global_Sales) AS Avg_Global_Sales,
MAX(Global_Sales) AS Max_Global_Sales,
MIN(Global_Sales) AS Min_Global_Sales
FROM PortfolioProject..vgsales
GROUP BY Genre;

-- Year-wise Sales Trends --

SELECT Year,
SUM(Global_Sales) AS Total_Global_Sales
FROM PortfolioProject..vgsales
GROUP BY Year
ORDER BY Year;

-- Top Publishers by Global Sales --

SELECT TOP 10 Publisher,
SUM(Global_Sales) AS Total_Global_Sales
FROM PortfolioProject..vgsales
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC;

--- Lets now load this data to PowerBI