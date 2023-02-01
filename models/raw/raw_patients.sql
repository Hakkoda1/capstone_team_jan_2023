with 

source as (

    select * from {{ source('capstone__source_a', 'fhir_patient') }}

)

select * from source