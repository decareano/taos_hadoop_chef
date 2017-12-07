#
# Cookbook Name:: hadoop_cookbookOne
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "java" do
	case node[:platform]
	when 'ubuntu', 'debian'
		package_name 'openjdk-8-jdk'
		
	end
end

# directory '/usr/local/hadoop' do
# 		action :create
# end


# link '/usr/lib/jvm/java-8-openjdk-amd64' do
# 	to node['java']['java_home']
# 	not_if { node['java']['java_home'] == '/usr/lib/jvm/java-8-openjdk-amd64'}
# end

# tar_extract 'http://apache.claz.org/hadoop/core/stable/hadoop-2.9.0.tar.gz' do
#   target_dir '/usr/local'
#   tar_flags[ '-P', '--strip-components 1']
  # group 'web_admin'
  # mode '0755'
 
#end

tarball = "#{node[:version]}"
download_file = "#{node[:hadoop][:download_url]}/#{tarball}"

remote_file "#{Chef::Config[:file_cache_path]}/#{tarball}" do
  source download_file
  action :create_if_missing
  mode 0644
end

# log 'getInfo' do
# 	message "logging info"
# 	level :debug
# end

# execute 'extracting some file' do
# 	command 'tar xzvf hadoop-1.0.3.tar.gz'
#  cwd '/usr/local'
#  not_if { File.exists?("hadoop")}
# end
# http://apache.claz.org/hadoop/core/stable/hadoop-2.9.0.tar.gz


#usr/lib/jvm/java-8-openjdk-amd64/bin

# execute 'java' do
# 	environment "PATH" => "/usr/lib/jvm/java-8-openjdk-amd64/bin: #{ENV['PATH']}"
# end