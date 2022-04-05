# Chef InSpec test for recipe 2_Tomcat::tomcat_config.rb

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe http('http://127.0.0.1:8080') do
  its('status') { should eq 200 }
end