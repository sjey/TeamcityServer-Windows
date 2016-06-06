chocolatey 'vs2013agents'
#chocolatey 'vs2015agents'

remote_file '/chef/cache/vstf_testagent.exe' do
	source 'http://download.microsoft.com/download/8/A/F/8AFFDD5A-53D9-46EB-98D7-B61BBCAF0DE6/vstf_testagent.exe'
	action :create
end

powershell_script 'Install VS2015Agent' do
    code '/chef/cache/vstf_testagent.exe /Silent /NoRestart /Log $env:temp/vs2015agents.log'
end
