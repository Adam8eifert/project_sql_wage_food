WITH yearly_data AS (
    SELECT calendar_year,
           AVG(avg_monthly_wage_czk) AS avg_wage,
           AVG(food_price_value) AS avg_price
    FROM t_adam_seifert_project_sql_primary_final
    GROUP BY calendar_year
),
growths AS (
    SELECT calendar_year,
           100.0 * (avg_price - LAG(avg_price) OVER (ORDER BY calendar_year)) / LAG(avg_price) OVER (ORDER BY calendar_year) AS price_growth,
           100.0 * (avg_wage - LAG(avg_wage) OVER (ORDER BY calendar_year)) / LAG(avg_wage) OVER (ORDER BY calendar_year) AS wage_growth
    FROM yearly_data
)
SELECT calendar_year
FROM growths
WHERE price_growth - wage_growth > 10;
