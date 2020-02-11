- dashboard: healthcare_operations_overview
  title: Healthcare Operations Overview
  layout: newspaper
  elements:
  - title: Average Length of Stay (min)
    name: Average Length of Stay (min)
    model: data_quality_validation
    explore: encounter_extended
    type: single_value
    fields: [encounter.average_los]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 4
    col: 5
    width: 5
    height: 3
  - title: Number of Patients
    name: Number of Patients
    model: data_quality_validation
    explore: encounter_extended
    type: single_value
    fields: [patient.count]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 4
    col: 10
    width: 5
    height: 3
  - title: Number of Encounters
    name: Number of Encounters
    model: data_quality_validation
    explore: encounter_extended
    type: single_value
    fields: [encounter.count]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 4
    col: 0
    width: 5
    height: 3
  - name: "<span class='fa fa-gears'> Operations Overview</span>"
    type: text
    title_text: "<span class='fa fa-gears'> Operations Overview</span>"
    subtitle_text: How can we improve patient length of stay?
    body_text: "**Recommended Action** Drill into areas with high length of stay and\
      \ follow up with departmental operation managers to set up OKRs"
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Length of Stay - YoY
    name: Length of Stay - YoY
    model: data_quality_validation
    explore: encounter_extended
    type: looker_line
    fields: [encounter.average_los, encounter.period__start_year, encounter.period__start_month_name]
    pivots: [encounter.period__start_year]
    fill_fields: [encounter.period__start_year, encounter.period__start_month_name]
    filters:
      encounter.period__start_year: 5 years ago for 5 years
    sorts: [encounter.period__start_year desc 0, encounter.average_los desc 0]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.average_los,
            id: 2019 - encounter.average_los, name: '2019'}, {axisId: encounter.average_los,
            id: 2018 - encounter.average_los, name: '2018'}, {axisId: encounter.average_los,
            id: 2017 - encounter.average_los, name: '2017'}, {axisId: encounter.average_los,
            id: 2016 - encounter.average_los, name: '2016'}, {axisId: encounter.average_los,
            id: 2015 - encounter.average_los, name: '2015'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    row: 7
    col: 0
    width: 15
    height: 9
  - name: "<span class='fa fa-users'>  Patient Demographics & Conditions</span>"
    type: text
    title_text: "<span class='fa fa-users'>  Patient Demographics & Conditions</span>"
    subtitle_text: What are our patients and what are they coming in for?
    body_text: "**Recommended Action** Drill into Condition Code to understand medications\
      \ associated with the condition, or link out to the cohort dashboard to build\
      \ a cohort beginning with the code"
    row: 16
    col: 0
    width: 24
    height: 4
  - title: Inpatient Ecounters
    name: Inpatient Ecounters
    model: data_quality_validation
    explore: encounter_extended
    type: looker_donut_multiples
    fields: [encounter.count, encounter.is_inpatient]
    pivots: [encounter.is_inpatient]
    fill_fields: [encounter.is_inpatient]
    filters:
      encounter.period__start_week: 1 years ago for 1 years
    sorts: [encounter.count desc 0, encounter.is_inpatient]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    series_labels:
      'No': Outpatient
      'Yes': Inpatient
      Yes - encounter.count: Inpatient
      No - encounter.count: Outptient
    value_labels: labels
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - encounter.count,
            id: No - encounter.count, name: 'No'}, {axisId: Yes - encounter.count,
            id: Yes - encounter.count, name: 'Yes'}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 15
    width: 5
    height: 6
  - title: LOS by Encounter Type
    name: LOS by Encounter Type
    model: data_quality_validation
    explore: encounter_extended
    type: looker_scatter
    fields: [encounter__type__coding.display, encounter.count, encounter.average_los,
      encounter__type__coding.code]
    filters:
      encounter.period__start_date: 1 years ago for 1 years
    sorts: [encounter__type__coding.display]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.average_los,
            id: encounter.average_los, name: Average Length of Stay}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: encounter.count
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    hidden_fields: [encounter__type__coding.display]
    listen: {}
    row: 10
    col: 15
    width: 9
    height: 6
  - title: LOS Stats
    name: LOS Stats
    model: data_quality_validation
    explore: encounter_extended
    type: looker_column
    fields: [encounter.25_los, encounter.med_los, encounter.75_los]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.med_los, id: encounter.med_los,
            name: Median Length of Stay}, {axisId: encounter.25_los, id: encounter.25_los,
            name: 25th Percentile Length of Stay}, {axisId: encounter.75_los, id: encounter.75_los,
            name: 75th Percentile Length of Stay}], showLabels: false, showValues: false,
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    series_labels:
      encounter.med_los: Median
      encounter.25_los: 25th Percentile
      encounter.75_los: 75th Percentile
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 20
    width: 4
    height: 6
  - title: Encounters by Top Condition
    name: Encounters by Top Condition
    model: data_quality_validation
    explore: condition_extended
    type: looker_grid
    fields: [condition__code__coding.code, condition__code__coding.display, encounter.count,
      encounter.repeat_patients]
    sorts: [encounter.count desc]
    limit: 20
    query_timezone: America/Los_Angeles
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      encounter.count:
        is_active: true
        palette:
          palette_id: 695e2dda-14bd-04b2-d088-035a014b4f8a
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
      encounter.repeat_patients:
        is_active: true
        palette:
          palette_id: ef667eaa-c38a-1877-2455-3411c6229e43
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 20
    col: 11
    width: 13
    height: 10
  - title: Resolved Conditions by Encounter Date
    name: Resolved Conditions by Encounter Date
    model: data_quality_validation
    explore: condition_extended
    type: looker_column
    fields: [condition.clinical_status, encounter.count, encounter.period__start_week]
    pivots: [condition.clinical_status]
    filters:
      encounter.period__start_date: 1 years ago for 1 years
    sorts: [condition.clinical_status, encounter.period__start_week desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: active - encounter.count,
            id: active - encounter.count, name: active}, {axisId: resolved - encounter.count,
            id: resolved - encounter.count, name: resolved}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 20
    col: 0
    width: 11
    height: 5
  - title: LOS by Patient Age & Gender
    name: LOS by Patient Age & Gender
    model: data_quality_validation
    explore: condition_extended
    type: looker_column
    fields: [patient.age_tier, encounter.average_los, patient.gender]
    pivots: [patient.gender]
    fill_fields: [patient.age_tier]
    sorts: [patient.age_tier, patient.gender]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.average_los,
            id: female - encounter.average_los, name: female}, {axisId: encounter.average_los,
            id: male - encounter.average_los, name: male}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors:
      female - encounter.average_los: "#E9F3D1"
      male - encounter.average_los: "#2693D1"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 25
    col: 0
    width: 11
    height: 5
