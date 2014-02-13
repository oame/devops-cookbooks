#
# Cookbook Name:: hostname
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'chef/util/file_edit'

hostname = node['system']['hostname']

if platform?('redhat', 'centos', 'amazon')
  ruby_block "edit sysconfig" do
    block do
      rc = Chef::Util::FileEdit.new("/etc/sysconfig/network")
      rc.search_file_replace_line(/^HOSTNAME=.*$/, "HOSTNAME=#{hostname}")
      rc.write_file
    end
  end

  execute "set hostname" do
    command "echo #{hostname} > /proc/sys/kernel/hostname"
    action :run
  end
elsif platform?('ubuntu', 'debian')
  file "/etc/hostname" do
    content "#{hostname}\n"
    mode "0644"
  end

  if node[:hostname] != hostname
    execute "hostname #{hostname}"
  end
end