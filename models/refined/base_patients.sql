with 

source as (

    select * from {{ ref('raw_patients') }}

),

base_patients as (

    select

    concat(address[0]:line[0]::varchar,
             ', ', address[0]:city::varchar,
            ', ', address[0]:state::varchar,
             ', ', address[0]:country::varchar) as patient_address,
    birthdate::date as patient_birth_date,
    communication[0]:language:text::varchar as patient_preferred_language,
    deceaseddatetime::datetime as patient_death_at,
    extension[0]:extension[1]:valueString::varchar as patient_race,
    gender as patient_gender,
    id as patient_id,
    identifier[0]:value::varchar as patient_medical_record_number,
    identifier[2]:value::varchar as patient_social_security_number,
    maritalstatus:text::varchar as patient_marital_status,
    multiplebirthboolean as patient_has_siblings,
    multiplebirthinteger as patient_birth_order,
    name[0]:family::varchar as patient_family_name,
    name[0]:given[0]::varchar as patient_given_name,
    telecom[0]:value::varchar as patient_phone_number

    from source

)

select * from base_patients