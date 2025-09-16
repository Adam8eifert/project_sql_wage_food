CREATE TABLE t_Adam_Seifert_project_SQL_primary_final AS
SELECT
    EXTRACT(YEAR FROM cp2.date_from)::int AS calendar_year,
    cpib.name AS industry_branch_name,
    ROUND(AVG(CASE WHEN cp.value_type_code = 5958 THEN cp.value END)::numeric, 2) AS avg_monthly_wage_czk,
    ROUND(AVG(CASE WHEN cp.value_type_code = 316 THEN cp.value END)::numeric, 2) AS avg_employees_thousands,
    cpc.name AS method_of_employee_count,
    cpc2.name AS food_name,
    MAX(cpc2.price_value) AS food_quantity_value,
    MAX(cpc2.price_unit) AS food_quantity_unit,
    ROUND(AVG(cp2.value)::numeric, 2) AS food_price_value
FROM
    czechia_payroll cp
JOIN
    czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code
JOIN
    czechia_payroll_calculation cpc ON cp.calculation_code = cpc.code
JOIN
    czechia_price cp2 ON cp.payroll_year = EXTRACT(YEAR FROM cp2.date_from)
JOIN
    czechia_price_category cpc2 ON cp2.category_code = cpc2.code
WHERE
    cp.value_type_code IN (316, 5958)
    AND cp.calculation_code = 100
GROUP BY
    calendar_year,
    cpib.name,
    cpc.name,
    cpc2.name
ORDER BY
    calendar_year,
    cpib.name,
    cpc2.name;
