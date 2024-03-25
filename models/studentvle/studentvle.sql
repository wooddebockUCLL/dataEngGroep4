{{ config(materialized='external', location='output/studentvle.csv') }}

select code_module,id_student, sum(sum_click) as sum_click
from {{ source('raw_data', 'studentVle') }}
group by code_module,id_student

