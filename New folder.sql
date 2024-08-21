CREATE TABLE Public."video_game_data"("rank" int, "name" varchar(100), Platform varchar(100), "year" int, Genre varchar(100), Publisher varchar(100), NA_Sales decimal, EU_Sales decimal, JP_Sales decimal, Other_Sales decimal, Global_Sales decimal
);

SELECT * FROM video_game_data;

COPY public."video_game_data" FROM 'C:\Users\saake\Desktop\vgsales.csv' DELIMITER ',' CSV HEADER;