default['jenkin']['java'] = if node['java'] && node['java']['java_home']
                              File.join(node['java']['java_home'], 'bin', 'java')
                            elsif node['java'] && node['java']['home']
                              File.join(node['java']['home'], 'bin', 'java')
                            elsif ENV['JAVA_HOME']
                              File.join(ENV['JAVA_HOME'], 'bin', 'java')
                            else
                              'java'
                            end

default['jenkins']['version'] = nil
default['jenkins']['user'] = 'jenkins'
default['jenkins']['group'] = 'jenkins'
default['jenkins']['host'] = 'localhost'
default['jenkins']['port'] = 8081
default['jenkins']['home'] = '/var/lib/jenkins'
default['jenkins']['log_directory'] = '/var/log/jenkins'
default['jenkins']['jenkins_args'] = nil
default['jenkins']['jvm_options'] = nil
default['jenkins']['listen_address'] = nil
default['jenkins']['https_port'] = nil
default['jenkins']['https_listen_address'] = nil
default['jenkins']['ajp_port'] = 8009
default['jenkins']['ajp_listen_address'] = nil
default['jenkins']['debug_level'] = 5
default['jenkins']['enable_access_log'] = "no"
default['jenkins']['handler_max'] = 100
default['jenkins']['handler_idle'] = 20
default['jenkins']['args'] = nil