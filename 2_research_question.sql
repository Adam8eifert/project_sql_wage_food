SELECT calendar_year, 
       ROUND(AVG(avg_monthly_wage_czk), 2) AS avg_wage,
       ROUND(AVG(CASE WHEN food_name ILIKE '%mléko%' THEN food_price_value END), 2) AS avg_price_milk,
       ROUND(AVG(CASE WHEN food_name ILIKE '%mléko%' THEN avg_monthly_wage_czk / food_price_value END), 2) AS milk_liters_affordable,
       ROUND(AVG(CASE WHEN food_name ILIKE '%chleba%' THEN food_price_value END), 2) AS avg_price_bread,
       ROUND(AVG(CASE WHEN food_name ILIKE '%chleba%' THEN avg_monthly_wage_czk / food_price_value END), 2) AS bread_kg_affordable
FROM t_adam_seifert_project_sql_primary_final
WHERE food_name ILIKE '%mléko%' OR food_name ILIKE '%chleba%'
GROUP BY calendar_year
ORDER BY calendar_year;