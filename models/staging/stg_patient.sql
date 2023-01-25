--This staging file renames the columns to make them more descriptive while excluding those that are either all NULL or redundant.
{{
    config(
        materialized='table'
    )
}} --This will save the output of this stg_patient model in Snowflake as a table rather than as a view.

with 

source as (

    select * from {{ source('source_a', 'fhir_patient') }}

),

patients as (

    select 

        id as patient_id,
        identifier as patient_id_and_other_ids,
        name as patient_name,
        address as patient_address,
        telecom as patient_phone_number,
        gender as patient_gender,
        extension as patient_race_and_origin_info,
        birthdate as patient_birthdate,
        maritalstatus as patient_marital_status,
        communication as patient_preferred_language,
        multiplebirthinteger as patient_birth_order,
        multiplebirthboolean as patient_has_siblings,
        deceaseddatetime as patient_deceased_datetime
        --resourcetype as patient_or_other,
        --meta as patient_profile,
        --resource_text

    from source

)

select * from patients