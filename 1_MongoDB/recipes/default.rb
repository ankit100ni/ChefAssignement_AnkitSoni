#
# Cookbook Name:: 1_MongoDB
# Recipe:: default
#
# Copyright (c) 2022 The Authors, All Rights Reserved.


template node['mongodb']['service_file'] do
    source 'mongoDBContent.erb'
    owner 'root'
    mode 0644
  end
  
  package node['mongodb']['package']
  
  service 'mongod' do
    action [:enable, :start]
  end
  
  # execute 'mongodb' do
  #   command 'sudo chkconfig mongod on'
  # end
  
  