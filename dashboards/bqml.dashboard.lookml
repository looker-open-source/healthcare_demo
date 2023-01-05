- dashboard: data_science__bqml
  title: Data Science - BQML
  layout: newspaper
  elements:
  - title: "% Anomalies by Avg Min in Wait Room"
    name: "% Anomalies by Avg Min in Wait Room"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, claims.average_distance_bene_doctor]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Avg Min in Wait Room
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
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 6
  - title: "% Anomalies by % Patients on Medicare"
    name: "% Anomalies by % Patients on Medicare"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, claims.percent_opioid_claims]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: "% Patients on Medicare"
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
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 0
    width: 6
    height: 6
  - title: "% Anomalies by Patient Volume"
    name: "% Anomalies by Patient Volume"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, events_MED.count_events]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: "# Patients Admitted / Hour"
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
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 6
    width: 6
    height: 6
  - title: "% Anomalies by Patient / Staff"
    name: "% Anomalies by Patient / Staff"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, claims.average_opioid_supply_length]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Patient / Staff
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
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 6
  - name: 1 - Input Variables
    type: text
    title_text: 1 - Input Variables
    row: 0
    col: 0
    width: 24
    height: 2
  - name: 2 - Train the Model
    type: text
    title_text: 2 - Train the Model
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Training Detail
    name: Training Detail
    model: opioid
    explore: machine_learning_raw
    type: table
    fields: [machine_learning_raw.iteration, machine_learning_raw.learning_rate, machine_learning_raw.loss]
    sorts: [machine_learning_raw.iteration]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 10
    col: 4
    width: 8
    height: 6
  - title: Training Loss
    name: Training Loss
    model: opioid
    explore: machine_learning_raw
    type: looker_area
    fields: [machine_learning_raw.iteration, machine_learning_raw.total_loss]
    sorts: [machine_learning_raw.iteration]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    show_value_labels: true
    label_density: 25
    label_color: [black]
    font_size: 14px
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      machine_learning_raw.total_loss: "#1f78b4"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: machine_learning_raw.total_loss,
            name: Total Loss, axisId: machine_learning_raw.total_loss}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [machine_learning_raw.iteration]
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 6
  - title: "# Iterations"
    name: "# Iterations"
    model: opioid
    explore: machine_learning_raw
    type: single_value
    fields: [machine_learning_raw.count_iterations]
    limit: 500
    column_limit: 50
    listen: {}
    row: 10
    col: 0
    width: 4
    height: 6
  - name: 3 - Assess Model's Predictive Power
    type: text
    title_text: 3 - Assess Model's Predictive Power
    row: 16
    col: 0
    width: 24
    height: 2
  - title: Model Performance
    name: Model Performance
    model: opioid
    explore: predictive_power_raw
    type: looker_single_record
    fields: [predictive_power_raw.r_squared, predictive_power_raw.mean_absolute_error,
      predictive_power_raw.median_absolute_error, predictive_power_raw.mean_squared_error,
      predictive_power_raw.median_squared_error]
    sorts: [predictive_power_raw.r_squared]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    series_types: {}
    listen: {}
    row: 18
    col: 0
    width: 4
    height: 6
  - title: Historical Actual vs Predicted
    name: Historical Actual vs Predicted
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [applied_model_results.actual_risk_score, applied_model_results.average_actual_risk_score,
      applied_model_results.average_predicted_risk_score]
    filters:
      applied_model_results.actual_risk_score: "[-.4, .4],NOT NULL"
    sorts: [applied_model_results.actual_risk_score]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Predicted % Anomalies, orientation: left, series: [{axisId: applied_model_results.average_actual_risk_score,
            id: applied_model_results.average_actual_risk_score, name: Actual}, {
            axisId: applied_model_results.average_predicted_risk_score, id: applied_model_results.average_predicted_risk_score,
            name: Predicted}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Actual % Anomalies
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
    point_style: circle
    series_colors:
      applied_model_results.average_actual_risk_score: "#1ea8df"
      applied_model_results.average_predicted_risk_score: "#ed6168"
    series_labels:
      applied_model_results.average_actual_risk_score: Actual
      applied_model_results.average_predicted_risk_score: Predicted
    series_point_styles:
      applied_model_results.average_predicted_risk_score: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#cccccc", label_position: right, period: 7, regression_type: linear,
        show_label: false, series_index: 1}]
    show_null_points: true
    hidden_fields:
    listen: {}
    row: 18
    col: 4
    width: 10
    height: 6
  - title: Residuals
    name: Residuals
    model: opioid
    explore: claims
    type: looker_column
    fields: [applied_model_results.actual_risk_score, applied_model_results.average_residual]
    filters:
      applied_model_results.actual_risk_score: "[-.4, .4],NOT NULL"
    sorts: [applied_model_results.actual_risk_score]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: "% Anomalies"
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
    point_style: circle
    series_colors:
      applied_model_results.average_actual_risk_score: "#1ea8df"
      applied_model_results.average_predicted_risk_score: "#ed6168"
      applied_model_results.average_residual: "#b3a0dd"
    series_labels:
      applied_model_results.average_actual_risk_score: Actual
      applied_model_results.average_predicted_risk_score: Predicted
    series_point_styles:
      applied_model_results.average_predicted_risk_score: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: Actual}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    hidden_fields:
    listen: {}
    row: 18
    col: 14
    width: 10
    height: 6
