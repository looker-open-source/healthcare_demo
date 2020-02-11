view: condition_simple {
  sql_table_name: healthcare_demo_live.simple_condition ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: category_code {
    type: string
    sql: ${TABLE}.category_code ;;
  }

  dimension: category_display {
    type: string
    sql: ${TABLE}.category_display ;;
  }

  dimension: clinical_status {
    type: string
    sql: ${TABLE}.clinical_status ;;
  }

  dimension: condition_code {
    type: string
    sql: ${TABLE}.condition_code ;;
  }

  dimension: condition_display {
    type: string
    sql: ${TABLE}.condition_display ;;
  }

  dimension: encounter_id {
    type: string
    sql: ${TABLE}.encounter_id ;;
  }

  dimension_group: onset {
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
    sql: ${TABLE}.onset_time ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: verification_status {
    type: string
    sql: ${TABLE}.verification_status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
