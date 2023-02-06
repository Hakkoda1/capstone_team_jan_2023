with
    patient_calculation as (
        select
            -- patient_skey,  
            current_timestamp() as effective_date,
            id as patient_id,
            identifier[1].value::string as medical_record_number,
            identifier[2].value::string as social_security_number,
            concat(address[0].line[0]::STRING,', ',address[0].city::STRING,', ',address[0].state::STRING,' ',address[0].postalCode::STRING) as address_concat,
            gender,
            birthdate as birth_date,
            deceaseddatetime as death_date,
            case
                when death_date is not null
                then datediff(year, birthdate, death_date)
                when death_date is null
                then datediff(year, birthdate, current_date())
                else null
            end as age,
            case
                when age < 1
                then 'infants (<1)'
                when age >= 1 and age <= 12
                then 'children [1,12]'
                when age > 12 and age <= 17
                then 'adolescents [13,17]'
                when age > 17 and age <= 39
                then 'young adults [18,39]'
                when age > 39 and age <= 59
                then 'middle-aged adults [40,59]'
                when age > 60
                then 'old adults (>60)'
            end as age_bucket
        from capstone_team_jan_2023_dev.source_a.fhir_patient
    )
select
    -- patient_skey,  
    effective_date,
    patient_id,
    medical_record_number,
    social_security_number,
    address_concat as address,
    gender,
    birth_date,
    death_date,
    age_bucket
from patient_calculation
;