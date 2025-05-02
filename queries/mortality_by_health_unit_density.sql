-- Analyze non-external mortality rates grouped by population per health unit
WITH population_per_unit AS (
    SELECT
        m."IBGE_city_code",
        m."population_estimate_2009",
        u.unit_count,
        m."population_estimate_2009" / u.unit_count AS persons_per_unit
    FROM "Municipality" m
    JOIN (
        SELECT
            "IBGE_city_code",
            COUNT(*) AS unit_count
        FROM "BasicHealthUnit"
        GROUP BY "IBGE_city_code"
    ) u ON m."IBGE_city_code" = u."IBGE_city_code"
),

non_external_deaths AS (
    SELECT
        m."IBGE_city_code",
        m."population_estimate_2009",
        d.total_deaths AS non_external_death_count
    FROM "Municipality" m
    JOIN (
        SELECT
            "location_code",
            COUNT(*) AS total_deaths
        FROM "Death"
        WHERE NOT (
            "basic_cause_id" LIKE 'S%' OR
            "basic_cause_id" LIKE 'T%' OR
            "basic_cause_id" LIKE 'V%' OR
            "basic_cause_id" LIKE 'W%' OR
            "basic_cause_id" LIKE 'X%' OR
            "basic_cause_id" LIKE 'Y%'
        )
        GROUP BY "location_code"
    ) d ON m."IBGE_city_code" = d."location_code"
),

city_bins AS (
    SELECT
        ppu."IBGE_city_code",
        ppu."population_estimate_2009",
        ppu.unit_count,
        ppu.persons_per_unit,
        nd.non_external_death_count,
        CASE 
            WHEN ppu.persons_per_unit < 1500 THEN 1
            WHEN ppu.persons_per_unit < 2000 THEN 2
            WHEN ppu.persons_per_unit < 2500 THEN 3
            WHEN ppu.persons_per_unit < 3000 THEN 4
            WHEN ppu.persons_per_unit < 4000 THEN 5
            WHEN ppu.persons_per_unit < 5000 THEN 6
            ELSE 7
        END AS ppu_range
    FROM population_per_unit ppu
    JOIN non_external_deaths nd ON ppu."IBGE_city_code" = nd."IBGE_city_code"
)

SELECT
    CASE ppu_range
        WHEN 1 THEN 'Fewer than 1500'
        WHEN 2 THEN '1500–1999'
        WHEN 3 THEN '2000–2499'
        WHEN 4 THEN '2500–2999'
        WHEN 5 THEN '3000–3999'
        WHEN 6 THEN '4000–4999'
        WHEN 7 THEN '5000 or more'
    END AS individuals_per_health_unit,
    COUNT(*) AS number_of_cities,
    SUM(population_estimate_2009) AS total_population,
    SUM(unit_count) AS total_units,
    SUM(non_external_death_count) AS total_non_external_deaths,
    ROUND(
        CAST(1000 * SUM(non_external_death_count) / SUM(population_estimate_2009) AS NUMERIC),
        4
    ) AS mortality_rate
FROM city_bins
GROUP BY ppu_range
ORDER BY ppu_range;
