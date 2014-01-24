## Cookbook Name:: dfjdk
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("Artifactory URL: #{node['artifactory']['url']}/#{node['artifactory']['repo_name']}/#{node['dfjdk']['artifactory_path']}/#{node['dfjdk']['rpm_name']}")

bash "Get the jdk" do
  cwd "/tmp"
  user "root"
  code "curl -k --user dfchef:r3dv1nes -O #{node['artifactory']['url']}/#{node['artifactory']['repo_name']}/#{node['dfjdk']['artifactory_path']}/#{node['dfjdk']['rpm_name']}" 
  not_if "yum list installed | grep jdk | grep #{node['dfjdk']['rpm_version']}"
end

bash "Install the jdk" do
  cwd "/tmp"
  user "root"
  code "yes | yum install #{node['dfjdk']['rpm_name']}" 
  not_if "yum list installed | grep jdk | grep #{node['dfjdk']['rpm_version']}"
end

# jdk_pkg = value_for_platform(
#    "default" => ["/tmp/#{node['dfjdk']['rpm_name']}"]
# )
	
# jdk_pkg.each do |pkg|
#  package pkg do
#    action :install
#  end
# end
