 class apache {

	package { 'apache2-mpm-prefork':
		ensure => installed,
		}		
	service { 'apache2':
		ensure => running,
		enable => true,

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


