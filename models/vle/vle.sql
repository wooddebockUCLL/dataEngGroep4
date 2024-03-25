{{ config(materialized='external', location='output/vle.csv') }}

select *
from {{ source('raw_data', 'vle') }}
