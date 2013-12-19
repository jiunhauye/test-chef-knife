#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user node[:user][:name] do
  password node[:user][:password]
  gid "root"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end
