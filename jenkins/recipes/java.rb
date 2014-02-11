case node['platform_family']
when 'debian'
  package 'openjdk-7-jdk'
when 'rhel'
  package 'java-1.7.0-openjdk'
else
  fail "`#{node['platform_family']}' is not supported!"
end
