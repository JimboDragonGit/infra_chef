#
# Cookbook:: jimbodragon
# Recipe:: chefserver
#
# Copyright:: 2022, The Authors, All Rights Reserved.

extend SelfBootstrap
auto_repo :install do
  proc do
    include_recipe 'chefserver'
  end
end
