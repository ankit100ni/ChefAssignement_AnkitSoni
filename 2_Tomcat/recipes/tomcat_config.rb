#
# Cookbook:: 2_Tomcat
# Recipe:: tomcat_config.rb
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package node['tomcat']['java_package']

remote_file node['tomcat']['package_path'] do
  source node['tomcat']['tomcat_package_source']
  mode '0755'
  action :create
end

archive_file node['tomcat']['package_path'] do
  path node['tomcat']['package_path']
  destination node['tomcat']['install_directory']
  group node['tomcat']['group']
  owner node['tomcat']['user']
  strip_components 1
  action :extract
end

directory '/opt/tomcat' do
  owner node['tomcat']['user']
  group node['tomcat']['group']
  mode '0755'
end
