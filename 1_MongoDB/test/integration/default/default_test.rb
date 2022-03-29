# # encoding: utf-8

# Inspec test for recipe 1_MongoDB::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe service('mongod') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
