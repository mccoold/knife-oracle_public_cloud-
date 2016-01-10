# Author:: Daryn McCool (<mdaryn@hotmail.com>)
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class Chef
  class Knife
    require 'chef/knife/opc_base'
    require 'chef/knife/fmwbase'
    class OpcSoaCreate < Chef::Knife
      include Knife::OpcBase
      include Knife::FmwBase
      deps do
        require 'chef/json_compat'
        require 'OPC'
        require 'chef/knife/bootstrap'
        Chef::Knife::Bootstrap.load_deps
      end # end of deps

      banner 'knife opc soa create (options)'

      option :create_json,
         :short       => '-j',
         :long        => '--create_json JSON',
         :description => 'json file to describe server'
      option :identity_file,
         :long        => '--identity-file IDENTITY_FILE',
         :description => 'The SSH identity file used for authentication'
      option :ssh_user,
         :short       => '-x USERNAME',
         :long        => '--ssh-user USERNAME',
         :description => 'The ssh username',
         :default     => 'opc'
      option :chef_node_name,
         :short       => '-N NAME',
         :long        => '--node-name NAME',
         :description => 'The Chef node name for your new node',
         :proc        => Proc.new { |key| Chef::Config[:knife][:chef_node_name] = key }
       
      def run
        fmw_create(config, 'soa')
      end # end of run
    end # end of create
  end # end of knife
end # end of chef
