-- Find the most common cause of death (modal cause) for each age
WITH causes_by_age AS (
    SELECT  
        dth."basic_cause_id" AS cause_id,
        ROUND(CAST(dcs."age" AS NUMERIC), 0) AS age,
        COUNT(*) AS death_count
    FROM "Death" dth
    JOIN "Deceased" dcs ON dth."death_id" = dcs."deceased_id"
    GROUP BY age, dth."basic_cause_id"
),

age_totals_and_max AS (
    SELECT 
        age,
        MAX(death_count) AS max_death_count,
        SUM(death_count) AS total_deaths_for_age
    FROM causes_by_age
    GROUP BY age
)

SELECT  
    cba.age,
    dc."description" AS most_common_cause,
    cba.death_count AS deaths_from_cause,
    atm.total_deaths_for_age,
    ROUND(100.0 * cba.death_count / atm.total_deaths_for_age, 4) AS cause_percentage
FROM causes_by_age cba
JOIN age_totals_and_max atm 
    ON cba.age = atm.age AND cba.death_count = atm.max_death_count
JOIN "DeathCause" dc 
    ON dc."basic_cause_id" = cba.cause_id
ORDER BY cba.age;
