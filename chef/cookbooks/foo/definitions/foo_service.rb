define :foo_service do

  foo_name="foo-#{params[:name]}"

  service foo_name do
    if (platform?("ubuntu") && node.platform_version.to_f >= 10.04)
      restart_command "restart #{foo_name}"
      stop_command "stop #{foo_name}"
      start_command "start #{foo_name}"
      status_command "status #{foo_name} | cut -d' ' -f2 | cut -d'/' -f1 | grep start"
    end
    supports :status => true, :restart => true
    action [:enable, :start]
    subscribes :restart, resources(:template => node[:foo][:config_file])
  end

end
