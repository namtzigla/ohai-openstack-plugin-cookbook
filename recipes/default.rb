#
# Cookbook Name:: ohai-openstack-plugin-cookbook
# Recipe:: default
#
# Copyright (C) 2014 Florin STAN
# 
# All rights reserved - Do Not Redistribute
#


cookbook_file "openstack-plugin.rb" do 
  path "/etc/ohai/plugins/"
  action :create
end
