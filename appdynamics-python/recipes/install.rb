#
# Cookbook Name:: appdynamics-python
# Recipe:: install
#
# Copyright 2014, AppDynamics Inc
#
# All rights reserved - Do Not Redistribute
#

virtualenv = node[:virtualenv]
AppDlocal = node[:AppDlocal]

if node[:AppDremoteURL]
  remote_file "/tmp/#{node[:AppDremoteFileName]}" do
    source node[:AppDremoteURL]
  end
  AppDlocal = "/tmp/#{node[:AppDremoteFileName]}"
end

if AppDlocal 
   python_pip AppDlocal do
      options "--pre" 
      virtualenv virtualenv if virtualenv
      action :install
   end
else 
   python_pip "appdynamics" do
      virtualenv virtualenv if virtualenv
      action :install
   end
end


template node[:appdynamics][:configfile]  do
	source "appdynamics.cfg.erb"
end
