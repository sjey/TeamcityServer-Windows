vs_dirs='\\Program Files (x86)\\MSBuild\\Microsoft\\VisualStudio\\v12.0'
version= '12.0.4'
dest='/chef/cache'

powershell_script "nuget install Microsoft.WebApplication.Build.Tasks #{version}" do
  code "nuget install MSBuild.Microsoft.VisualStudio.Web.targets -version #{version} -o #{dest}"
end

src="#{dest}\\MSBuild.Microsoft.VisualStudio.Web.targets.#{version}\\tools\\VSToolsPath"

powershell_script "copy Microsoft.WebApplication.Build.Tasks #{version}" do
  code "robocopy /z /s \"#{src}\" \"#{vs_dirs}\" /njh /njs /ndl /nc /ns"
end
