Description
===========

Installed and configures a CloudFoundry Health Manager

Requirements
============

Platform
--------

* Ubuntu

Tested on:

* Ubuntu 10.04

Cookbooks
---------

Requires Opscode's bluepill cookbook for creating init scripts and
trotter's cloudfoundry-common cookbook.

Usage
=====

This recipe will install the CloudFoundry Health Manager on the target
node along with the necessary configuration files and init scripts to
run it. Because the database required by a Health Manager is shared with
the CloudController, you need to use the
`cloudfoundry-cloud_controller::database` recipe from the
`cloudfoundry-cloud_controller` cookbook to setup the Health Manager's
database. Assuming you're running a Health Manager on the same machine
as your Cloud Controller, typical usage in a recipe will look like so:

    include_recipe "cloudfoundry-cloud_controller"
    include_recipe "cloudfoundry-health_manager"

Attributes
==========

* `cloudfoundry_health_manager[:log_level]` - The Health Manager's log level. Default is `info"`.
* `cloudfoundry_health_manager[:log_file]` - Where to write the Health Manager's logs. Default is `File.join(node[:cloudfoundry_common][:log_dir], "health_manager.log")`.
* `cloudfoundry_health_manager[:pid_file]` - Where to write the Health Manager's pid file. Default is `File.join(node[:cloudfoundry_common][:pid_dir], "health_manager.pid")`.
* `cloudfoundry_health_manager[:database_scan]` - TODO (trotter): Find out what this does. Default is `60`.
* `cloudfoundry_health_manager[:droplet_lost]` - TODO (trotter): Find out what this does. Default is `30`.
* `cloudfoundry_health_manager[:droplet_analysis]` - TODO (trotter): Find out what this does. Default is `10`.
* `cloudfoundry_health_manager[:flapping_death]` - TODO (trotter): Find out what this does. Default is `3`.
* `cloudfoundry_health_manager[:flapping_timeout]` - TODO (trotter): Find out what this does. Default is `180`.
* `cloudfoundry_health_manager[:restart_timeout]` - TODO (trotter): Find out what this does. Default is `20`.
* `cloudfoundry_health_manager[:stable_state]` - TODO (trotter): Find out what this does. Default is `60`.

License and Author
==================

Author:: Trotter Cashion (<cashion@gmail.com>)

Copyright:: 2012 Trotter Cashion

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
