include: "/simplified_views/*"
# include: "/demo_vitals/*"

view: realtime_observations {
  sql_table_name: healthcare_demo_live.realtime_observation ;;
  extends: [observation_vitals]
}
