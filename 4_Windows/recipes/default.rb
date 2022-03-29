#
# Cookbook:: 4_Windows
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.


windows_user_privilege node['Policy']['SeInteractiveLogonRight'] do
    privilege 'SeInteractiveLogonRight'
    users         ['BUILTIN\Administrators']
    action         :set
  end
  
 windows_user_privilege node['Policy']['SeRemoteInteractiveLogonRight'] do
    privilege 'SeRemoteInteractiveLogonRight'
    users          ['BUILTIN\Administrators', 'BUILTIN\Remote Desktop Users']
    action         :set
end
  
windows_security_policy node['Policy']['EnableAdminAccount'] do
    secoption 'EnableAdminAccount'
    secvalue '0'
    action :set
end
  
registry_key node['Policy']['DisableCAD'] do
    values [{
        name: 'DisableCAD',
        type: :dword,
        data: 0,
    }]
    action :create
end
  
registry_key node['Registry']['NtpCinet'] do
    values [{l
        name:  'Enabled',
        type:  :dword,
        data:  1,
    }]
    recursive true
    action :create
end
  
registry_key node['Registry']['NtpServer'] do
    values [{
        name:  'Disabled',
        type:  :dword,
        data:  0,
    
    }]
    recursive true
    action :create
end