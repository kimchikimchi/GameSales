-- Database: Games_DB

-- DROP DATABASE "Games_DB";

--CREATE DATABASE "Games_DB"
  --  WITH 
  --  OWNER = postgres
 --   ENCODING = 'UTF8'
  --  LC_COLLATE = 'English_United States.1252'
   -- LC_CTYPE = 'English_United States.1252'
 --   TABLESPACE = pg_default
---    CONNECTION LIMIT = -1;



-- Delete order depends on foregin key dependencies
DROP TABLE IF EXISTS google_trends;
DROP TABLE IF EXISTS sales;


-- Table Creation for google
-- new_games":2,"xbox":40,"playstation":20,"nintendo":16,"year":"2005","month":"01
CREATE TABLE "google_trends" (
    "new_games" int   NOT NULL PRIMARY KEY,
    "xbox" int   NOT NULL,
    "playstation" int   NOT NULL,
    "nintendo" int   NOT NULL,
    "year" int   NOT NULL,
    "month" int   NOT NULL
);
-- table creation for billy's web scraping
-- "Rank":5001,"Name",Platform":"XB","Publisher":"Ubisoft Montreal
-- Developer":"Ubisoft","Critic_Score":null,"User_Score":null,"Global_Sales":"0.58","NA_Sales":"0.33","EU_Sales":"0.22"
-- "JP_Sales":null,"Other_Sales":"0.03","year":"2005","month":"12"},
CREATE TABLE "sales" (
    "Rank" int   NOT NULL PRIMARY KEY,
    "Name" varchar   NOT NULL,
    "Platform" varchar   NOT NULL,
    "Publisher" varchar   NOT NULL,
    "Developer" varchar   NOT NULL,
    "Critic_Score" varchar   NOT NULL,
    "User_Score" varchar   NOT NULL,
    "Global_Sales" int   NOT NULL,
    "NA_Sales" int   NOT NULL,
    "EU_Sales" int   NOT NULL,
    "JP_Sales" varchar   NOT NULL,
    "Other_Sales" int   NOT NULL,
    "year" int   NOT NULL,
    "month" int   NOT NULL
);
