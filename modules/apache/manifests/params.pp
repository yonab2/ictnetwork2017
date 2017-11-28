class apache::params {
  if $::osfamily == 'RedHat' {
    $package_name = [ 'httpd' ]
    $packagename_modsecurity = [ 'mod_security' ]
    $packagename_modevasive = [ 'mod_evasive' ]
    $configfile = '/etc/httpd/conf/httpd.conf'
    $configfile_modsecurity  = '/etc/httpd/conf.d/mod_security.conf'
    $configfile_modevasive  = '/etc/httpd/conf.d/mod_evasive.conf'
    $sitesdir = '/etc/httpd/'
  }
  elsif $::osfamily == 'Debian' {
    $package_name = [ 'apache2' ]
    $packagename_modsecurity = [ 'libapache2-modsecurity' ]
    $packagename_modevasive = [ 'libapache2-mod-evasive' ]
    $configfile = '/etc/apache2/apache2.conf'
    $configfile_modsecurity = '/etc/modsecurity/modsecurity.conf'
    $sitesdir = '/etc/apache2/'
    if $::operatingsystem == 'Ubuntu' {
      case $::operatingsystemrelease {
        /^12.*/: {
          $configfile_modevasive = '/etc/apache2/mods-available/mod-evasive.conf'
        }
        /^14.*/: {
          $configfile_modevasive = '/etc/apache2/mods-available/evasive.conf'
        }
        /^16.*/: {
          $configfile_modevasive = '/etc/apache2/mods-available/evasive.conf'
        }
        default: {
          $configfile_modevasive = '/etc/apache2/mods-available/mod-evasive.conf'
        }
      }
    }
    elsif $::operatingsystem == 'Debian' {
      case $::operatingsystemrelease {
        /^7.*/: {
          $configfile_modevasive = '/etc/apache2/mods-available/mod-evasive.conf'
        }
        /^8.*/: {
          $configfile_modevasive = '/etc/apache2/mods-available/evasive.conf'
        }
        /^9.*/: {
          $configfile_modevasive = '/etc/apache2/mods-available/evasive.conf'
        }
        default: {
          $configfile_modevasive = '/etc/apache2/mods-available/mod-evasive.conf'
        }
      }
    }
  }
}

