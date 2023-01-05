#########  Original Table  #########
# unnested arrays are included as view with their own dimensions below

view: patient {
  sql_table_name: lookerdata.healthcare_demo_data.Patient ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: birth_raw {
    hidden: yes
    type: date_raw
    sql: CAST(PARSE_DATETIME('%Y-%m-%d', ${TABLE}.birthDate) as TIMESTAMP) ;;
  }

  dimension: birth_date {
    hidden: yes
    type: date
    sql: ${birth_raw} ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: age {
    type: duration_year
    sql_end: CURRENT_TIMESTAMP() ;;
    sql_start: ${birth_raw} ;;
  }

  dimension: age_tier {
    sql: ${age} ;;
    type: tier
    style: integer
    tiers: [0, 18, 25, 40, 55, 65]
  }

  #########  JSON  dimensions  #########

  #### birth_place fields  ####

  dimension: birth_place {
    hidden: yes
    sql: ${TABLE}.birthPlace.value.address ;;
  }

  dimension: birth_place__city {
    label: "City"
    group_label: "Birth Place"
    sql: ${birth_place}.city ;;
  }

  dimension: birth_place__state {
    label: "State"
    group_label: "Birth Place"
    map_layer_name: us_states
    sql: ${birth_place}.state ;;
  }

  dimension: birth_place__country {
    label: "Country"
    group_label: "Birth Place"
    map_layer_name: countries
    sql: ${birth_place}.country ;;
  }


  dimension: disability_adjusted_life_years {
    hidden: yes
    type: number
    sql: ${TABLE}.disability_adjusted_life_years.value.decimal;;
  }

  dimension: is_deceased {
    type: yesno
    sql: ${deceased_date} is not null ;;
  }

  dimension_group: deceased {
    type: time
    timeframes: [
      date,
      month,
      year,
      month_name
    ]
    sql: PARSE_DATETIME('%Y-%m-%dT%H:%M:%S+00:00', ${TABLE}.deceased.dateTime) ;;
  }

  dimension: quality_adjusted_life_years {
    hidden: yes
    type: number
    sql: ${TABLE}.quality_adjusted_life_years.value.decimal ;;
  }

  dimension: shr_demographics_social_security_number_extension {
    hidden: yes
    label: "SSN"
    sql: ${TABLE}.shr_demographics_SocialSecurityNumber_extension.value.string ;;
  }

  dimension: us_core_birthsex {
    label: "Birth Sex"
    sql: ${TABLE}.us_core_birthsex.value.code ;;
  }

  dimension: us_core_ethnicity {
    label: "Ethnicity"
    sql: ${TABLE}.us_core_ethnicity.text.value.string ;;
  }

  dimension: us_core_race {
    label: "Race"
    sql: ${TABLE}.us_core_race.text.value.string ;;
  }

  dimension: meta {
    hidden: yes
    sql: ${TABLE}.meta ;;
  }

  dimension: meta__profile {
    hidden: yes
    sql: ${meta}.profile ;;
  }

  #########  Array  dimensions  #########

  dimension: address {
    hidden: yes
    sql: ${TABLE}.address ;;
  }

  dimension: communication {
    hidden: yes
    sql: ${TABLE}.communication ;;
  }

  dimension: identifier {
    hidden: yes
    sql: ${TABLE}.identifier ;;
  }

  dimension: first_name {
    hidden: yes
    sql: regexp_replace(${TABLE}.name[Offset(0)].given[Offset(0)],'[0-9]','') ;;
  }

  dimension: last_name {
    hidden: yes
    sql: regexp_replace(${TABLE}.name[Offset(0)].family,'[0-9]','') ;;
  }

  dimension: name {
    sql: CONCAT(${first_name}, ' ',${last_name}) ;;
    action: {
      label: "Email Follow Up to Patient"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Procedure Followup"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Dear {{ value }},

        We wanted to followup on your recent procedure to see how you are feeling."
      }
    }
  }

  dimension: telecom {
    sql: ${TABLE}.telecom[Offset(0)].value ;;
  }

  dimension: ssn {
    hidden: yes
    type: string
    sql: cast(round(rand() * 100000, 0) as string) ;;
  }

  dimension: ssn_hashed {
    label: "Patient SSN"
    type: string
    description: "Only users with sufficient permissions will see this data"
    sql:
        CASE
          WHEN '{{_user_attributes["can_see_sensitive_data"]}}' = 'yes'
                THEN ${ssn}
                ELSE concat('###-##-',substr(${ssn},1,4))
                --ELSE TO_BASE64(SHA1(${ssn}))
          END ;;
  }

  #########  Measures  #########

  measure: count {
    label: "Number of Patients"
    type: count
    drill_fields: [id, name, ssn_hashed, age]
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

}

#########  Unnested Arrays  #########

### arrays with nested JSON ###
view: patient__address {
  label: "Patient"
  dimension: city {
    group_label: "Address"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: line {
    hidden: yes
    type: string
    sql: ${TABLE}.line ;;
  }

  dimension: postal_code {
    group_label: "Address"
    type: zipcode
    sql: ${TABLE}.postalCode ;;
  }

  dimension: state {
    group_label: "Address"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: patient__communication {
  label: "Patient"
  dimension: language {
    hidden: yes
    sql: ${TABLE}.language ;;
  }

  dimension: language__text {
    label: "Language"
    sql: ${language}.text ;;
  }
}

view: patient__identifier {
  label: "Patient"
  dimension: system {
    group_label: "Identifier"
    hidden: yes
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: value {
    hidden: yes
    group_label: "Identifier"
    type: string
    sql: ${TABLE}.value ;;
  }
}

### arrays without nested fields ###
view: patient__meta__profile {
  label: "Patient"

  dimension: profile {
    hidden: yes
    label: " Profile"
    sql: ${TABLE} ;;
  }
}
