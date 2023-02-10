with 

base_encounters as (

    select * from {{ ref('base_encounters') }}

),

int_encounters as (

    select

        current_timestamp() as effective_date,
        *,
        case
            when split_part(discharge_disposition, ' ', 0) in ('Discharge', 'Discharged') then true
            when split_part(discharge_disposition, ' ', 0) in ('Transferred', 'Expired') then false
        end as is_discharged,
        datediff(day, encounter_start_datetime, encounter_end_datetime) as length_of_stay

    from base_encounters

)

select * from int_encounters