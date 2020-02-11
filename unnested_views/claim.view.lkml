#########  Original Table  #########

# unnested arrays are included as view with their own dimensions below

view: claim {
  sql_table_name: test_bq_dataset.Claim ;;

  #########  Standard dimensions  #########

  dimension: id {
    label: "Claim ID"
    primary_key: yes
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    sql: ${TABLE}.status ;;
  }

  dimension: use {
    hidden: yes
    sql: ${TABLE}.use ;;
  }

  #########  JSON  dimensions  #########


  #### period fields  ####

  dimension: billable_period {
    hidden: yes
    sql: ${TABLE}.billablePeriod ;;
  }

  dimension_group: billable_start {
    type: time
    timeframes: [
      date,
      week,
      month_name,
      year
    ]
    sql: ${billable_period}.start ;;
  }

  dimension_group: billable_end {
    type: time
    timeframes: [
      date,
      week,
      month_name,
      year
    ]
    sql: ${billable_period}.end ;;
  }

  #### Org & Patient ID fields  ####


  dimension: organization_id {
    hidden: yes
    sql: ${TABLE}.organization.organizationId ;;
  }

  dimension: patient_id {
    hidden: yes
    sql: ${TABLE}.patient.patientId ;;
  }


  #########  array  dimensions  #########


  dimension: information {
    hidden: yes
    sql: ${TABLE}.information ;;
  }

  dimension: item {
    hidden: yes
    sql: ${TABLE}.item ;;
  }

  dimension: prescription {
    hidden: yes
    sql: ${TABLE}.prescription ;;
  }

  dimension: procedure {
    hidden: yes
    sql: ${TABLE}.procedure ;;
  }


  dimension: total {
    hidden: yes
    sql: ${TABLE}.total ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

### arrays with nested JSON ###
view: claim__diagnosis {
  dimension: diagnosis {
    hidden: yes
    sql: ${TABLE}.diagnosis ;;
  }

  dimension: diagnosis___condition_id {
    label: "Diagnosed Condition ID"
    sql: ${diagnosis}.reference.reference.conditionId ;;
  }

  dimension: sequence {
    hidden: yes
    sql: ${TABLE}.sequence ;;
  }
}

view: claim__information {
  dimension: category {
    hidden: yes
    sql: ${TABLE}.category ;;
  }

  dimension: sequence {
    hidden: yes
    sql: ${TABLE}.sequence ;;
  }

  dimension: value {
    hidden: yes
    sql: ${TABLE}.value ;;
  }

  dimension: immunization_id {
    hidden: yes
    sql: ${value}.reference.immunizationId ;;
  }
}
