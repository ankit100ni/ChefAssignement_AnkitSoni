#
# Cookbook:: 2_Tomcat
# Recipe:: service_config
#
# Copyright:: 2022, The Authors, All Rights Reserved.

template node['tomcat']['service'] do
  source 'tomcat_service.erb'
  owner 'root'
  mode '644'
end

service 'tomcat' do
  action [:enable, :start]
end
