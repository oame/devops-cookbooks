#
# Cookbook Name:: zshrc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Set zsh to root shell
user "root" do
  shell "/bin/zsh"
  action :modify
end

template '/etc/zshenv' do
  source 'zshrc.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end