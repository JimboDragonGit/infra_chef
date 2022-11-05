#
# Cookbook:: infra_chef
# Recipe:: virtualbox
#
# Copyright:: 2022, The Authors, All Rights Reserved.

extend SelfBootstrap

auto_repo :install do
  proc do
    include_recipe 'virtualbox::default'
    include_recipe 'virtualbox::webportal'
    include_recipe 'vagrant'
  end
end
