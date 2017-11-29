class profile::squid {

	class { 'squid': }

	squid::http_port { '8080': }

	
	squid::cache_dir { '/data':
		  type           => 'ufs',
  		  options        => '15000 32 256 min-size=32769',
  		  process_number => 2,
	}	
	
	squid::acl {'localnet':
		type => 'src',
		entries => ['10.7.100.0/255.255.255.0'],
	}

	squid::http_access {'localnet':
		action => allow,
	}	
	
	squid::http_access {'all':
		action => deny,
	}
	
}

