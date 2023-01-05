view: encounter_simple {
  sql_table_name: healthcare_demo_live.encounter_simple ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: dischare_disposition_display {
    type: string
    sql: ${TABLE}.dischare_disposition_display ;;
  }

  dimension: discharge_disposition_code {
    type: string
    sql: ${TABLE}.discharge_disposition_code ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_time ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: practitioner_id {
    type: string
    sql: ${TABLE}.practitioner_id ;;
  }

  dimension: reason_code {
    type: string
    sql: ${TABLE}.reason_code ;;
  }

  dimension: reason_display {
    type: string
    sql: ${TABLE}.reason_display ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: type_code {
    type: string
    sql: ${TABLE}.type_code ;;
  }

  dimension: type_display {
    type: string
    sql: ${TABLE}.type_display ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
