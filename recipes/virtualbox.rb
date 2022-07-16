#
# Cookbook:: infra_chef
# Recipe:: virtualbox
#
# Copyright:: 2022, The Authors, All Rights Reserved.

selected_one = 'patatae'
node['network']['interfaces'].each do |k, v|
    if v['type'] == 'eth'
        selected_one = k
        return
    end
end
node.override['virtualbox']['default_interface'] = selected_one

include_recipe 'virtualbox::default'
include_recipe 'virtualbox::systemservice'
include_recipe 'virtualbox::webportal'
include_recipe 'vagrant'
