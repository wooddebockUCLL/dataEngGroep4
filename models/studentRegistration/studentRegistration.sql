{{ config(materialized='external', location='output/studentregistration.csv') }}

select *
from {{ source('raw_data', 'studentRegistration') }}