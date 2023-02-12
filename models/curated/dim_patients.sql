with

int_patients as (

    select * from {{ ref('int_patients') }}

),

final as (

    select

        abs(hash(patient_id)) as patient_skey,
        effective_date,
        patient_id,
        patient_medical_record_number as medical_record_number,
        patient_social_security_number as social_security_number,
        patient_address as address,
        patient_gender as gender,
        patient_birth_date as birth_date,
        date(patient_death_at) as death_date,
        patient_age_bucket as age_bucket
        
    from int_patients

)

select * from final

