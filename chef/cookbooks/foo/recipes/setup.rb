#
# Cookbook Name:: foo
# Recipe:: setup
#

include_recipe "#{@cookbook_name}::common"

bash "tty linux setup" do
  cwd "/tmp"
  user "root"
  code <<-EOH
	mkdir -p /var/lib/foo/
	curl #{node[:foo][:tty_linux_image]} | tar xvz -C /tmp/
	touch /var/lib/foo/tty_setup
  EOH
  not_if do File.exists?("/var/lib/foo/tty_setup") end
end
