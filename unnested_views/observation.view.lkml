#########  Original Table  #########
# unnested arrays are included as view with their own dimensions below

view: observation {
  sql_table_name: lookerdata.healthcare_demo_live.observation ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: issued {
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      day_of_week,
      time,
      time_of_day,
      hour_of_day
    ]
    sql: ${TABLE}.issued ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    hidden: yes
    sql: ${TABLE}.subject ;;
  }

  dimension: subject__patient_id {
    label: "  Patient ID"
    sql: ${subject}.patientId ;;
  }

  dimension: _quantity {
    type: number
    sql: COALESCE(${observation__component.value__quantity__value},${value__quantity__value}) ;;
  }

  dimension: _unit {
    sql: COALESCE(${observation__component.value__quantity__unit},${value__quantity__unit}) ;;
  }

  dimension: _type {
    description: "Either the type of observation or the type of observation of component, if applicable (i.e. Systolic Blood Pressure)"
    sql: COALESCE(${observation__component__code__coding.display},${text}) ;;
  }

#   dimension: _system {
#     hidden: yes
#     sql: COALESCE(${observation__component.system}.${value__quantity__unit}) ;;
#   }


  #########  JSON  dimensions  #########


  #### code fields  ####

  dimension: code {
    hidden: yes
    sql: ${TABLE}.code ;;
  }

  dimension: text {
    hidden: yes
    label: "Type"
    sql: ${code}.text ;;
  }

  #array unnested below
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
    label: "Encounter ID"
    sql: ${context}.encounterId ;;
  }

  #### effective fields  ####

  dimension: effective {
    hidden: yes
    sql: ${TABLE}.effective ;;
  }

  dimension_group: effective {
    hidden: yes
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      day_of_week,
      time,
      time_of_day,
      hour_of_day
    ]
#     sql: CAST(PARSE_DATETIME('%Y-%m-%dT%H:%M:%S+00:00', ${effective}.dateTime) as TIMESTAMP) ;;
    sql: ${effective}.dateTime ;;
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

  #### value fields  ####

  dimension: value {
    hidden: yes
    sql: ${TABLE}.value ;;
  }

  dimension: codeable_concept {
    hidden: yes
    sql: ${value}.codeableConcept ;;
  }

  dimension: value__string {
    hidden: yes
    sql: ${value}.string ;;
  }

  dimension: value__quantity {
    group_label: "Quantity"
    hidden: yes
    sql: ${value}.quantity ;;
  }

  dimension: value__quantity__code {
    hidden: yes
    group_label: "Quantity"
    sql: ${value__quantity}.code ;;
  }

  dimension: value__quantity__unit {
    hidden: yes
    group_label: "Quantity"
    sql: ${value__quantity}.unit ;;
  }

  dimension: value__quantity__system {
    hidden: yes
    group_label: "Quantity"
    sql: ${value__quantity}.system ;;
  }

  dimension: value__quantity__value {
    hidden: yes
    group_label: "Quantity"
    sql: ${value__quantity}.value ;;
  }


  #########  Array Dimensions Unnested Below  #########

  dimension: category {
    hidden: yes
    sql: ${TABLE}.category ;;
  }

  dimension: component {
    hidden: yes
    sql: ${TABLE}.component ;;
  }

  #########  Measures  #########

  measure: count {
    label: "Number of Observations"
    type: count
    drill_fields: [id]
  }

  measure: average_value {
    type: average
    sql: ${_quantity} ;;
  }

  measure: min_value {
    group_label: "Value Stats"
    type: min
    sql: ${_quantity} ;;
  }

  measure: max_value {
    group_label: "Value Stats"
    type: max
    sql: ${_quantity} ;;
  }

  measure: median_value {
    group_label: "Value Stats"
    type: median
    sql: ${_quantity} ;;
  }

  measure: 25th_percentile_value {
    group_label: "Value Stats"

    type: percentile
    percentile: 25
  }

  measure: 75th_percentile_value {
    group_label: "Value Stats"
    type: percentile
    percentile: 75
  }
}

#########  Unnested Arrays  #########

### arrays with nested JSON ###
view: observation__category {
  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

}

#array unnested from category
view: observation__category__coding {
  label: "Observation"
  dimension: code {
    label: "Category Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    label: "Category"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    hidden: yes
    type: string
    sql: ${TABLE}.system ;;
  }

}

view: observation__code__coding {
  label: "Observation"

  dimension: code {
    label: "Observation Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    label: "Observation Type"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    hidden: yes
    group_label: "Code"
    type: string
    sql: ${TABLE}.system ;;
  }
}

view: observation__component {
  label: "Observation"

  # dimension: component__id {
  #   sql: ${TABLE}.id ;;
  # }


  dimension: code {
    hidden: yes
    sql: ${TABLE}.code ;;
  }

  #array unnested below
  dimension: code__coding {
    hidden: yes
    sql: ${code}.coding ;;
  }

  dimension: component__display {
    hidden: yes
    sql: ${code}.display ;;
  }

  dimension: component__system {
    hidden: yes
    sql: ${code}.system ;;
  }

  dimension: value {
    hidden: yes
    sql: ${TABLE}.value ;;
  }

  dimension: value__quantity {
    hidden: yes
    sql: ${value}.quantity ;;
  }

  dimension: value__quantity__unit {
    hidden: yes
    label: "Quantity Unit"
    group_label: "Component"
    sql: ${value__quantity}.unit ;;
  }

  dimension: value__quantity__system {
    hidden: yes
    group_label: "Component"
    sql: ${value__quantity}.system ;;
  }

  dimension: value__quantity__value {
    hidden: yes
    group_label: "Component"
    label: "Quantity"
    sql: ${value__quantity}.value ;;
  }


}

#array unnested from component.code
view: observation__component__code__coding {
  label: "Observation"

  dimension: code {
    hidden: yes
    group_label: "Component"
    label: " Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    hidden: yes
    group_label: "Component"
    description: "The type of component in the observation"
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

### arrays without nested fields ###
view: observation__meta__profile {
  label: "Observation"

  dimension: profile {
    hidden: yes
    label: " Profile"
    sql: ${TABLE} ;;
  }
}
