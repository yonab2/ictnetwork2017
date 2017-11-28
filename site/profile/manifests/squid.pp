class profile::squid {

	class { 'squid': }

	squid::http_port { '8080': }

#	squid::acl { 'Safe_ports':
#  		type    => port,
#  		entries => ['80'],
#	}
#
#	squid::http_access { 'Safe_ports':
#		action => allow,
#	}
#
#	squid::http_access{ '!Safe_ports':
#  		action => deny,
#	}	

}

