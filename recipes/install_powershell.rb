powershell_script 'Powershell ExecutionPolicy' do
  code "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -force"
end
#Disable UAC
windows_registry 'HKLM\Software\Microsoft\Windows\CurrentVersion\policies\system' do
  values 'EnableLUA' => 0
  type :dword
end
