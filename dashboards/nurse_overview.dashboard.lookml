- dashboard: nurse_deep_dive
  title: Nurse Deep Dive
  layout: newspaper
  elements:
  - title: Nurse
    name: Nurse
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [practitioner.name]
    limit: 500
    series_types: {}
    listen:
      Nurse: practitioner.name
    row: 0
    col: 0
    width: 5
    height: 3
  - title: Nurse Details
    name: Nurse Details
    model: healthcare
    explore: observation_vitals
    type: looker_single_record
    fields: [practitioner.name, practitioner.id, practitioner.gender, practitioner.active,
      organization.name, organization.id, organization.telecom]
    sorts: [practitioner.name]
    limit: 500
    series_types: {}
    listen:
      Nurse: practitioner.name
    row: 3
    col: 0
    width: 5
    height: 5
  - title: Largest Anomalies
    name: Largest Anomalies
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [patient.ssn_hashed, observation_vitals.issued_date, observation_vitals.type,
      observation_vitals.quantity, observation_vitals.measurement_standard_deviation,
      observation_vitals.absolute_standard_deviation]
    filters:
      observation_vitals.is_over_anomaly: 'Yes'
    sorts: [observation_vitals.absolute_standard_deviation desc]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      observation_vitals.quantity: Actual
      observation_vitals.measurement_standard_deviation: St. Dev from Mean
    series_cell_visualizations:
      observation_vitals.measurement_standard_deviation:
        is_active: false
        palette:
          palette_id: 4a43f4c4-6f6d-fb33-1244-806e5a71c84e
          collection_id: brightview
          custom_colors:
          - green
          - white
          - red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [observation_vitals.absolute_standard_deviation]
    listen:
      Nurse: practitioner.name
    row: 0
    col: 5
    width: 9
    height: 8
  - title: Vital Distribution
    name: Vital Distribution
    model: healthcare
    explore: observation_vitals
    type: looker_area
    fields: [observation_vitals.type, observation_count_by_vital.percent_of_total_by_vital_type,
      observation_vitals.measurement_standard_deviation_rounded_capped]
    pivots: [observation_vitals.type]
    filters:
      observation_vitals.issued_year: 1 years ago for 1 years
      observation_vitals.anomaly: '4'
    sorts: [observation_vitals.type 0, observation_vitals.measurement_standard_deviation_rounded_capped]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: brightview
      palette_id: brightview-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Height - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Height}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Mass Index - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Mass Index}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Weight - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Weight}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Diastolic Blood Pressure - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Diastolic Blood Pressure}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Oral temperature - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Oral temperature}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Systolic Blood Pressure - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Systolic Blood Pressure}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: linear
    listen:
      Nurse: practitioner.name
    row: 0
    col: 14
    width: 10
    height: 8
  filters:
  - name: Nurse
    title: Nurse
    type: field_filter
    default_value: Maryjo Osinski
    allow_multiple_values: true
    required: false
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: practitioner.name
