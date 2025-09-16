CREATE TABLE t_Adam_Seifert_project_SQL_secondary_final AS
SELECT
    e.country,
    e.year AS calendar_year,
    e.gdp,
    e.gini,
    e.population
FROM
    economies e
WHERE
    e.country IN (
        'Albania', 'Andorra', 'Armenia', 'Austria', 'Azerbaijan',
        'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
        'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia',
        'Finland', 'France', 'Georgia', 'Germany', 'Greece',
        'Hungary', 'Iceland', 'Ireland', 'Italy', 'Kazakhstan',
        'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania', 'Luxembourg',
        'Malta', 'Moldova', 'Monaco', 'Montenegro', 'Netherlands',
        'North Macedonia', 'Norway', 'Poland', 'Portugal', 'Romania',
        'Russia', 'San Marino', 'Serbia', 'Slovakia', 'Slovenia',
        'Spain', 'Sweden', 'Switzerland', 'Turkey', 'Ukraine',
        'United Kingdom', 'Vatican City'
    )
    AND e.year BETWEEN (
        SELECT MIN(EXTRACT(YEAR FROM date_from)) FROM czechia_price
    ) AND (
        SELECT MAX(EXTRACT(YEAR FROM date_to)) FROM czechia_price
    )
ORDER BY
    e.country,
    e.year;

