# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "win12r2"
  config.vm.network "forwarded_port", guest: 3389, host: 3389
  config.vm.network "forwarded_port", guest: 8111, host: 8111
  config.vm.network "private_network", ip: "10.0.7.210"
  config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
#  config.vm.provision "shell", path: "bootstrap.ps1"
  config.omnibus.chef_version = :latest
  config.vm.provider "virtualbox" do |v|
     v.memory = 4086
     v.cpus = 2
     v.gui = false
  end
  config.vm.synced_folder "./cookbooks", 'c:\tmp\cookbooks'
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = './cookbooks/teamcity/Berksfile'
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.json = {
      :java =>{
          :install_flavor => "oracle",
          :jdk_version => "8",
          :windows =>{
            :url => "http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-windows-x64.exe"
          }
      },
      :teamcity =>{
          :username => "admin",
          :group => "admin",
          :password => "admin",
          :agent =>{
            :system_dir => 'C:\\TeamCity\\buildAgent',
            :server_uri => "http://10.0.7.200:8111/"
          }
        }
     }
    chef.run_list = [
      "recipe[teamcity]",
      "recipe[teamcity::install_jdk]",
#      "recipe[teamcity::install_powershell]",
      "recipe[teamcity::install_teamcity]",
      "recipe[teamcity::install_tcagent]",
      "recipe[teamcity::install_dotnet]",
      "recipe[teamcity::install_winfeatures]",
      "recipe[teamcity::install_aspmvc]",
      "recipe[teamcity::install_vsagent]",
#      "recipe[teamcity::install_windows_sdk]",
      "recipe[teamcity::install_msbuild]",
      "recipe[teamcity::install_VSWebTargets12]",
      "recipe[teamcity::install_VSWebTargets14]",
      "recipe[teamcity::install_VSWebTargets11]"
    ]
#    chef.add_recipe "visualstudio"
  end
end
