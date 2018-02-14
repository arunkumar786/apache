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

# remote_file resource is used to download the files
# from remote servers.
=begin
remote_file "/var/www/html/pallavi.jpg" do
  source 'https://www.google.co.in/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjX-qKC_9vXAhUKv48KHTVcBGcQjRwIBw&url=https%3A%2F%2Ftamilglitz.in%2Fsai-pallavi-photos-hd-images%2F&psig=AOvVaw1Q4Elxa-wZV1Y3HbXW-C9L&ust=1511777184628922'
end
=end
template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
  # this action will restart the apache service whenever there is 
  # a change in index.html
  notifies :restart, 'service[apache2]', :immediately
end
=begin
cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  action :create
end
=end
# start the service with <service> resource
# this resource doesn't have default action

# trying bash and execute resource
# as of my knowledge bash resource can be used
# to execute multiple commands but execute resource
# is used to execute single command and it is followed
# with guard condition.

bash "run a script" do
  code <<-EOH
    mkdir -p /var/www/mysites
  EOH
  not_if { ::File.exist?("/var/www/mysites") }
end

execute "run a script" do
  cwd "/var/www/mysites"
  command 'sh test.sh'
end

service 'apache2' do
  action [ :enable, :start ]
# similarly if we want to subscribe to template from service
# perspective we can do the following it will also do the same
# but from service perspective.
# subscribes :restart, 'template[/var/www/html/index.html]', :immidiately

end
