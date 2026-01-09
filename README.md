📊 SQL Project: Food Affordability & Wage Evolution Analysis
A comprehensive data analysis project investigating the relationship between average wages and basic food prices in the Czech Republic. The study covers multiple industry branches and identifies key economic trends over a specific time period.

🇬🇧 English Version
🎯 Project Goal
The objective was to analyze the standard of living by comparing the evolution of wages across various industries with the prices of essential foodstuffs. The final output provides data-driven answers to key research questions regarding economic stability and purchasing power.

🧠 Data Architecture & Cleaning
The project involved joining multiple complex tables (czechia_payroll, czechia_price, economies, etc.) and creating two final optimized tables:

Primary Table: Consolidated view of years, industries, average wages, and specific food prices.

Secondary Table: Macroeconomic indicators (GDP, GINI, population) for European countries.

Anomalies Addressed:

Data Inconsistency: Fixed mismatched units in the payroll table (where wages were incorrectly assigned to employee counts).

Schema Errors: Handled NULL values and corrected typos in the source database (e.g., mortaliy_under5).

Missing Records: Accounted for the addition of "White Wine" to the dataset after 2015.

📈 Research Insights
Wage Trends: Most industries show a rising trend, though sectors like Administrative Services experienced temporary stagnation.

Purchasing Power: The affordability of bread and milk has generally improved over the years.

Inflation Leader: Granulated sugar was identified as the most price-stable item, even showing price decreases in some periods.

Wage vs. Food Inflation: There was no year where food price growth exceeded wage growth by more than 10%.

GDP Correlation: A positive correlation exists between GDP growth and wages, while food prices are driven more by seasonal market factors.

🛠️ Tech Stack
Database: MariaDB / MySQL

Tools: DBeaver / MySQL Workbench

Language: SQL (Complex JOINs, CTEs, Window Functions)

🇨🇿 Česká verze
📌 Představení projektu
Tento projekt zkoumá životní úroveň občanů ČR skrze analýzu dostupnosti základních potravin v poměru k průměrným mzdám. Práce zahrnuje pokročilé čištění dat a propojování informací z trhu práce s makroekonomickými ukazateli.

✨ Klíčové nálezy
Stabilita cen: Cukr krystalový byl identifikován jako potravina s nejstabilnější cenou (v některých letech i zlevňoval).

Korelace s HDP: Potvrzen pozitivní vliv růstu HDP na růst mezd; ceny potravin jsou však na HDP nezávislejší.

Čištění dat: Projekt vyřešil kritické chyby v původních tabulkách, jako byly přehozené jednotky mezd a počtu zaměstnanců.

💡 Tip pro sekci "About" na GitHubu:
Advanced SQL project analyzing the correlation between wages and food prices. Includes complex data cleaning, multi-table joins, and macroeconomic trend analysis using MariaDB.

🖥️ Ukázka SQL kódu (včetně anglických komentářů):
V repozitáři by tvůj SQL skript měl obsahovat komentáře vysvětlující logiku:

SQL

/* Research Question 3: 
   Identify the food category with the slowest year-on-year price increase.
*/
SELECT 
    category_name,
    -- Calculate average yearly percentage change
    ROUND(AVG(yearly_percentage_change), 2) AS avg_growth
FROM (
    SELECT 
        category_name,
        calendar_year,
        -- Window function to get price from the previous year
        (avg_price - LAG(avg_price) OVER (PARTITION BY category_name ORDER BY calendar_year)) / 
        LAG(avg_price) OVER (PARTITION BY category_name ORDER BY calendar_year) * 100 AS yearly_percentage_change
    FROM t_adam_seifert_project_sql_primary_final
) AS subquery
GROUP BY category_name
ORDER BY avg_growth ASC;
👤 Autor / Author: Adam Seifert

Kontakt: seifert.promotion@gmail.com
