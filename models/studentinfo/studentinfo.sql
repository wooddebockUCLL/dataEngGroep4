{{ config(materialized='external', location='output/studentinfo.csv') }}

select *
from {{ source('raw_data', 'studentInfo') }}
