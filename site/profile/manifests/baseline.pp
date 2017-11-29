class profile::baseline {

	  notice('profile::baseline')

		include vim
		class { 'ntp':
    		server_list => [ 'Ambou.edu.et','0.be.pool.ntp.org' ],
		}

	 	class { 'resolv_conf':
    		nameservers => ['8.8.8.8'],
    		searchpath  => ['Google.com'],
		}
	
		class { 'apt':
	   		 update => {
      		'frequency' => 'always',
    			},
    			purge  => {
      		'sources.list'   => true,
      		'sources.list.d' => true,
      		'preferences'    => true,
      		'preferences.d'  => true,
    			},
  		}

  		apt::source { 'puppetlabs':
    		location => 'http://apt.puppetlabs.com',
    		repos    => 'puppet5',
   			 key      => {
      		'id'     => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
      		'server' => 'pgp.mit.edu',
    			},
  		}

  if($facts[operatingsystem] == 'Debian') {
    apt::source { 'debian':
      ensure   => 'present',
      location => 'http://ftp.be.debian.org/debian',
      repos    => 'main non-free contrib',
    }

  }

  package {'net-tools':
	ensure => installed,
  }
}
