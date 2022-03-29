#
# Cookbook Name:: 2_Tomcat
# Recipe:: default
#
# Copyright (c) 2022 The Authors, All Rights Reserved.


include_recipe '2_Tomcat::user_and_group_config.rb'
include_recipe '2_Tomcat::tomcat_config.rb'
include_recipe '2_Tomcat::service_config'


