#
# Cookbook:: infra_chef
# Recipe:: virtualbox
#
# Copyright:: 2022, The Authors, All Rights Reserved.

node.override['virtualbox']['default_interface'] = node['network']['interfaces'].each do |k, v|
    if v['type'] == 'eth'
      return v['type']
    end
  end

include_recipe 'virtualbox::default'
include_recipe 'virtualbox::webportal'
include_recipe 'vagrant'
