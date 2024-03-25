{{ config(materialized='external', location='output/studentassessment.csv') }}

select *
from {{ source('raw_data', 'studentAssessment') }}