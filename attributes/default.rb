
# Chef::Application.fatal!("Must have the attribute infra_chef => project_name") if node['infra_chef']['project_name'] == ""
# Chef::Application.fatal!("Must have the attribute infra_chef => install_dir") if node['infra_chef']['install_dir'] == ""

# default["infra_chef"]["initial_command"] = "wget https://raw.githubusercontent.com/#{node['infra_chef']['project_name']}/initialize_chef_repo/master/initializator.sh && bash initializator.sh #{node['infra_chef']['project_name']} #{node['infra_chef']['environments']}"
# default["infra_chef"]["cron_chef_solo_command"] = "chef-solo --chef-license 'accept' --config #{::File.join(node['infra_chef']['install_dir'], "solo.rb")} --override-runlist \"role[#{node['infra_chef']['project_name']}]\" > /var/log/chef_client.log"

# default["infra_chef"]["gitinfo"] = {
#   "type": "",
#   "repository": "#{node['chef-git-server']['user']}@#{node["ipaddress"]}:#{node['chef-git-server']['home']}/#{node['infra_chef']['project_name']}.git",
#   "revision": "master",
#   "remote": "origin",
#   "submodules": {
#     "#{node['infra_chef']['project_name']}_generator": {
#       "type": "generators",
#       "repository": "#{node['chef-git-server']['user']}@#{node["ipaddress"]}:#{node['chef-git-server']['home']}/#{node['infra_chef']['project_name']}_generator.git",
#       "revision": "master",
#       "remote": "origin"
#     },
#     "#{node['infra_chef']['project_name']}_infra_chef": {
#       "type": "cookbooks",
#       "repository": "#{node['chef-git-server']['user']}@#{node["ipaddress"]}:#{node['chef-git-server']['home']}/#{node['infra_chef']['project_name']}_infra_chef.git",
#       "revision": "master",
#       "remote": "origin"
#     }
#   }
# }
