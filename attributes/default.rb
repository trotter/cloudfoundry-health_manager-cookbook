include_attribute "cloudfoundry-common"

default[:cloudfoundry_health_manager][:local_router] = nil

default[:cloudfoundry_health_manager][:log_level] = "info"
default[:cloudfoundry_health_manager][:log_file] = File.join(node[:cloudfoundry_common][:log_dir], "health_manager.log")
default[:cloudfoundry_health_manager][:pid_file] = File.join(node[:cloudfoundry_common][:pid_dir], "health_manager.pid")

default[:cloudfoundry_health_manager][:database_scan]    = 60
default[:cloudfoundry_health_manager][:droplet_lost]     = 30
default[:cloudfoundry_health_manager][:droplet_analysis] = 10
default[:cloudfoundry_health_manager][:flapping_death]   = 3
default[:cloudfoundry_health_manager][:flapping_timeout] = 180
default[:cloudfoundry_health_manager][:restart_timeout]  = 20
default[:cloudfoundry_health_manager][:stable_state]     = 60
