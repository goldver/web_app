#
# Cookbook Name: web_app
# Recipe: default
#
# Copyright 2016, Goldver
#
# All rights reserved - Do Not Redistribute
#

# Installs Nodejs
execute 'install_nodejs' do
    command 'curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -; sudo apt-get install -y nodejs build-essential'
    user 'deploy'
end

# Npm specific version
npm_ver = "npm@#{node['web_app']['npm_version']}"

execute 'npm_version' do
    command 'sudo npm i -g' " #{npm_ver}"
    user 'deploy'
    Chef::Log.info("### Your Npm version is: '#{npm_ver}' ###")
end

# Installs g++
bash 'install_g_pp' do
    code <<-EOH
          sudo add-apt-repository ppa:ubuntu-toolchain-r/test
          sudo apt-get update
          sudo apt-get install -y g++-5
    EOH
end

# Link to wabapp.ngnix instead of webapp.conf
ngnix_path = '/etc/nginx/sites-enabled'
nginx_config_path = "#{node['web_app']['current_path']}/config/webapp.nginx"

bash 'web_app_config' do
    code <<-EOH
        sudo rm "#{ngnix_path}/webapp.conf" || true
        sudo ln "#{nginx_config_path}" "#{ngnix_path}/webapp.conf"
    EOH
end

# Restarts a Ngnix service
service 'nginx' do
    action :restart
    only_if { File.exist?('/etc/init.d/nginx') }
end

# Sets chown for webapp
execute "chown for /var/www/projects/webapp" do
    command "chown -R deploy:deploy #{node['web_app']['current_path']}"
end