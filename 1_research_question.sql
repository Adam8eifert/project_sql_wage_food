SELECT calendar_year, industry_branch_name, 
       ROUND(AVG(avg_monthly_wage_czk), 2) AS avg_wage_per_year
FROM t_adam_seifert_project_sql_primary_final
GROUP BY calendar_year, industry_branch_name
ORDER BY calendar_year, industry_branch_name;