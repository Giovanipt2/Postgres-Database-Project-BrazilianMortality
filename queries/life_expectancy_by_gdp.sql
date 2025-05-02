-- Analyze death statistics by GDP per capita decile
WITH city_deciles AS (
    SELECT 
        "IBGE_city_code" AS city_code,
        NTILE(10) OVER (ORDER BY "GDP_per_capita") AS decile
    FROM "Municipality"
),

city_stats_by_decile AS (
    SELECT 
        decile,
        COUNT(*) AS number_of_cities,
        MIN(m."GDP_per_capita") AS lowest_gdp_per_capita,
        MAX(m."GDP_per_capita") AS highest_gdp_per_capita,
        SUM(m."population_estimate_2009") AS total_population
    FROM "Municipality" m
    JOIN city_deciles d ON m."IBGE_city_code" = d.city_code
    GROUP BY decile
),

death_stats_by_decile AS (
    SELECT 
        d.decile,
        COUNT(*) AS total_deaths,
        ROUND(CAST(AVG(dc."age") AS NUMERIC), 4) AS mean_age_of_death,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY dc."age") AS median_age_of_death
    FROM "Death" dt
    JOIN "Deceased" dc ON dt."death_id" = dc."deceased_id"
    JOIN city_deciles d ON dt."location_code" = d.city_code
    GROUP BY d.decile
)

SELECT 
    cs.decile AS decile,
    cs.number_of_cities,
    cs.lowest_gdp_per_capita,
    cs.highest_gdp_per_capita,
    cs.total_population,
    ds.total_deaths,
    ds.mean_age_of_death,
    ds.median_age_of_death
FROM city_stats_by_decile cs
JOIN death_stats_by_decile ds ON cs.decile = ds.decile
ORDER BY cs.decile;
