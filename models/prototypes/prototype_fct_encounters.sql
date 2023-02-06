select
    -- effective_date,
    -- encounter_end_date_skey,
    -- encounter_start_date_skey,
    -- patient_skey,
    id as encounter_id,
    period:start::date as encounter_start_datetime,
    period:end::date as encounter_end_datetime,
    location[0].location:display::string as location,
    reasoncode[0].coding[0]:display::string as reason,
    hospitalization:dischargedisposition:text::string as discharge_disposition,
    case
        when discharge_disposition is not null
        then 'y'
        when discharge_disposition is null
        then 'n'
    end as is_discharged,
    datediff(day, encounter_start_datetime, encounter_end_datetime) as length_of_stay
from capstone_team_jan_2023_dev.source_a.fhir_encounter
;
