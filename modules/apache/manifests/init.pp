 class apache {

	package { 'apache':
		ensure => present,
		}		


	file { '/var/www':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => '0775', # allow Puppet to re-write files as needed on Windows
        	}	

	file { '/var/www/index.html':
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0664', # allow Puppet to re-write files as needed on Windows
		source => 'puppet:///modules/apache/index.html',
		}
	     }


