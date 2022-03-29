#
# Cookbook:: 2_Tomcat
# Recipe:: tomcat_config.rb
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package node['tomcat']['java_package']

remote_file node['tomcat']['package_path'] do
    source node['tomcat']['tomcat_package_source']
    action :create
end

directory node['tomcat']['install_directory'] do
    group node['tomcat']['group']
    action :create
    owner node['tomcat']['user']
end

# archive_file '/tmp/apache-tomcat-8.5.77.tar.gz' do
#     path '/tmp/apache-tomcat-8.5.77.tar.gz'
#     destination '/opt/tomcat'
#     group 'tomcat'
#     owner 'tomcat'
#     action :extract
#     mode 755
# end

execute 'extract_tomcat_binary' do
    command 'sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
    cwd '/tmp'
    not_if { Dir.exist?('/opt/tomcat/bin') }
end


execute 'update_permissions' do
    command 'cd /opt/tomcat;sudo chgrp -R tomcat /opt/tomcat;sudo chmod -R g+r conf;sudo chmod g+x conf;sudo chown -R tomcat webapps/ work/ temp/ logs/'
    only_if { ::File.exist?('/opt/tomcat/bin') }
end


