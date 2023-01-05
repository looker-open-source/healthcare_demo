#########  Original Table  #########
# unnested arrays are included as view with their own dimensions below

view: organization {
  sql_table_name: lookerdata.healthcare_demo_data.Organization ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    label: "Hospital"
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Hospital Deep Dive"
      url: "/dashboards/275?Hospital={{ value | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    drill_fields: [practitioner.name, observation_vitals.type]
    action: {
      label: "Launch Investigation on Hospital"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Launch Investigation on Hospital"
      }
      form_param: {
        name: "To Mailing List"
        required: yes
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hi investigator -

        Given the high number of data entry errors in {{ value }}, we are planning to launch an investigation.

        Best,
        "
      }
    }
  }

  #########  JSON  dimensions  #########

  dimension: meta {
    hidden: yes
    sql: ${TABLE}.meta ;;
  }

  dimension: meta__profile {
    hidden: yes
    sql: ${meta}.profile ;;
  }


  #########  Array  dimensions  #########

  dimension: telecom {
    label: "Phone"
    type: string
    sql: ${TABLE}.telecom[Offset(0)].value ;;
  }

  dimension: address {
    hidden: yes
    sql: ${TABLE}.address ;;
  }

  dimension: identifier {
    hidden: yes
    sql: ${TABLE}.identifier ;;
  }

  dimension: type {
    hidden: yes
    sql: ${TABLE}.type ;;
  }

  #########  Measures  #########

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

#########  Unnested Arrays  #########

### arrays with nested JSON ###
view: organization__address {
  label: "Organization"
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

view: organization__identifier {
  label: "Organization"
  dimension: system {
    group_label: "Identifier"
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: value {
    group_label: "Identifier"
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: organization__type {
  label: "Organization"
  dimension: text {
    label: "Type"
    type: string
    sql: ${TABLE}.text ;;
  }
}

### arrays without nested fields ###
view: organization__meta__profile {
  label: "Organization"

  dimension: profile {
    label: " Profile"
    sql: ${TABLE} ;;
  }
}
