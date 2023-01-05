#########  Original Table  #########
# unnested arrays are included as view with their own dimensions below
view: medication_request {
  sql_table_name: lookerdata.healthcare_demo_live.medicationrequest ;;
  drill_fields: []

  #########  Standard dimensions  #########

  dimension: id {
    label: "  Medication Request ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: authored {
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
    sql: ${TABLE}.authoredOn ;;
  }

  dimension: intent {
    hidden: yes
    type: string
    sql: ${TABLE}.intent ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  #########  JSON  dimensions  #########

  #### context fields  ####

  dimension: context {
    hidden: yes
    sql: ${TABLE}.context ;;
  }

  dimension: context__encounter_id {
    label: "  Encounter ID"
    sql: ${context}.encounterId ;;
  }


  #### medication fields  ####

  dimension: medication {
    hidden: yes
    sql: ${TABLE}.medication ;;
  }

  dimension: medication__codeable_concept {
    hidden: yes
    sql: ${medication}.codeableConcept ;;
  }

  #array field unnested below
  dimension: medication__codeable_concept__coding {
    hidden: yes
    sql: ${medication__codeable_concept}.coding ;;
  }


  #### medication fields  ####

  dimension: meta {
    hidden: yes
    sql: ${TABLE}.meta ;;
  }

  dimension: meta__profile {
    hidden: yes
    sql: ${meta}.profile ;;
  }


  #### requester fields  ####

  dimension: requester {
    hidden: yes
    sql: ${TABLE}.requester ;;
  }

  dimension: requester__agent {
    hidden: yes
    sql: ${requester}.agent ;;
  }

  dimension: requester__agent__practitioner_id {
    label: "Practicioner ID"
    sql: ${requester__agent}.practitionerId ;;
  }

  dimension: requester__on_behalf_of {
    hidden: yes
    sql: ${requester}.onBehalfOf ;;
  }

  dimension: requester__on_behalf_of__organization_id {
    label: "Organization ID"
    sql: ${requester__on_behalf_of}.organizationId ;;
  }


  #### extension fields  ####

  dimension: extension {
    hidden: yes
    sql: ${TABLE}.shr_action_RequestedContext_extension ;;
  }


  dimension: extension__request_intent_extension {
    hidden: yes
    sql: ${extension}.shr_action_RequestIntent_extension ;;
  }

  dimension: extension__request_intent_extension__value {
    hidden: yes
    sql: ${extension__request_intent_extension}.value ;;
  }

  dimension: extension__request_intent_extension__value__code {
    hidden: yes
    label: "Request Intent"
    sql: ${extension__request_intent_extension__value}.code ;;
  }

  dimension: extension__status_extension {
    hidden: yes
    sql: ${extension}.shr_action_Status_extension ;;
  }

  dimension: extension__status_extension__value {
    hidden: yes
    sql: ${extension__status_extension}.value ;;
  }

  dimension: extension__status_extension__value__code {
    hidden: yes
    label: "Request Status"
    sql: ${extension__status_extension__value}.code ;;
  }


  #### subject fields  ####

  dimension: code_extension {
    hidden: yes
    sql: ${TABLE}.shr_base_ActionCode_extension ;;
  }

  dimension: code_extension__value {
    hidden: yes
    sql: ${code_extension}.value ;;
  }

  dimension: code_extension__value__codeable_concept {
    hidden: yes
    sql: ${code_extension__value}.codeableConcept ;;
  }

  #array unnested below
  dimension: code_extension__value__codeable_concept__coding {
    hidden: yes
    sql: ${code_extension__value__codeable_concept}.coding ;;
  }


  #### subject fields  ####

  dimension: subject {
    hidden: yes
    sql: ${TABLE}.subject ;;
  }

  dimension: subject__patientId {
    hidden: yes
    label: "  Patient ID"
    sql: ${subject}.patientId ;;
  }


  #########  Measures  #########

  measure: count {
    label: "Number of Medication Requests"
    type: count
  }
}


#########  Unnested Arrays  #########

### arrays with nested JSON ###
view: medication_request__medication__codeable_concept__coding {
  label: "Medication Request"
  dimension: code {
    label: "Medication Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    label: "Medication Prescribed"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    hidden: yes
    type: string
    sql: ${TABLE}.system ;;
  }
}

view: medication_request__extension__codeable_concept__coding {
  label: "Medication Request"
  dimension: code {
    hidden: yes
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    hidden: yes
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
view: medication_request__meta__profile {
  label: "Medication Request"

  dimension: profile {
    hidden: yes
#     label: " Profile"
    sql: ${TABLE} ;;
  }
}
