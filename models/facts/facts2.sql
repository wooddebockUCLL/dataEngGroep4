{{ config(materialized='external', location='output/facts2.csv') }}

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
  si.id_student,
  si.region,
  si.highest_education,
  si.gender,
  si.age_band,
  sr.code_module,
  sr.date_registration,
  sr.date_unregistration

  from studentAssessment sa
    join assessments a
        on sa.id_assessment = a.id_assessment
    join studentInfo si
        on sa.id_student = si.id_student
    join studentvle sv
        on sa.id_student = sv.id_student
    join studentRegistration sr
        on sa.id_student = sr.id_student