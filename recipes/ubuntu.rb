#
# Cookbook:: infra_chef
# Recipe:: ubuntu
# name 'Recipe file for infra_chef'
# maintainer 'Jimbo Dragon'
# maintainer_email 'jimbo_dragon@hotmail.com'
# license ''
# description 'Recipe file for infra_chef'
# version '0.1.0'
# chef_version '>= 15.0'
# issues_url 'https://github.com/jimbodragon/infra_chef/issues'
# source_url 'https://github.com/jimbodragon/infra_chef'

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


# extend Infraclass::BasevmHelpers
# extend Infraclass::EnvironmentHelpers
# extend Infraclass::VagrantConfigHelpers
# extend Infraclass::VboxproviderHelpers
# extend Infraclass::VboxvmHelpers
# extend Infraclass::VirtualmachineHelpers
# extend Infraclass::VirtualmachineproviderHelpers
# extend Infraclass::VmprovidedHelpers
# extend Infraclass::VmwithharddrivesHelpers
# extend Infraclass::VmwithnicsHelpers
# extend Infraclass::VsphereproviderHelpers
# extend Infraclass::VspherevmHelpers

extend Infraclass

Chef::Log.info("Install Adding require images")
Chef::Log.info("Install Dropbox")

class ChefService < Infraclass::ServiceHelpers::Service

  class Ubuntu_VBox < Infraclass::VboxproviderHelpers::VBoxProvider
    def initialize
      super("Ubuntu_VBox", "ubuntu-22.04", self)
    end
  end

  class ProdEnv < Infraclass::EnvironmentHelpers::Environment
    def initialize
      super("ProdEnv", Ubuntu_VBox.new())
      AddVM(ChefServer.new())
    end
  end

  class TestEnv < ProdEnv
    def initialize
      @name = "TestEnv"
    end
  end

  class ChefServer < Infraclass::VboxvmHelpers::VBoxVM
    def initialize
      super("chefserver", "chefserver")
    end
  end

  def initialize
    super("chefService")
    AddEnvironment(TestEnv.new())
  end
end

chefservice = ChefService.new()

Chef::Log.info("Adding VMs to environment")
# prod_env.addVM(node['infra_chef']['vms']['chefserver'])

Chef::Log.info("Building Chef server")

Chef::Log.info("Bootstrap this machine to chef server")

Chef::Log.info("Build the infra")
