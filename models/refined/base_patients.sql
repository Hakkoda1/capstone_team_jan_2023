--This staging file renames the columns to make them more descriptive while excluding those that are either all NULL or redundant.

with 

patients as (

    select 

        address as patient_address,
        birthdate as patient_birth_date,
        communication as patient_preferred_language,
        deceaseddatetime as patient_deceased_date,
        extension as patient_race_and_origin_info,
        gender as patient_gender,
        id as patient_id,
        identifier as patient_id_and_other_ids,
        maritalstatus as patient_marital_status,
        --meta as patient_profile,
        multiplebirthboolean as patient_has_siblings,
        multiplebirthinteger as patient_birth_order,
        name as patient_name,
        --resourcetype as patient_or_other,
        telecom as patient_phone_number
        --resource_text
        
    from {{ ref('raw_patients') }}

)

select * from patients