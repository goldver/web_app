#
# Cookbook Name: web_app
# Recipe: default
#
# Copyright 2016, Goldver
#
# All rights reserved - Do Not Redistribute
#

# removes oldest dir and makes a new dir
bash 'make_dir' do
    code <<-EOH
       sudo rm -rf "#{node['web_app']['current_path']}"
       sudo mkdir -p "#{node['web_app']['current_path']}"
       sudo chmod -R 755 "#{node['web_app']['current_path']}"
       sudo chown -R deploy:deploy "#{node['web_app']['current_path']}"
    EOH
end

# clone git repo
bash 'clone' do
    code <<-EOH
       sudo echo "#{node['deploy']['ssh_key']}" > /tmp/git
       chmod 600 /tmp/git
       ssh-agent bash -c 'ssh-add /tmp/git; git clone -b "#{node['deploy']['revision']}" "#{node['deploy']['repository']}" "#{node['web_app']['current_path']}"'
    EOH
end