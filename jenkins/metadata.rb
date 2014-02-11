name             'jenkins'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ubuntu debian centos redhat amazon scientific oracle fedora}.each do |os|
  supports os
end

%w{build-essential yum apt}.each do |cb|
  depends cb
end