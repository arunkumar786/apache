#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# here we need to install a apache package
package 'apache2' do
  action :install

end

#next configure a file for this <file> resource
file '/var/www/html/index.html' do
  content '<h1>Hello World </h1>'
end

# start the service with <service> resource
# this resource doesn't have default action
service 'apache2' do
  action [ :enable, :start ]
end
