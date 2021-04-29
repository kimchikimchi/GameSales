# GameSales
Games Sales Data Analytics

## __Extract__

Initially we gone to https://data.world world to extract the video game sales data.  However, those were all secondary sources to http://www.vgchartz.com/.  So we opted to get the data directly from the source.  There was a problem the site charges for the use of there api. The only alternative was to screen scrap the website. When initinally scraping the data, the site seems to be either very under power or there is some sort of network throttling(assuming they did this so they can charge for the data).  Any request over 2000 records will cause a 503 error.  In order to bypass this we needed to set up a "range for loop" to extract only about 3-5 page at a time.  If the extraction fail, I will need to run it again within that range. Once the data is scrap off the website, it was organize into a data frame and save to a csv file.


## __Transform__ (via GameSales.ipynb)


Two CSV-format data files in *resources* directory are ingested here:
1. [Google Trend Data](https://trends.google.com/trends/explore?date=2004-12-31%202017-12-31&geo=US&q=new%20video%20games,xbox%20games,playstation%20games,nintendo%20games) : 
> Interest over timeNumbers represent search interest relative to the highest point on the chart for the given region and time. A value of 100 is the peak popularity for the term. A value of 50 means that the term is half as popular. A score of 0 means there was not enough data for this term.
2. [Global Sales Data](https://www.vgchartz.com): Scraped from a video game database website earlier, consisting over 2,000 game title data with regional sales figures and critical/user scores.  Sales figures are in Millions.

The following cleaning and transformation steps were taken:
- Simplify and rename column names.
- Change various date fields into separate year and month columns to query on dates at a later time.
- Drop unnecessary columns to keep loaded data space clean.
- Remove embedded units in sales data (ie: 0.05M)

## __Load__ (via GamesSales.ipynb to Postgres)
```
Note : You may have to update the database credential in the Jupyter Notebook's 'create_engine(...)' entry to connect your own database instance
```
For data storage, we've decided to use a RDMS, Postgres, in case we want to correlate collected data based fields such as  published year or platform.

Data imported into Pandas Dataframes are exported into two tables called 'sales' and 'google_trends'.  Pandas to_sql method handles both database schemas and data insertion via a connection established through SQL Alchemy  If executed again, the existing data dropped first in order to avoid inserting data repeatedly.


