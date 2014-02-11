#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# include_recipe "yum"

yum_key "RPM-GPG-KEY-jenkins" do
  url "http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
  action :add
end

remote_file "/etc/yum.repos.d/jenkins.repo" do
  source "http://pkg.jenkins-ci.org/redhat/jenkins.repo"
  mode 0644
  action :create_if_missing
end

node["jenkins"]["package_requirements"].each do |pkg|
  package pkg do
    action :install
  end
end

service "jenkins" do
  action [:start]
end