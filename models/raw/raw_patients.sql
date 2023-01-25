with 

source as (

    select * from {{ source('source_a', 'fhir_patient') }}

)

select * from source