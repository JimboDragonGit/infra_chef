# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'infra_chef'

# Where to find external cookbooks:
default_source :supermarket do |market|
  market.preferred_for 'chef-ingredient'
end

default_source :chef_repo, '../..' do |market|
  market.preferred_for 'chef_workstation_initialize', 'chef-git-server', 'chefserver', 'virtualbox'
end

default_source :chef_repo, '../../librairies/' do |market|
  market.preferred_for 'infraClass'
end

# run_list: chef-client will run these recipes in the order specified.
run_list 'infra_chef::default'

# Specify a custom source for a single cookbook:
