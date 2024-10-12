{{
  config(
    target_database = dev.dev_db,
    target_schema = dev.dbt_alexandremouchaffaagmailcom,
    strategy='check',
    unique_key='product_id',
    check_cols=['inventory'],
   )
}}

