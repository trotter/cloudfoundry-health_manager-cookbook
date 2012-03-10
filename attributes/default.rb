include_attribute "cloudfoundry-common"

# The Health Manager's log level.
default[:cloudfoundry_health_manager][:log_level] = "info"

# Where to write the Health Manager's logs.
default[:cloudfoundry_health_manager][:log_file] = File.join(node[:cloudfoundry_common][:log_dir], "health_manager.log")

# Where to write the Health Manager's pid file.
default[:cloudfoundry_health_manager][:pid_file] = File.join(node[:cloudfoundry_common][:pid_dir], "health_manager.pid")

# TODO (trotter): Find out what this does.
default[:cloudfoundry_health_manager][:database_scan]    = 60

# TODO (trotter): Find out what this does.
default[:cloudfoundry_health_manager][:droplet_lost]     = 30

# TODO (trotter): Find out what this does.
default[:cloudfoundry_health_manager][:droplet_analysis] = 10

# TODO (trotter): Find out what this does.
default[:cloudfoundry_health_manager][:flapping_death]   = 3

# TODO (trotter): Find out what this does.
default[:cloudfoundry_health_manager][:flapping_timeout] = 180

# TODO (trotter): Find out what this does.
default[:cloudfoundry_health_manager][:restart_timeout]  = 20

# TODO (trotter): Find out what this does.
default[:cloudfoundry_health_manager][:stable_state]     = 60
