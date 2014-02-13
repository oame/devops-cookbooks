#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

data_bag('users').each do |item|
  user = data_bag_item('users', item)
  
  # Create group
  group user['group'] do
    gid 5000
  end

  # Create user
  user user['name'] do
    home     "/home/#{user['name']}"
    supports :manage_home => true
  end

  # set sudo
  sudo user['name'] do
    user      user['name']
    group     user['group']
    commands  ['ALL']
    host      'ALL'
    nopasswd  true
  end
end