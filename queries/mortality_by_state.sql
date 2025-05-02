	-- Estimate population, total deaths, and mortality rate (per 1000) by state
	WITH population_by_state AS (
	    SELECT 
	        s."name" AS state_name,
	        SUM(m."population_estimate_2009") AS estimated_population
	    FROM "Municipality" m
	    JOIN "State" s ON s."IBGE_state_code" = m."IBGE_state_code"
	    GROUP BY s."name"
	),
	
	deaths_by_state AS (
	    SELECT 
	        s."name" AS state_name,
	        COUNT(*) AS total_deaths             
	    FROM "Death" d
	    JOIN "Municipality" m ON d."location_code" = m."IBGE_city_code"
	    JOIN "State" s ON s."IBGE_state_code" = m."IBGE_state_code"
	    GROUP BY s."name"
	)
	
	SELECT 
	    pop.state_name AS "State",
	    pop.estimated_population AS "Estimated_Population",
	    dth.total_deaths AS "Total_Deaths",
	    ROUND(
	        CAST((1000 * dth.total_deaths / pop.estimated_population) AS NUMERIC),
	        4
	    ) AS "Mortality_Rate"
	FROM population_by_state pop
	JOIN deaths_by_state dth ON pop.state_name = dth.state_name
	ORDER BY "Mortality_Rate" DESC;
