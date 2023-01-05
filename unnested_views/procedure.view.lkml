#########  Original Table  #########
# unnested arrays are included as view with their own dimensions below

view: procedure {
  sql_table_name: lookerdata.healthcare_demo_data.Procedure ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  #########  JSON  dimensions  #########

  dimension: action_performed_extension {
    label: "Performed Status"
    sql: ${TABLE}.shr_action_PerformedContext_extension.shr_action_Status_extension.value.code ;;
  }


  #### code fields  ####

  dimension: code {
    hidden: yes
    sql: ${TABLE}.code ;;
  }

  dimension: code__coding {
    hidden: yes
    sql: ${code}.coding ;;
  }

  #### context fields  ####

  dimension: context {
    hidden: yes
    sql: ${TABLE}.context ;;
  }

  dimension: context__encounter_id {
    sql: ${context}.encounterId ;;
  }

  #### meta fields  ####

  dimension: meta {
    hidden: yes
    sql: ${TABLE}.meta ;;
  }

  dimension: meta__profile {
    hidden: yes
    sql: ${meta}.profile ;;
  }


  #### performed fields  ####

  dimension: performed {
    hidden: yes
    sql: ${TABLE}.performed ;;
  }

  dimension_group: performed__start {
    type: time
    label: "Start"
    timeframes: [
      date,
      month,
      year,
      time_of_day,
      hour_of_day,
      day_of_week,
      day_of_month
    ]
    sql: ${performed}.period.start ;;
  }

  dimension_group: performed__end {
    type: time
    label: "End"
    timeframes: [
      date,
      month,
      year,
      time_of_day,
      hour_of_day,
      day_of_week,
      day_of_month
    ]
    sql: ${performed}.period.end ;;
  }

  #### subject fields  ####

  dimension: subject {
    hidden: yes
    sql: ${TABLE}.subject ;;
  }

  dimension: subject__patient_id {
    sql: ${subject}.patientId ;;
  }


  measure: count {
    label: "Number of Procedures"
    type: count
    drill_fields: [id]
  }
}

#########  Unnested Arrays  #########

### arrays with nested JSON ###

#array unnested from component.code
view: procedure__code__coding {
  label: "Procedure"
  dimension: code {
    #group_label: "Code"
    label: "Procedure Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    #group_label: "Code"
    label: "Procedure Name"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    #group_label: "Code"
    hidden: yes
    type: string
    sql: ${TABLE}.system ;;
  }
}

### arrays without nested fields ###
view: procedure__meta__profile {
  label: "Procedure"

  dimension: profile {
    label: " Profile"
    sql: ${TABLE} ;;
  }
}
