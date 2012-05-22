
include_recipe "icinga::plugins"

package "icinga" do
    response_file "icinga.seed"
    options "--install-recommends"
end

cookbook_file node.icinga.conf.htpasswd do
    source "htpasswd.users"
    mode '0644'
end

template node.icinga.conf.icinga do
    source "icinga.cfg.erb"
    mode "0644"
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

template node.icinga.conf.resource do
    source "resource.cfg.erb"
    mode "0644"
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end


template node.icinga.conf.generated_services do
    source "generated_services.cfg.erb"
    mode "0644"
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

template node.icinga.conf.generated_servers do
    source "generated_servers.cfg.erb"
    mode "0644"
    variables(
        :servers => fakesearch_all_nodes(:deployment => nil, :state => 'available', :fqdn => '*'),
        :hostgroups => Set.new(node.icinga.hostgroup_traits)
    )
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

template node.icinga.conf.contacts do
    source "contacts.cfg.erb"
    mode "0644"
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

file File.join(node.icinga.conf_dir, 'hostgroups_icinga.cfg') do
    action :delete
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

file File.join(node.icinga.conf_dir, 'services_icinga.cfg') do
    action :delete
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

file File.join(node.icinga.conf_dir, 'extinfo_icinga.cfg') do
    action :delete
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

file File.join(node.icinga.conf_dir, 'localhost_icinga.cfg') do
    action :delete
    notifies :reload, 'service[icinga]' if node.mongodb.ismaster
end

service "icinga" do
    #action node.mongodb.ismaster ? [:start, :disable] : [:stop, :disable]
    action [:start, :disable]
    supports :restart => true, :reload => true, :status => true
end

service "apache2" do
    #action node.mongodb.ismaster ? [:start, :disable] : [:stop, :disable]
    action [:start, :disable]
    supports :restart => true, :reload => true, :status => true
end


directory node.icinga.cmd_dir do
    only_if { File.exists? node.icinga.cmd_dir }
    owner 'nagios'
    group 'www-data'
    mode '0770'
end

file node.icinga.cmd_file do
    only_if { File.exists? node.icinga.cmd_file }
    owner 'nagios'
    group 'www-data'
    mode '0660'
end

