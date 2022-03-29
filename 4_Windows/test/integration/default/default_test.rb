# Chef InSpec test for recipe 4_Windows::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe security_policy do
  its('SeInteractiveLogonRight') { should eq ['S-1-5-32-544'] }
end


describe security_policy do
  its('SeRemoteInteractiveLogonRight') { should eq ['S-1-5-32-544'] + ['S-1-5-32-555'] }
end

describe security_policy do
  its('EnableAdminAccount') { should eq 0 }
end

describe registry_key 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' do
  its('DisableCAD') { should eq 0 }
end



describe registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NtpClient' do
  its('Enabled') { should eq 1 }
end


describe registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NTPServer' do
  its('Disabled') { should eq 0 }
end