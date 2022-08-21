#
# Cookbook:: infra_chef
# Recipe:: virtualbox
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# case node['platform_family']
# when 'debian'
#   %w(ca-certificates curl gnupg lsb-release).each do |software|
    
#   end
#   apt_repository 'docker' do
#     uri 'https://apt.dockerproject.org/repo'
#     distribution "#{node['platform']}-#{node['lsb']['codename']}"
#     components ['main']
#     key '58118E89F3A912897C070ADBF76221572C52609D'
#   end
# when 'rhel'
#   yum_repository 'docker' do
#     description 'Docker Repository'
#     baseurl "https://yum.dockerproject.org/repo/main/centos/#{node['platform_version'].to_i}/"
#     gpgkey 'https://yum.dockerproject.org/gpg'
#     action :create
#   end
# else
#   raise 'Distribution not supported by docker-engine::install_repo'
# end

# include_recipe 'docker-engine'

docker_service 'default' do
  group 'docker'
  action [:create, :start]
end
