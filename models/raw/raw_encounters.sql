with

source as (

    select distinct * from {{ source('capstone__source_a', 'fhir_encounter') }}

)

select * from source