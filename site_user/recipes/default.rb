#
# Cookbook Name:: site_user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

data_bag('users').each do |item|
  u = data_bag_item('users', item)
  
  # create user
  user u['id'] do
    shell    u['shell']
    password u['password']
    supports :manage_home => true, :non_unique => false
    action   [:create]
  end

  # make directory ~/.ssh
  directory "/home/#{u['id']}/.ssh" do
    owner     u['id']
    group     u['group']
    mode      '0700'
    recursive true
  end

  # make authorized_keys for deployer
  file "/home/#{u['id']}/.ssh/authorized_keys" do
    owner     u['id']
    group     u['group']
    mode      '0644'
    content   u['key']
    action    :create
  end

  # set sudo
  sudo u['id'] do
    user      u['id']
    group     u['group']
    commands  ['ALL']
    host      'ALL'
    nopasswd  true
  end
end