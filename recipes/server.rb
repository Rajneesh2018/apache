#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#  ~/cookbooks/apache/recipes/server.rb

package 'httpd' do
	action :install
end

file '/var/www/html/index.html' do
	content "<h1>Hello, world!!</h1>
		<h3>HOSTNAME: #{node['hostname']}</h3>
		<h3>CPU: #{node['cpu']['0']['mhz']}</h3>
		<h3>MEMORY: #{node['memory']['total']}</h3>"
end

service 'httpd' do
	action [:enable,:start ]
end
