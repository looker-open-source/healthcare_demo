- dashboard: cohort_lookup
  title: Cohort Lookup
  layout: newspaper
  elements:
  - title: Potential Candidates
    name: Potential Candidates
    model: data_quality_validation
    explore: condition_extended
    type: single_value
    fields: [encounter.count_patients]
    limit: 500
    column_limit: 50
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: By Age Group
    name: By Age Group
    model: data_quality_validation
    explore: condition_extended
    type: looker_column
    fields: [patient.count, patient.age_tier]
    fill_fields: [patient.age_tier]
    sorts: [patient.age_tier]
    limit: 500
    column_limit: 50
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Demographics
    name: Demographics
    model: data_quality_validation
    explore: condition_extended
    type: looker_donut_multiples
    fields: [patient.count, patient.us_core_birthsex, patient.us_core_race]
    pivots: [patient.us_core_race]
    sorts: [patient.count desc 0, patient.us_core_birthsex, patient.us_core_race]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    series_types: {}
    row: 0
    col: 16
    width: 8
    height: 6
