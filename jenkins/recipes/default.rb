#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Create the Jenkins user
user node['jenkins']['user'] do
  home node['jenkins']['home']
end

# Create the Jenkins group
group node['jenkins']['group'] do
  members node['jenkins']['user']
end

# Create the home directory
directory node['jenkins']['home'] do
  owner     node['jenkins']['user']
  group     node['jenkins']['group']
  mode      '0755'
  recursive true
end

# Create the log directory
directory node['jenkins']['log_directory'] do
  owner     node['jenkins']['user']
  group     node['jenkins']['group']
  mode      '0755'
  recursive true
end

case node['platform_family']
when 'rhel'
  include_recipe "yum::default"

  yum_repository 'jenkins-ci' do
    url 'http://pkg.jenkins-ci.org/redhat'
    key 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
  end

  package 'jenkins' do
    version node['jenkins']['version']
  end

  template '/etc/sysconfig/jenkins' do
    source   'jenkins-config.erb'
    mode     '0644'
    notifies :restart, 'service[jenkins]', :immediately
  end
end

service 'jenkins' do
  supports status: true, restart: true, reload: true
  action  [:enable, :start]
end

# nginx
directory "/etc/nginx/sites-available" do
  owner "root"
  group "root"
  mode 0644
  action :create
end

template '/etc/nginx/sites-available/jenkins' do
  source   'nginx_jenkins.conf.erb'
  mode     '0644'
end

nginx_site 'jenkins' do
  notifies :restart, 'service[nginx]'
end