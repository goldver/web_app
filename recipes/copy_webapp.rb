#
# Cookbook Name: web_app
# Recipe: default
#
# Copyright 2016, Goldver
#
# All rights reserved - Do Not Redistribute
#

file_name = 'webapp.conf'
src = '/var/www/projects/webapp/current/config'
dest = '/etc/init'

Chef::Log.info("### Your file: '#{dest}/#{file_name}' ###")

# Removes webapp conf if exists
cookbook_file "#{dest}/#{file_name}" do
    action :delete
    only_if {File.exists?("#{dest}/#{file_name}")}
end

# copy new web.config
file "#{dest}/#{file_name}" do
    owner 'root'
    group 'root'
    mode '0644'
    content IO.read("#{src}/webapp.rb")
    action :create
end

# Restarts service
bash 'restart_service' do
    code <<-EOH
       sudo service webapp restart
    EOH
end
