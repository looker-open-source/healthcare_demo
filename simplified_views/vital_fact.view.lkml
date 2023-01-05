view: vital_fact {
  sql_table_name: healthcare_demo_live.vital_fact ;;
  # sql_table_name: ${observation_vitals_average_standard_dev_pdt.SQL_TABLE_NAME} ;;

  dimension: vital_type {
    primary_key: yes
    type: string
    sql: ${TABLE}.vital ;;
  }

  dimension: average {
    type: string
    sql: ${TABLE}.average ;;
  }

  dimension: standard_deviation {
    type: string
    sql: ${TABLE}.sd ;;
  }

}
