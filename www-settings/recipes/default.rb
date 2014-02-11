#
# Cookbook Name:: www-settings
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/var/www" do
  owner "deployer"
  group "deployer"
  mode 00655
  action :create
end