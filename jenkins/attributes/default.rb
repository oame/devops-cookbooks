case node['platform']
when "debian","ubuntu"
  default['jenkins']['package_requirements'] = %w{openjdk-7-jdk jenkins}
when "redhat","centos","scientific","amazon","oracle","fedora"
  default['jenkins']['package_requirements'] = %w{java-1.7.0-openjdk jenkins}
end