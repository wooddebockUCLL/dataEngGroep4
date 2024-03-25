{{ config(materialized='external', location='output/assessments.csv') }}

select *
from {{ source('raw_data', 'assessments') }}