
{%- set old_etl_relation=ref('prototype_dim_patients') -%}
{%- set dbt_relation=ref('dim_patients') -%}
{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="patient_skey"
) }}