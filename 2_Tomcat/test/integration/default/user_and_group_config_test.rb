# Chef InSpec test for recipe 2_Tomcat::user_and_group_config.rb

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe group('tomcat') do
  it { should exist }
end

describe user('tomcat') do
  it { should exist }
end