SELECT s.calendar_year,
       ROUND(AVG(s.gdp)::numeric, 2) AS avg_gdp,
       ROUND(AVG(p.avg_monthly_wage_czk)::numeric, 2) AS avg_wage,
       ROUND(AVG(p.food_price_value)::numeric, 2) AS avg_food_price
FROM t_adam_seifert_project_sql_secondary_final s
JOIN t_adam_seifert_project_sql_primary_final p ON s.calendar_year = p.calendar_year
GROUP BY s.calendar_year
ORDER BY s.calendar_year;
