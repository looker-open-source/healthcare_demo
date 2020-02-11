view: readmission {
 derived_table: {
   sql: WITH b as (
SELECT
  encounter.id  AS encounter_id,
  encounter.serviceProvider.organizationId as organization_id,
  encounter.subject.patientId  AS patient_id,
  case when encounter.class.code = 'IMP' then 'Inpatient'
    when encounter.class.code = 'AMB' then 'Ambulatory'
    when encounter.class.code = 'EMER' then 'Emergency Department' end AS encounter_code_name,
  encounter.period.start as visit_start,
  rank () over (partition by encounter.subject.patientId order by encounter.period.start desc) as encounter_rank
  FROM lookerdata.healthcare_demo_live.encounter  AS encounter
  --WHERE encounter.class.code = 'IMP'
GROUP BY 1,2,3,4,5
)

select b.*, b1.encounter_code_name as prior_visit_encounter_code_name, b1.visit_start as prior_visit_start, b1.encounter_id as prior_encounter_id
from b
left join b as b1 on b.patient_id = b1.patient_id and b.encounter_rank+1 = b1.encounter_rank
group by 1,2,3,4,5,6,7,8,9
order by 2,3,4 desc
 ;;
 }


dimension: encounter_id {
  primary_key: yes
}

dimension: patient_id {}

dimension: organization_id {}

dimension: encounter_code_name {}

dimension: prior_encounter_id {}

dimension_group: visit_start {
  type: time
  timeframes: [raw, date, time]
  sql: ${TABLE}.visit_start ;;
}

dimension: encounter_rank {}

  dimension_group: prior_visit_start {
    type: time
    timeframes: [raw, date, time]
    sql: ${TABLE}.prior_visit_start ;;
  }

  dimension: prior_visit_encounter_code_name {}

  dimension: time_between_visits {
    type: duration_hour
    sql_start:${prior_visit_start_raw}  ;;
    sql_end: ${visit_start_raw} ;;
    value_format_name: decimal_2
  }

  dimension: is_readmission {
    type: yesno
    sql: ${time_between_visits} <= 720 ;;
  }

  measure: count {
    label: "Number of Encounters"
    type: count
  }

  measure: average_time_between_visits {
    type: average
    sql: ${time_between_visits} ;;
  }

  measure: count_readmissions {
    label: "Number of Readmissions"
    type: count

    filters: {
      field: is_readmission
      value: "yes"
    }
    drill_fields: [patient.id, patient.name, patient.ssn_hashed, patient.age, patient.gender, count_readmissions]
  }

  measure: perc_30_day_readmission {
    label: "Percent 30 Day Readmission"
    type: number
    sql: (1.0*${count_readmissions}/NULLIF(${count},0))/2 ;;
    value_format_name: percent_1
    drill_fields: [condition__code__coding.code, condition__code__coding.display, perc_30_day_readmission]
  }

}
