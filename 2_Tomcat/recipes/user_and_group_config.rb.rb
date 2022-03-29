#
# Cookbook:: 2_Tomcat
# Recipe:: user_and_group_config.rb
#
# Copyright:: 2022, The Authors, All Rights Reserved.

group node['tomcat']['group'] do
    action :create
end

user node['tomcat']['user'] do
    shell '/bin/nologin'
    gid node['tomcat']['group']
    manage_home false
    home node['tomcat']['install_directory']
end