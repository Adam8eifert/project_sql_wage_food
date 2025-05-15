SELECT food_name, 
       ROUND(AVG(price_growth), 2) AS avg_annual_growth
FROM (
    SELECT calendar_year, food_name,
           100.0 * (food_price_value - LAG(food_price_value) OVER (PARTITION BY food_name ORDER BY calendar_year)) / NULLIF(LAG(food_price_value) OVER (PARTITION BY food_name ORDER BY calendar_year), 0) AS price_growth
    FROM t_adam_seifert_project_sql_primary_final
) AS growths
WHERE price_growth IS NOT NULL
GROUP BY food_name
ORDER BY avg_annual_growth ASC
LIMIT 1;