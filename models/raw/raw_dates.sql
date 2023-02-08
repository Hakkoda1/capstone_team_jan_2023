
WITH dates AS (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('1911-01-01' as date)",
        end_date="cast('2023-03-01' as date)") }}
)
SELECT * FROM dates

-- Which dates should we use? 
-- MIN_ENCOUNTER_START_DATETIME
-- 1911-03-23
-- MAX_ENCOUNTER_END_DATETIME
-- 2022-02-07
