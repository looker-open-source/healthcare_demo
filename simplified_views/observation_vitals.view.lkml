view: observation_vitals {
  sql_table_name: healthcare_demo_live.observation_vitals ;;
  # sql_table_name: ${observation_vitals_original_fact_table.SQL_TABLE_NAME} ;;

  dimension: primary_key {
    hidden: yes
    sql: CONCAT(${observation_id},${type}) ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category_code {
    type: string
    sql: ${TABLE}.category_code ;;
  }

  dimension: encounter_id {
    type: string
    sql: ${TABLE}.encounter_id ;;
  }

  dimension_group: issued {
    type: time
    timeframes: [
      time,
      raw,
      time_of_day,
      hour,
      date,
      week,
      month,
      year,
      hour_of_day,
      day_of_week
    ]
    sql: ${TABLE}.issued ;;
  }

  dimension: observation_id {
    type: string
    sql: ${TABLE}.observation_id ;;
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

  dimension: device_id {
    label: "Device"
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_manufacturer {
    type: string
    sql: ${TABLE}.device_manufacturer ;;
    drill_fields: [device_id]
    action: {
      label: "Text Sales Rep for Support"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.zappier.com"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Phone Number"
        required: yes
        default: "703-555-8240"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hi Ted - We had a lot of issues with your {{ value }} device. Please text me back ASAP."
      }
    }
    action: {
      label: "Create Support Ticket"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.servicenow.com"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        type: select
        name: "Team"
        option: {
          name: "Device Support"
        }
        option: {
          name: "Training Support"
        }
        option: {
          name: "Other"
        }
        required: yes
        default: "Device Support"
      }
      form_param: {
        type: select
        name: "Priority"
        option: {
          name: "P1 - High"
        }
        option: {
          name: "P2 - Medium"
        }
        option: {
          name: "P3 - Low"
        }
        required: yes
        default: "P1 - High"
      }
      form_param: {
        name: "Ticket Description"
        type: textarea
        required: yes
        default:
        "Hi IT team - We had a lot of issues with the {{ value }} device. It was showing errors."
      }
    }
  }

  dimension: quantity {
    label: "Measurement Value"
    type: number
    sql: ${TABLE}.quantity ;;
    value_format_name: decimal_2
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: system_management_tool {
    type: string
    sql: ${TABLE}.system_management_tool ;;
    drill_fields: [organization.name]
  }

  dimension: type {
    label: "Vital Type"
    type: string
    sql: ${TABLE}.type ;;
    link: {
      label: "Vitals Deep Dive"
      url: "/dashboards/277?Vital%20Type={{ value | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    drill_fields: [device_id, device_manufacturer, system_management_tool]
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: measurement_standard_deviation {
    group_label: "Standard Deviations from Mean"
    label: "Standard Deviations from Mean"
    type: number
    sql: cast(((${quantity} - ${vital_fact.average})/${vital_fact.standard_deviation}) as numeric) ;;
    value_format_name: decimal_2
  }

  dimension: measurement_standard_deviation_rounded {
    group_label: "Standard Deviations from Mean"
    label: "Standard Deviations from Mean (Rounded)"
    type: number
    sql: round(round(${measurement_standard_deviation}/25,2)*25,2) ;;
    value_format_name: decimal_2
  }

  dimension: measurement_standard_deviation_rounded_capped {
    group_label: "Standard Deviations from Mean"
    label: "Standard Deviations from Mean (Rounded) (Capped)"
    type: number
    sql:
        case
          when ${measurement_standard_deviation_rounded} > 5 THEN 5
          when ${measurement_standard_deviation_rounded} < -5 THEN -5
          else ${measurement_standard_deviation_rounded}
        end ;;
    value_format_name: decimal_2
  }

  dimension: absolute_standard_deviation {
    group_label: "Standard Deviations from Mean"
    label: "Standard Deviations from Mean (Absolute Value)"
    type: number
    sql: abs(${measurement_standard_deviation}) ;;
    value_format_name: decimal_2
  }

  dimension: measurement_standard_deviation_tiers {
    group_label: "Standard Deviations from Mean"
    label: "Standard Deviations from Mean (Tiers)"
    type: tier
    tiers: [-4,-3,-2,-1,0,1,2,3,4]
    sql: ${measurement_standard_deviation} ;;
    style: interval
  }

  dimension: absolute_standard_deviation_tiers {
    group_label: "Standard Deviations from Mean"
    label: "Standard Deviations from Mean (Tiers) (Absolute Value)"
    type: tier
    tiers: [0,1,2,3,4]
    sql: ${absolute_standard_deviation} ;;
    style: interval
  }

  parameter: anomaly {
    type: number
    default_value: "4"
  }

  dimension: is_over_anomaly {
    type: yesno
    sql: ${absolute_standard_deviation} > {% parameter anomaly %} ;;
  }

  measure: average_measurement_standard_deviation {
    group_label: "Standard Deviations from Mean"
    label: "Average Standard Deviations from Mean"
    type: average
    sql: ${absolute_standard_deviation} ;;
    value_format_name: decimal_2
    drill_fields: [drill*]
  }

  measure: average_absolute_standard_deviation {
    group_label: "Standard Deviations from Mean"
    label: "Average Standard Deviations from Mean (Absolute Value)"
    type: average
    sql: ${absolute_standard_deviation} ;;
    value_format_name: decimal_2
    drill_fields: [drill*]
  }

  measure: count_anomalies {
    type: count
    filters: {
      field: is_over_anomaly
      value: "Yes"
    }
    drill_fields: [drill*]
  }

  measure: percent_anomalies {
    type: number
    sql: 1.0*${count_anomalies}/nullif(${count},0) ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: count_devices {
    type: count_distinct
    sql: ${device_id} ;;
    drill_fields: [drill*]
  }

  measure: average_quantity {
    type: average
    sql: ${quantity} ;;
    drill_fields: [drill*]
  }

  measure: min_quantity {
    hidden: yes
    group_label: "Quantity Stats"
    type: min
    sql: ${quantity} ;;
    drill_fields: [drill*]
  }

  measure: max_quantity {
    hidden: yes
    group_label: "Quantity Stats"
    type: max
    sql: ${quantity} ;;
    drill_fields: [drill*]
  }

  measure: median_quantity {
    hidden: yes
    group_label: "Quantity Stats"
    type: median
    sql: ${quantity} ;;
    drill_fields: [drill*]
  }

  measure: 25th_percentile {
    hidden: yes
    group_label: "Quantity Stats"
    type: percentile
    percentile: 25
    sql: ${quantity} ;;
    drill_fields: [drill*]
  }

  measure: 75th_percentile {
    hidden: yes
    group_label: "Quantity Stats"
    type: percentile
    percentile: 75
    sql: ${quantity} ;;
    drill_fields: [drill*]
  }

  measure: standard_deviation {
    hidden: yes
    group_label: "Quantity Stats"
    type: number
    sql: STDDEV(${quantity}) ;;
    drill_fields: [drill*]
  }

  measure: count {
    label: "Number of Observations"
    type: count_distinct
    sql: ${observation_id} ;;
    drill_fields: [drill*]
  }

  measure: count_measurements {
    label: "Number of Measurements"
    type: count_distinct
    sql: ${primary_key} ;;
    drill_fields: [drill*]
  }

  set: drill {
    fields: [
      encounter_id,
      issued_date,
      # organization.name,
      practitioner.name,
      quantity,
      vital_fact.average,
      vital_fact.sd,
      measurement_standard_deviation
    ]
  }
}

view: observation_count_by_vital {
  derived_table: {
    explore_source: observation_vitals {
      bind_all_filters: yes
      column: type {}
      column: count {}
    }
  }
  dimension: type {
    hidden: yes
    primary_key: yes
  }
  dimension: count {
    hidden: yes
    type: number
  }
  measure: total_count {
    hidden: yes
    type: sum
    sql: ${count} ;;
  }
  measure: percent_of_total_by_vital_type {
    type: number
    sql: 1.0*${observation_vitals.count} / nullif(${total_count},0) ;;
    value_format_name: percent_1
  }
}
