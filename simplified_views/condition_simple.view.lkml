view: condition_simple {
  sql_table_name: lookerdata.healthcare_demo_live.simple_condition ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.condition_id ;;
  }


  dimension: category_code {
    type: string
    sql: ${TABLE}.condition__category__coding_code ;;
  }

  dimension: category_display {
    type: string
    sql: ${TABLE}.condition__category__coding_display ;;
  }

  dimension: condition_code {
    type: string
    sql: ${TABLE}.condition__code__coding_code ;;
  }

  dimension: condition_display {
    type: string
    sql: ${TABLE}.condition__code__coding_display ;;
  }

  dimension: clinical_status {
    type: string
    sql: ${TABLE}.condition_clinical_status ;;
  }

  dimension: encounter_id {
    type: string
    sql: ${TABLE}.condition_context__encounterid_1 ;;
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
    sql: ${TABLE}.condition_onset_time ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.condition_subject__patient_id ;;
  }

  dimension: verification_status {
    type: string
    sql: ${TABLE}.condition_verification_status ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
