#
# Cookbook:: infra_chef
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright:: 2020, Jimbo Dragon
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

auto_chef_repo node[cookbook_name]["project_name"] do
  chef_repo_initialized node[cookbook_name]["chef_repo_initialized"]
  chef_generator_initialized node[cookbook_name]["chef_generator_initialized"]
  project_description node[cookbook_name]["project_description"]
  chef_repo_name node[cookbook_name]["chef_repo_name"]
  environments node[cookbook_name]["environments"]
  initial_command node[cookbook_name]["initial_command"]
  chef_solo_command node[cookbook_name]["chef_solo_command"]
  cron_chef_solo_command node[cookbook_name]["cron_chef_solo_command"]
  install_dir node[cookbook_name]["install_dir"]
  chef_boostrapped node[cookbook_name]["chef_boostrapped"]
  environment node[cookbook_name]["environment"]
  gitinfo node[cookbook_name]["gitinfo"] if node[cookbook_name]["gitinfo"]
  cron node[cookbook_name]["cron"]
  git_home node["chef-git-server"]["home"]
  git_repositories node['chef-git-server']['repositories']
  run_list node[cookbook_name]["run_list"]
  default_attributes "#{cookbook_name}": node[cookbook_name].to_hash, "chef-git-server": node['chef-git-server'].to_hash
  override_attributes "#{cookbook_name}": node.override[cookbook_name].to_hash, "chef-git-server": node.override['chef-git-server'].to_hash
  compile_time node['chef-git-server']['compile_time']
end

include_recipe "#{cookbook_name}::#{node[cookbook_name]["project_name"]}"
# Chef::Log.warn("#{node["platform"]}")
