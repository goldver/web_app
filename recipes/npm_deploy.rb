#
# Cookbook Name: web_app
# Recipe: default
#
# Copyright 2016, Goldver
#
# All rights reserved - Do Not Redistribute
#

# Sets permission and user for ubuntu default user
directory '/home/ubuntu/'  do
    owner 'deploy'
    group 'deploy'
    mode '0755'
end

# Installs npm
execute 'install_npm' do
    cwd node['web_app']['current_path']
    command 'npm install'
    user 'deploy'
end

# Creates a cache file and sets user and permissions
file '/tmp/webapp-babel-cache.json'  do
    owner 'deploy'
    group 'deploy'
    mode '0755'
    action :create_if_missing
end

# Builds npm
execute 'build_npm' do
    cwd node['web_app']['current_path']
    environment 'BABEL_CACHE_PATH' => '/tmp/webapp-babel-cache.json'
    command 'npm run build'
    user 'deploy'
end