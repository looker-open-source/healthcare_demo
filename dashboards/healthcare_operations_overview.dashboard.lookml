- dashboard: healthcare_operations_overview
  title: Healthcare Operations Overview
  layout: newspaper
  elements:
  - title: ED Wait Time
    name: ED Wait Time
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.average_los]
    filters:
      encounter.is_inpatient: 'Yes'
    sorts: [encounter.average_los desc]
    limit: 500
    dynamic_fields: [{table_calculation: average_los_hours, label: Average LOS (Hours),
        expression: "${encounter.average_los}/60", value_format: !!null '', value_format_name: decimal_2,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Average Length of Stay (Hours)
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [encounter.average_los]
    note_state: collapsed
    note_display: hover
    note_text: Length of Stay is defined as the difference in time since the patient
      was admitted into the hospital, until they were formally discharged by a nurse
    listen:
      Hospital ID: organization.id
    row: 7
    col: 6
    width: 6
    height: 4
  - title: Number of Patients
    name: Number of Patients
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient.count]
    filters:
      encounter.period__end_date: 1 years
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Total Patients Treated - This Year
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Hospital ID: organization.id
    row: 3
    col: 12
    width: 6
    height: 4
  - title: Number of Encounters
    name: Number of Encounters
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count, encounter.period__start_month]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.is_inpatient: 'Yes'
    sorts: [encounter.period__start_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: prior_year_month, label: Prior Year Month,
        expression: 'offset(${encounter.count},12)', value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Inpatient Admissions - This Month
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Hospital ID: organization.id
    row: 3
    col: 0
    width: 6
    height: 4
  - name: "<span class='fa fa-gears'> Operations Overview</span>"
    type: text
    title_text: "<span class='fa fa-gears'> Operations Overview</span>"
    subtitle_text: ''
    body_text: "**Recommended Action** Drill into high level metrics to determine\
      \ where we can improve our KPIs and follow up with key stakeholders to plan\
      \ appropriately"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Visits by Type Over Time
    name: Visits by Type Over Time
    model: healthcare
    explore: encounter_extended
    type: looker_line
    fields: [encounter.period__start_month_name, encounter.count, encounter.code_name]
    pivots: [encounter.code_name]
    fill_fields: [encounter.period__start_month_name]
    filters:
      encounter.period__start_year: 1 years ago for 1 years
    sorts: [encounter.period__start_month_name, encounter.code_name 0]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital ID: organization.id
    row: 11
    col: 0
    width: 14
    height: 7
  - name: "<span class='fa fa-users'>  Patient Demographics & Conditions</span>"
    type: text
    title_text: "<span class='fa fa-users'>  Patient Demographics & Conditions</span>"
    subtitle_text: ''
    body_text: "**Recommended Action** Drill into Condition Lookup dashboard to understand\
      \ more information about, or link out to the cohort dashboard to build a cohort\
      \ beginning with the condition code"
    row: 18
    col: 0
    width: 24
    height: 3
  - title: Encounters by Age
    name: Encounters by Age
    model: healthcare
    explore: encounter_extended
    type: looker_donut_multiples
    fields: [encounter.count, encounter.code_name, patient.age_tier]
    pivots: [patient.age_tier]
    fill_fields: [patient.age_tier]
    filters:
      encounter.period__start_week: 1 years ago for 1 years
    sorts: [encounter.count desc 0, encounter.code_name, patient.age_tier]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    series_colors: {}
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
    listen:
      Hospital ID: organization.id
    row: 21
    col: 0
    width: 12
    height: 7
  - title: LOS by Encounter Type
    name: LOS by Encounter Type
    model: healthcare
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
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.average_los,
            id: encounter.average_los, name: Average Length of Stay}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: encounter.count
    series_types: {}
    hidden_fields: [encounter__type__coding.code]
    defaults_version: 1
    listen:
      Hospital ID: organization.id
    row: 11
    col: 14
    width: 10
    height: 7
  - title: LOS (Hours) Stats
    name: LOS (Hours) Stats
    model: healthcare
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
    listen:
      Hospital ID: organization.id
    row: 3
    col: 18
    width: 6
    height: 8
  - title: Encounters by Top Condition
    name: Encounters by Top Condition
    model: healthcare
    explore: condition_extended
    type: looker_grid
    fields: [condition__code__coding.code, condition__code__coding.display, encounter.count,
      encounter.average_los]
    sorts: [encounter.count desc]
    limit: 20
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
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
      encounter.average_los:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen:
      Hospital ID: organization.id
    row: 28
    col: 12
    width: 12
    height: 11
  - title: Patients by Age & Gender
    name: Patients by Age & Gender
    model: healthcare
    explore: condition_extended
    type: looker_column
    fields: [patient.age_tier, patient.gender, encounter.count_patients]
    pivots: [patient.gender]
    filters:
      patient.age_tier: "-Below 0"
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
    listen:
      Hospital ID: organization.id
    row: 21
    col: 12
    width: 12
    height: 7
  - title: Number of OP Visits
    name: Number of OP Visits
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count, encounter.period__start_month]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.is_inpatient: 'No'
    sorts: [encounter.period__start_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: prior_year_month, label: Prior Year Month,
        expression: 'offset(${encounter.count},1)', value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Outpatient Visits - This Month
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Hospital ID: organization.id
    row: 7
    col: 0
    width: 6
    height: 4
  - title: Avg ED Wait Time
    name: Avg ED Wait Time
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.average_los, encounter.period__start_year]
    fill_fields: [encounter.period__start_year]
    filters:
      encounter.code_name: Emergency Department
      encounter.length_of_stay: "<1000"
    sorts: [encounter.period__start_year desc]
    limit: 500
    dynamic_fields: [{table_calculation: avg_wait_time_prior_year, label: Avg Wait
          Time - Prior Year, expression: 'offset(${encounter.average_los},1)', value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Average ED Wait Time (Mins)
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 79.05, background_color: '',
        font_color: "#3b6d38", color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Hospital ID: organization.id
    row: 7
    col: 12
    width: 6
    height: 4
  - title: 30-Day Readmission Rate
    name: 30-Day Readmission Rate
    model: healthcare
    explore: readmission
    type: single_value
    fields: [readmission.perc_30_day_readmission]
    sorts: [readmission.perc_30_day_readmission desc]
    limit: 500
    dynamic_fields: [{table_calculation: readmission_national_average, label: Readmission
          - National Average, expression: '0.139', value_format: !!null '', value_format_name: percent_1,
        _kind_hint: dimension, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 30-Day Readmission Rate
    conditional_formatting: [{type: greater than, value: 0.139, background_color: '',
        font_color: "#7a131e", color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields:
    defaults_version: 1
    listen: {}
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Readmission Causes
    name: Readmission Causes
    model: healthcare
    explore: readmission
    type: sankey
    fields: [prior_condition__code__coding.display, condition__code__coding.display,
      readmission.count_readmissions]
    filters:
      condition__code__coding.display: "-NULL"
      prior_condition__code__coding.display: "-NULL"
    sorts: [readmission.count_readmissions desc]
    limit: 20
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    color_range: ["#92c2cf", "#0d154f", "#0b3cd4", "#36c1b3", "#4a5ded"]
    label_type: name
    show_null_points: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 30-Day Readmission Rate
    conditional_formatting: [{type: greater than, value: 0.139, background_color: '',
        font_color: "#7a131e", color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    series_types: {}
    listen: {}
    row: 28
    col: 0
    width: 12
    height: 11
  filters:
  - name: Hospital ID
    title: Hospital ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: healthcare
    explore: observation_extended
    listens_to_filters: []
    field: organization.id
