#
# Cookbook:: 4_Windows
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.


windows_user_privilege 'Allow log on locally' do
    privilege 'SeInteractiveLogonRight'
    users         ['BUILTIN\Administrators']
    action         :set
  end
  
 windows_user_privilege 'Allow log on through Remote Desktop Services' do
    privilege 'SeRemoteInteractiveLogonRight'
    users          ['BUILTIN\Administrators', 'BUILTIN\Remote Desktop Users']
    action         :set
end
  
windows_security_policy 'Accounts: Administrator account status' do
    secoption 'EnableAdminAccount'
    secvalue '0'
    action :set
end
  
registry_key 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' do
    values [{
        name: 'DisableCAD',
        type: :dword,
        data: 0,
    }]
    action :create
end
  
registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NtpClient' do
    values [{
        name:  'Enabled',
        type:  :dword,
        data:  1,
    }]
    recursive true
    action :create
end
  
registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NTPServer' do
    values [{
        name:  'Disabled',
        type:  :dword,
        data:  0,
    
    }]
    recursive true
    action :create
end