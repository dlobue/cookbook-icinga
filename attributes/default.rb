
default.icinga.conf_root_dir = '/etc/icinga'
default.icinga.conf_dir = File.join(icinga.conf_root_dir, 'objects')
default.icinga.cmd_dir = '/var/lib/icinga/rw'

default.icinga.cmd_file = File.join(icinga.cmd_dir, 'icinga.cmd')

default.icinga.contact_email = 'root@localhost'

#these don't really go in the objects dir
default.icinga.conf.icinga = File.join(icinga.conf_root_dir, 'icinga.cfg')
default.icinga.conf.resource = File.join(icinga.conf_root_dir, 'resource.cfg')
default.icinga.conf.htpasswd = File.join(icinga.conf_root_dir, 'htpasswd.users')

#these go in the objects conf dir
default.icinga.conf.generated_servers = File.join(icinga.conf_dir, 'generated_servers.cfg')
default.icinga.conf.generated_services = File.join(icinga.conf_dir, 'generated_services.cfg')
default.icinga.conf.contacts = File.join(icinga.conf_dir, 'contacts_icinga.cfg')

default.icinga.custom_plugins.dir = '/etc/icinga-plugins'
default.icinga.custom_plugins.repo = 'git://github.com/dlobue/icinga-plugins.git'
default.icinga.custom_plugins.revision = 'master'

#hack to make sure that chef always generates hostgroups for the following traits
default.icinga.hostgroup_traits = []

