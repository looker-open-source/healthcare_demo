- dashboard: vitals_deep_dive
  title: Vitals Deep Dive
  layout: newspaper
  elements:
  - title: Hospital Breakdown
    name: Hospital Breakdown
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.percent_anomalies,
      observation_vitals.average_absolute_standard_deviation, organization.name]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
      observation_vitals.anomaly: '4'
      observation_vitals.issued_year: 1 years ago for 1 years
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
      Vital Type: observation_vitals.type
    row: 4
    col: 0
    width: 12
    height: 8
  - title: Manufacturer
    name: Manufacturer
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.percent_anomalies,
      observation_vitals.average_absolute_standard_deviation, observation_vitals.device_manufacturer]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
      observation_vitals.anomaly: '4'
      observation_vitals.issued_year: 1 years ago for 1 years
    sorts: [observation_vitals.percent_anomalies desc]
    limit: 15
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    column_order: ["$$$_row_numbers_$$$", observation_vitals.device_manufacturer,
      observation_vitals.percent_anomalies, observation_vitals.count_anomalies, observation_vitals.count,
      observation_vitals.average_absolute_standard_deviation]
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
      Vital Type: observation_vitals.type
    row: 0
    col: 12
    width: 12
    height: 4
  - title: Anomalies Over Time
    name: Anomalies Over Time
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.percent_anomalies, observation_vitals.issued_day_of_week,
      observation_vitals.issued_hour_of_day]
    pivots: [observation_vitals.issued_day_of_week]
    fill_fields: [observation_vitals.issued_day_of_week, observation_vitals.issued_hour_of_day]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
      observation_vitals.anomaly: '4'
      observation_vitals.issued_year: 1 years ago for 1 years
    sorts: [observation_vitals.issued_day_of_week 0, observation_vitals.issued_hour_of_day
        0]
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
      observation_vitals.percent_anomalies: "% Anomaly"
      observation_vitals.issued_hour_of_day: Hour
      observation_vitals.issued_day_of_week: Day of Week
    series_column_widths:
      observation_vitals.issued_hour_of_day: 100
    series_cell_visualizations:
      observation_vitals.count_anomalies:
        is_active: false
      observation_vitals.percent_anomalies:
        is_active: false
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: [observation_vitals.percent_anomalies]}]
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
      Vital Type: observation_vitals.type
    row: 4
    col: 12
    width: 12
    height: 8
  - title: "# Patients"
    name: "# Patients"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, patient.count]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
      observation_vitals.anomaly: '4'
    sorts: [observation_vitals.issued_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: difff, label: difff, expression: "(${patient.count}-${calculation_1})/${patient.count}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: calculation_1, label: Calculation
          1, expression: 'offset(${patient.count},1)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
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
      Vital Type: observation_vitals.type
    row: 0
    col: 0
    width: 4
    height: 4
  - title: "# Observations"
    name: "# Observations"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.count]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
      observation_vitals.anomaly: '4'
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
      Vital Type: observation_vitals.type
    row: 0
    col: 4
    width: 4
    height: 4
  - title: "% Anomalies"
    name: "% Anomalies"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.percent_anomalies]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
      observation_vitals.anomaly: '4'
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
      Vital Type: observation_vitals.type
    row: 0
    col: 8
    width: 4
    height: 4
  filters:
  - name: Vital Type
    title: Vital Type
    type: field_filter
    default_value: Body Weight
    allow_multiple_values: true
    required: false
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: observation_vitals.type
