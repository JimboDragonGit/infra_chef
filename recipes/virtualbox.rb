#
# Cookbook:: infra_chef
# Recipe:: virtualbox
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe 'virtualbox::default'
include_recipe 'virtualbox::webportal'
include_recipe 'vagrant'