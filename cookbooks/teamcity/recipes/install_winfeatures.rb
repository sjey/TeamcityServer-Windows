winFeatures = [
  'NetFx3ServerFeatures', #2012
  'NetFx4Extended-ASPNET45' #2012
]

winFeatures.each do |feature|
  windows_feature feature do
    action :install
    all true
  end
end
