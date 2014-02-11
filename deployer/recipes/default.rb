# Create group
group node['deployer']['group'] do
  gid 5000
end

# Create user
user node['deployer']['user'] do
  comment  'Deployment user'
  uid      5000
  gid      5000
  shell    node['deployer']['shell']
  home     node['deployer']['home']
  supports :manage_home => true
end

# set sudo
sudo node['deployer']['user'] do
  user      node['deployer']['user']
  group     node['deployer']['group']
  commands  ['ALL']
  host      'ALL'
  nopasswd  true
end

# make directory ~/.ssh
directory "#{node['deployer']['home']}/.ssh" do
  owner     node['deployer']['user']
  group     node['deployer']['group']
  mode      '0700'
  recursive true
end

# make authorized_keys for deployer
remote_file "#{node['deployer']['home']}/.ssh/authorized_keys" do
  owner     node['deployer']['user']
  group     node['deployer']['group']
  mode      '0644'
  source    'https://github.com/oame.keys'
  action    :create_if_missing
end