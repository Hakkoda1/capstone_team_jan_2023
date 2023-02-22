with

    int_encounters as (
        select * from {{ ref("int_encounters")}}
        ),

    final as (
        select
            {{ dbt_utils.generate_surrogate_key(["encounter_id"]) }}::binary
            as fct_encounter_skey,
            current_timestamp()::datetime as effective_date,
            {{ dbt_utils.generate_surrogate_key(["encounter_start_datetime"]) }}::binary as encounter_start_date_skey,
            {{ dbt_utils.generate_surrogate_key(["encounter_end_datetime"]) }}::binary as encounter_end_date_skey,
            {{ dbt_utils.generate_surrogate_key(["patient_id"]) }}::binary as patient_skey,
            encounter_id::varchar as encounter_id,
            encounter_start_datetime::datetime as encounter_start_datetime,
            encounter_end_datetime::datetime as encounter_end_datetime,
            encounter_location::varchar as location,
            encounter_reason::varchar as reason,
            discharge_disposition::varchar as discharge_disposition,
            is_discharged::boolean as is_discharged,
            length_of_stay::int as length_of_stay

        from int_encounters
    )

select *
from final
