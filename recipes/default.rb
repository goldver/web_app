#
# Cookbook Name: web_app
# Recipe: default
#
# Copyright 2016, Goldver
#
# All rights reserved - Do Not Redistribute
#

include_recipe "#{cookbook_name}::git_clone"
include_recipe "#{cookbook_name}::install_prerequisites"
include_recipe "#{cookbook_name}::npm_deploy"

# include recipe copy_webapp in runtime only
ruby_block "copy_webapp" do
    block do
        run_context.include_recipe "#{cookbook_name}::copy_webapp"
    end
end






