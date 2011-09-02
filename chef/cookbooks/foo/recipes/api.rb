#
# Cookbook Name:: glance
# Recipe:: api
#
#

include_recipe "#{@cookbook_name}::common"

foo_service "api"

node[:foo][:monitor][:svcs] <<["foo-api"]

