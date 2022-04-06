#
# Cookbook:: 1_MongoDB
# Recipe:: mongoDB_config
#
# Copyright:: 2022, The Authors, All Rights Reserved.

template node['mongodb']['service_file'] do
  source 'mongoDBContent.erb'
  owner node['mongodb']['user']
  mode node['mongodb']['privilege']
end

package node['mongodb']['package']

service 'mongod' do
  action [:enable, :start]
end
