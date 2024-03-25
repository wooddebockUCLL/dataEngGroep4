{{ config(materialized='external', location='output/facts.csv') }}

with studentAssessment as (
  select *
  from {{ ref(
    'studentAssessment'
  ) }}
),

assessments as (
  select *
  from {{ ref(
    'assessments'
  ) }}
),

studentInfo as (
  select *
  from {{ ref(
    'studentinfo'
  ) }}
)

select
  sa.id_student,
  sa.id_assessment,
  a.date,
  a.code_module,
  a.weight,
  sa.score,
  si.gender,
  si.disability,
  highest_education,
  sv.sum_click,
  si.final_result
  from studentAssessment sa
    join assessments a
        on sa.id_assessment = a.id_assessment
    join studentInfo si
        on sa.id_student = si.id_student
    join studentvle sv
        on sa.id_student = sv.id_student