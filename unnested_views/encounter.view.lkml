#########  Original Table  #########
# unnested arrays are included as view with their own dimensions below

view: encounter {
  sql_table_name: lookerdata.healthcare_demo_live.encounter ;;

  #########  Standard dimensions  #########

  dimension: id {
    hidden: no
    label: " Encounter ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    label: " Status"
    type: string
    sql: ${TABLE}.status ;;
  }


  #########  JSON  dimensions  #########

  ### class fields ###

  dimension: class {
    hidden: yes
    sql: ${TABLE}.class ;;
  }

  dimension: code {
    label: "Class Code"
    type: string
    sql: ${class}.code ;;
  }

  dimension: code_name {
    type: string
    sql: case when ${code} = 'IMP' then 'Inpatient'
    when ${code} = 'AMB' then 'Ambulatory'
    when ${code} = 'EMER' then 'Emergency Department' end;;
  }

  dimension: is_inpatient {
    type: yesno
    sql: ${code} = 'IMP';;
  }

  dimension: system {
    hidden: yes
    group_label: "Class"
    type: string
    sql: ${class}.system ;;
  }


  ### hospitalization fields ###

  dimension: hospitalization {
    hidden: yes
    sql: ${TABLE}.hospitalization ;;
  }

  #nested json field
  dimension: hospitalization__discharge_disposition {
    hidden: yes
    sql: ${hospitalization}.dischargeDisposition ;;
  }

  #nested array, unnested below
  dimension: hospitalization__discharge_disposition__coding {
    hidden: yes
    sql: ${hospitalization__discharge_disposition}.coding ;;
  }


  #### period fields ###

  dimension: period {
    hidden: yes
    sql: ${TABLE}.period ;;
  }

  dimension_group: period__end {
    label: "  Discharge"
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      day_of_week,
      time,
      time_of_day,
      hour_of_day,
      raw
    ]
    sql:  ${period}.end ;;
  }

  dimension_group: period__start {
    label: "   Admission"
    type: time
    timeframes: [
      date,
      week,
      month,
      month_name,
      year,
      day_of_week,
      time,
      time_of_day,
      hour_of_day,
      day_of_year,
      week_of_year,
      raw
    ]
    sql: ${period}.start ;;
  }

  dimension: length_of_stay {
    type: duration_minute
    sql_start: ${period__start_raw} ;;
    sql_end: ${period__end_raw} ;;
  }


  ### metadata fields ###

  dimension: meta {
    hidden: yes
    sql: ${TABLE}.meta ;;
  }

  #nested array, unnested below
  dimension: meta__profile {
    hidden: yes
    type: string
    sql: ${meta}.profile ;;
  }


  #### service provider fields  ####

  dimension: service_provider {
    hidden: yes
    sql: ${TABLE}.serviceProvider ;;
  }

  dimension: organization_id {
    hidden: no
    label: " Organization ID"
    description: "Service Provider Organization ID"
    type: string
    sql: ${service_provider}.organizationId ;;
    link: {
      label: "Operations Overview for Hospital"
      url: "https://demoexpo.looker.com/dashboards/273?Hospital%20ID={{ value }}"
      icon_url: "https://avatars0.githubusercontent.com/u/1437874?s=400&v=4"
    }
  }


  #### subject fields  ####

  dimension: subject {
    hidden: yes
    sql: ${TABLE}.subject ;;
  }

  dimension: patient_id {
    hidden: no
    label: " Patient ID"
    sql: ${subject}.patientId ;;
  }


  #########  Array  dimensions, unnested below  #########

  dimension: participant {
    hidden: yes
    sql: ${TABLE}.participant ;;
  }

  dimension: reason {
    hidden: yes
    sql: ${TABLE}.reason ;;
  }

  dimension: type {
    hidden: yes
    sql: ${TABLE}.type ;;
  }


  #########  Measures  #########

  measure: count {
    label: "Number of Encounters"
    type: count
    drill_fields: [encounter__type__coding.display, average_los]
  }

  measure: average_los {
    label: "Average Length of Stay"
    type: average
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
    drill_fields: [organization_id, average_los]
  }

  measure: min_los {
    group_label: "LOS Statistics"
    label: "Min Length of Stay"
    type: min
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: max_los {
    group_label: "LOS Statistics"
    label: "Max Length of Stay"
    type: max
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: 25_los {
    group_label: "LOS Statistics"
    label: "25th Percentile Length of Stay"
    type: percentile
    percentile: 25
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: 75_los {
    group_label: "LOS Statistics"
    label: "75th Percentile Length of Stay"
    type: percentile
    percentile: 75
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }


  measure: med_los {
    group_label: "LOS Statistics"
    label: "Median Length of Stay"
    type: median
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: count_patients {
    label: "Number of Patients"
    type: count_distinct
    sql: ${patient_id} ;;
    drill_fields: [patient_id, patient.gender, patient.age, patient.los]
  }

  measure: repeat_patients {
    label: "Percent of Repeat Patients"
    type: number
    value_format_name: percent_2
    sql: 1.0*(${count}-${count_patients})/nullif(${count},0) ;;
  }
}

#########  Unnested Arrays  #########

### arrays with nested JSON ###
view: encounter__hospitalization__discharge_disposition__coding {
  label: "Encounter"

  dimension: code {
    label: "Discharge Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: is_discharged {
    type: yesno
    sql: ${code} is not null ;;
  }

  dimension: display {
    label: "Discharge Disposition"
    type: string
    sql: ${TABLE}.display ;;
    link: {
      label: "Look up on NUBC"
      icon_url: "http://www.healthforum.com/images/billing-coding/nubc-logo.png"
      url: "{{ encounter.system._value }}"
    }
  }

  dimension: system {
    hidden: yes
    group_label: "Discharge Disposition"
    type: string
    sql: ${TABLE}.system ;;
  }

}

view: encounter__participant {
  label: "Encounter"
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${encounter.id},${practitionerId});;
  }

  ### individual fields ###
  dimension: individual {
    hidden: yes
    sql: ${TABLE}.individual ;;
  }

  dimension: practitionerId {
    hidden: no
    label: " Practitioner ID"
    sql: ${individual}.practitionerId ;;
  }

  measure: number_of_participants {
    type: count
    label: "Number of Practicioners"
  }
}

view: encounter__type {
  label: "Encounter"
  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

  dimension: text {
    hidden: yes
    group_label: "Type"
    type: string
    sql: ${TABLE}.text ;;
  }
}

#nested array inside encounter.type
view: encounter__type__coding {
  label: "Encounter"
  dimension: code {
    label: "Type Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    label: "Type"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    hidden: yes
    type: string
    sql: ${TABLE}.system ;;
  }

}

view: encounter__reason {
  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }
}

#nested array inside encounter.reason
view: encounter__reason__coding {
  label: "Encounter"
  dimension: code {
    label: "Reason Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    label: "Reason"
    type: string
    sql: ${TABLE}.display ;;
    link: {
      label: "Look up on Snomed"
      icon_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP9Q4u6D3vfBt1K_VVcso-bjl6hRAhOEBAF0kLE_haQDD-f0-7&s"
      url: "{{ encounter.system._value }}"
    }
  }

  dimension: system {
    hidden: yes
    type: string
    sql: ${TABLE}.system ;;
  }

}

### arrays without nested fields ###
view: encounter__meta__profile {
  label: "Encounter"

  dimension: profile {
    hidden: yes
    label: " Profile"
    sql: ${TABLE} ;;
  }
}
