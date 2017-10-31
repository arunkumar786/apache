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
# in the index file let's try to update the 
# system information using node object and strin
# interpolation.
#file '/var/www/html/index.html' do
#  content "<html><h1>Hello World </h1>
#           <head>
#              <title>node info </title>
#           </head>
#           <body>IPADDRESS:#{node['ipaddress']}
#                 HOSTNAME:#{node['hostname']}
#                 MEMORY:#{node['memory']['total']}</body></html>"
#end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
end

# start the service with <service> resource
# this resource doesn't have default action
service 'apache2' do
  action [ :enable, :start ]
end
