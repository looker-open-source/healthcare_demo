view: patient_simple {
  sql_table_name: healthcare_demo_live.patient_simple ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: address_city {
    type: string
    sql: ${TABLE}.address_city ;;
  }

  dimension: address_country {
    type: string
    sql: ${TABLE}.address_country ;;
  }

  dimension: address_postal_code {
    type: string
    sql: ${TABLE}.address_postal_code ;;
  }

  dimension: address_state {
    type: string
    sql: ${TABLE}.address_state ;;
  }

  dimension: birth_place__city {
    type: string
    sql: ${TABLE}.birth_place__city ;;
  }

  dimension: birth_place__country {
    type: string
    sql: ${TABLE}.birth_place__country ;;
  }

  dimension: birth_place__state {
    type: string
    sql: ${TABLE}.birth_place__state ;;
  }

  dimension: birthsex {
    type: string
    sql: ${TABLE}.birthsex ;;
  }

  dimension: deceased_date {
    type: string
    sql: ${TABLE}.deceased_date ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.ethnicity ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: patient_name {
    type: string
    sql: ${TABLE}.patient_name ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: telecom {
    type: string
    sql: ${TABLE}.telecom ;;
  }

  measure: count {
    type: count
    drill_fields: [id, patient_name]
  }
}
