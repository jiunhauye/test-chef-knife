#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'nginx'

service 'nginx' do
  supports [:status, :restart, :reload]
  action :start
end


directory "/home/#{node[:user][:name]}/demo" do
  owner node[:user][:name]
end

file "/home/#{node[:user][:name]}/demo/index.html" do
  owner node[:user][:name]
  content "<h1>Hello Water"
end

template "/etc/nginx/sites-enabled/nginx.conf" do
  source 'nginx.conf.erb'
  notifies :restart, 'service[nginx]', :immediately

end

