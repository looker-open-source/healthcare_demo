view: practitioner {
  sql_table_name: lookerdata.healthcare_demo_data.Practitioner ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    action: {
      label: "Contact Practitioner"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: ""
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        ""
      }
    }
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  #########  Array  dimensions  #########

  dimension: address {
    hidden: yes
    sql: ${TABLE}.address ;;
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
    label: "Nurse"
    sql: CONCAT(${first_name},' ',${last_name}) ;;
    link: {
      label: "Nurse Deep Dive"
      url: "/dashboards/276?Nurse={{ value | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "WebMd"
      url: "https://doctor.webmd.com/results?so=&ln={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain_url=http://www.webmd.com"
    }
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    link: {
      label: "NPPES Lookup"
      url: "https://npiregistry.cms.hhs.gov/registry/provider-view/1548431174"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.cms.gov"
    }
    drill_fields: [observation_vitals.type]
    action: {
      label: "Nudge Nurse to Focus on Data Entry"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Want to check on data entry"
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
        "Hi {{ value }} -

        We've noticed some errors recently in your data entry of vitals for patients. Please focus on this in the future.

        Best,
        "
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

#########  Unnested Arrays  #########

### arrays with nested JSON ###

view: practitioner__identifier {
  label: "Practitioner"
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

view: practitioner__address {
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
