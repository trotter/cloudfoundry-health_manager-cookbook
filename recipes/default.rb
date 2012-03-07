#
# Cookbook Name:: cloudfoundry-health_manager
# Recipe:: default
#
# Copyright 2012, Trotter Cashion
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "bluepill"
include_recipe "cloudfoundry-common"
include_recipe "cloudfoundry-common::directories"
include_recipe "cloudfoundry-common::vcap"

ruby_path = File.join(rbenv_root, "versions", node.cloudfoundry_common.ruby_1_9_2_version, "bin")
config_file = File.join(node[:cloudfoundry_common][:config_dir], "health_manager.yml")
health_manager_path = File.join(node[:cloudfoundry_common][:vcap][:install_path], "bin", "health_manager")

bash "install cloudfoundry-health_manager gems" do
  user node[:cloudfoundry_common][:user]
  cwd  File.join(node[:cloudfoundry_common][:vcap][:install_path], "health_manager")
  code "#{File.join(ruby_path, "bundle")} install --without=test --local"
  subscribes :run, resources(:git => node[:cloudfoundry_common][:vcap][:install_path])
  action :nothing
end

template config_file do
  source "config.yml.erb"
  owner  node[:cloudfoundry_common][:user]
  mode   "0644"
  notifies :restart, "bluepill_service[cloudfoundry-health_manager]"
end

template File.join(node[:bluepill][:conf_dir], "cloudfoundry-health_manager.pill") do
  source "cloudfoundry-health_manager.pill.erb"
  variables(
    :path        => ruby_path,
    :binary      => "#{File.join(ruby_path, "ruby")} #{health_manager_path}",
    :pid_file    => node[:cloudfoundry_health_manager][:pid_file],
    :config_file => config_file
  )
  notifies :restart, "bluepill_service[cloudfoundry-health_manager]"
end

bluepill_service "cloudfoundry-health_manager" do
  action [:enable, :load, :start]
end

