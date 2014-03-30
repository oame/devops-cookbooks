#
# Cookbook Name:: openssl
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "openssl"

if platform_family?("rhel")
  package "openssl-devel"
elsif platform_family?("debian")
  package "libssl-dev"
end
