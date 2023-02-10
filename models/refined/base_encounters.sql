with 

source as (

    select * from {{ ref('raw_encounters') }}

),

base_encounters as (

    select

        id as encounter_id,
        period:start::datetime as encounter_start_datetime,
        period:end::datetime as encounter_end_datetime,
        location[0]:location:display::varchar as encounter_location,
        reasoncode[0]:coding[0]:display::varchar as encounter_reason,
        participant[0]:individual:display::varchar as provider_full_name,
        subject:display::varchar as patient_full_name,
        hospitalization:dischargeDisposition:text::varchar as discharge_disposition

    from source
)

select * from base_encounters