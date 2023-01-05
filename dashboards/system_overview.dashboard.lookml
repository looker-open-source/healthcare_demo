- dashboard: system_overview
  title: System Overview
  layout: newspaper
  elements:
  - title: Observation Count
    name: Observation Count
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.count]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
    sorts: [observation_vitals.issued_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: diff, label: diff, expression: "(${observation_vitals.count}-${offset})/${observation_vitals.count}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: offset, label: offset, expression: 'offset(${observation_vitals.count},1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Anomaly (# Stand Dev): observation_vitals.anomaly
    row: 2
    col: 4
    width: 4
    height: 4
  - title: "% Anomalies by Vital Type"
    name: "% Anomalies by Vital Type"
    model: healthcare
    explore: observation_vitals
    type: looker_area
    fields: [observation_vitals.type, observation_vitals.issued_week, observation_vitals.count_anomalies]
    pivots: [observation_vitals.type]
    filters:
      observation_vitals.issued_week: 52 weeks ago for 52 weeks
    sorts: [observation_vitals.type 0, observation_vitals.issued_week desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: brightview
      palette_id: brightview-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.count_measurements,
            id: observation_vitals.count_measurements, name: Number of Measurements}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    point_style: none
    series_colors: {}
    series_labels:
      Body Height - observation_vitals.count_measurements: Height
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    listen:
      Anomaly (# Stand Dev): observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 10
    col: 0
    width: 12
    height: 8
  - title: "% Anomalies"
    name: "% Anomalies"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.percent_anomalies]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
    sorts: [observation_vitals.issued_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: diff, label: diff, expression: "(${observation_vitals.percent_anomalies}-${offer})/${observation_vitals.percent_anomalies}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: offer, label: offer, expression: 'offset(${observation_vitals.percent_anomalies},1)',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Anomaly (# Stand Dev): observation_vitals.anomaly
    row: 2
    col: 8
    width: 4
    height: 4
  - title: Overall Stats by Vital Type
    name: Overall Stats by Vital Type
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.type, observation_vitals.count_anomalies, observation_vitals.count,
      observation_vitals.percent_anomalies, observation_vitals.average_absolute_standard_deviation]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
    sorts: [observation_vitals.percent_anomalies desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    column_order: ["$$$_row_numbers_$$$", observation_vitals.type, observation_vitals.percent_anomalies,
      observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.average_absolute_standard_deviation]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      Body Height - observation_vitals.count_measurements: Height
      observation_vitals.count_anomalies: "# Anomaly"
      observation_vitals.count: "# Observations"
      observation_vitals.percent_anomalies: "% Anomaly"
      observation_vitals.average_absolute_standard_deviation: Avg Stand Dev
    series_cell_visualizations:
      observation_vitals.count_anomalies:
        is_active: false
      observation_vitals.percent_anomalies:
        is_active: true
        palette:
          palette_id: d32f6a1a-d113-ba78-6775-0ecad4ef7cc5
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
      observation_vitals.count:
        is_active: false
      observation_vitals.average_absolute_standard_deviation:
        is_active: true
        palette:
          palette_id: 4b0586d3-ec97-fc32-b271-d22bd99b330e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.count_measurements,
            id: observation_vitals.count_measurements, name: Number of Measurements}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Anomaly (# Stand Dev): observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 6
    col: 0
    width: 12
    height: 4
  - title: 15 Most Concerning Hospitals
    name: 15 Most Concerning Hospitals
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.percent_anomalies,
      observation_vitals.average_absolute_standard_deviation, organization.name]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
    sorts: [observation_vitals.percent_anomalies desc]
    limit: 15
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    column_order: ["$$$_row_numbers_$$$", organization.name, observation_vitals.percent_anomalies,
      observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.average_absolute_standard_deviation]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      Body Height - observation_vitals.count_measurements: Height
    series_cell_visualizations:
      observation_vitals.count_anomalies:
        is_active: false
      observation_vitals.percent_anomalies:
        is_active: true
        palette:
          palette_id: d32f6a1a-d113-ba78-6775-0ecad4ef7cc5
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
      observation_vitals.count:
        is_active: false
      observation_vitals.average_absolute_standard_deviation:
        is_active: true
        palette:
          palette_id: 4b0586d3-ec97-fc32-b271-d22bd99b330e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.count_measurements,
            id: observation_vitals.count_measurements, name: Number of Measurements}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Anomaly (# Stand Dev): observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 2
    col: 12
    width: 12
    height: 8
  - title: Distribution of Values by Vital
    name: Distribution of Values by Vital
    model: healthcare
    explore: observation_vitals
    type: looker_area
    fields: [observation_vitals.type, observation_count_by_vital.percent_of_total_by_vital_type,
      observation_vitals.measurement_standard_deviation_rounded_capped]
    pivots: [observation_vitals.type]
    filters: {}
    sorts: [observation_vitals.type 0, observation_vitals.measurement_standard_deviation_rounded_capped]
    limit: 500
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
      Anomaly (# Stand Dev): observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 10
    col: 12
    width: 12
    height: 8
  - title: "# Patients"
    name: "# Patients"
    model: healthcare
    explore: realtime_observations
    type: single_value
    fields: [realtime_observations.count]
    filters:
      realtime_observations.issued_time: before 0 seconds ago
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    refresh: 5 seconds
    listen: {}
    row: 2
    col: 0
    width: 4
    height: 4
  - name: "<span class='fa fa-gears'> Systems Overview</span>"
    type: text
    title_text: "<span class='fa fa-gears'> Systems Overview</span>"
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Anomaly (# Stand Dev)
    title: Anomaly (# Stand Dev)
    type: field_filter
    default_value: '4'
    allow_multiple_values: true
    required: false
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: observation_vitals.anomaly
  - name: Date
    title: Date
    type: field_filter
    default_value: 1 years ago for 1 years
    allow_multiple_values: true
    required: false
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: observation_vitals.issued_year
