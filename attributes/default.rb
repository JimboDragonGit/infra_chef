
Chef::Application.fatal!("Must have the attribute infra_chef => project_name") if node['infra_chef']['project_name'] == ""

default["infra_chef"]["install_dir"] = ::File.join(::Dir.pwd, node['infra_chef']['project_name'])
default["infra_chef"]["initial_command"] = "wget https://raw.githubusercontent.com/jimbodragon/initialize_chef_repo/master/initializator.sh && bash initializator.sh Example Test Dev QA SIT DR"
default["infra_chef"]["cron_chef_solo_command"] = "chef-solo --chef-license 'accept' --config #{::File.join(node['infra_chef']['install_dir'], "solo.rb")} --override-runlist \"role[#{node['infra_chef']['project_name']}]\" > /var/log/chef_client.log"
