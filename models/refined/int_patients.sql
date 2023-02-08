with 

base_patients as (

    select * from {{ ref('base_patients') }}

),

int_patients as (

    select

        current_timestamp() as effective_date,
        *,
        case
            when patient_death_at is not null then datediff(year, patient_birth_date, patient_death_at)
            else datediff(year, patient_birth_date, current_date())
        end as patient_age,
        case
            when patient_age < 1
            then 'infants (<1)'
            when patient_age >= 1 and patient_age <= 12
            then 'children [1,12]'
            when patient_age > 12 and patient_age <= 17
            then 'adolescents [13,17]'
            when patient_age > 17 and patient_age <= 39
            then 'young adults [18,39]'
            when patient_age > 39 and patient_age <= 59
            then 'middle-aged adults [40,59]'
            when patient_age > 60
            then 'old adults (>60)'
        end as patient_age_bucket
        
    from base_patients

)

select * from int_patients
