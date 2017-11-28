# == Class: apache
#
# === Examples
#
#  class { 'apache':
#    servername      => 'www.example.com',
#  }
#
# === Authors
#
# Aneesh C <aneeshchandrasekharan@gmail.com>
#

class apache (
  $package_name                = $::apache::params::package_name,
  $configfile                  = $::apache::params::configfile,
  $template                    = 'apache/configfile.erb',
  $serverroot                  = undef,
  $listen                      = [],
  $user                        = undef,
  $group                       = undef,
  $serveradmin                 = undef,
  $servername                  = undef,
  $directory                   = [],
  $documentroot                = undef,
  $directoryindex              = undef,
  $files                       = [],
  $errorlog                    = undef,
  $log_level                   = undef,
  $logformat                   = [],
  $customlog                   = undef,
  $alias                       = [],
  $scriptalias                 = undef,
  $typesconfig                 = undef,
  $addhandler                  = undef,
  $addtype                     = [],
  $addoutputfilter             = undef,
  $adddefaultcharset           = undef,
  $mimemagicfile               = undef,
  $enablesendfile              = undef,
  $servertokens                = undef,
  $pidfile                     = undef,
  $timeout                     = undef,
  $keepalive                   = undef,
  $maxkeepaliverequests        = undef,
  $keepalivetimeout            = undef,
  $prefork_module              = undef,
  $prefork_startservers        = undef,
  $prefork_minspareservers     = undef,
  $prefork_maxspareservers     = undef,
  $prefork_serverlimit         = undef,
  $prefork_maxclients          = undef,
  $prefork_maxrequestsperchild = undef,
  $worker_module               = undef,
  $worker_startservers         = undef,
  $worker_maxclients           = undef,
  $worker_minsparethreads      = undef,
  $worker_maxsparethreads      = undef,
  $worker_threadsperchild      = undef,
  $worker_maxrequestsperchild  = undef,
  $worker_threadlimit          = undef,
  $event_module                = undef,
  $event_startservers          = undef,
  $event_minsparethreads       = undef,
  $event_maxsparethreads       = undef,
  $event_threadlimit           = undef,
  $event_threadsperchild       = undef,
  $event_maxclients            = undef,
  $event_maxrequestsperchild   = undef,
  $loadmodule                  = undef,
  $usecanonicalname            = undef,
  $userdir                     = undef,
  $accessfilename              = undef,
  $defaulttype                 = undef,
  $hostnamelookups             = undef,
  $serversignature             = undef,
  $davlockdb                   = undef,
  $indexoptions                = undef,
  $addiconbyencoding           = undef,
  $addiconbytype               = [],
  $addicon                     = [],
  $defaulticon                 = undef,
  $readmename                  = undef,
  $headername                  = undef,
  $indexignore                 = undef,
  $addlanguage                 = [],
  $languagepriority            = undef,
  $forcelanguagepriority       = undef,
  $browsermatch                = [],
  $lockfile                    = undef,
  $namevirtualhost             = undef,
  $mutex_file                  = undef,
  $filesmatch                  = [],
  $traceenable                 = undef,
  $define                      = undef,
  $dnssdenable                 = undef,
  $fileetag                    = undef,
  $include                     = [],
  $includeoptional             = [],
  $defaultruntimedir           = undef,
) inherits ::apache::params {
  package { $package_name: ensure => installed }
  file { $configfile:
    require => Package[$package_name],
    backup  => '.backup',
    content => template($template),
  }
  exec { '/bin/mv /etc/httpd/conf.d/mod_dnssd.conf /etc/httpd/conf.d/mod_dnssd.conf.backup':
    onlyif => 'test -f /etc/httpd/conf.d/mod_dnssd.conf',
    path   => ['/usr/bin','/usr/sbin','/bin','/sbin'],
  }
  exec { '/bin/mv /etc/apache2/conf-enabled/charset.conf /etc/apache2/conf-enabled/charset.conf.backup':
    onlyif => 'test -f /etc/apache2/conf-enabled/charset.conf',
    path   => ['/usr/bin','/usr/sbin','/bin','/sbin'],
  }
  exec { '/bin/mv /etc/apache2/conf-enabled/other-vhosts-access-log.conf /etc/apache2/conf-enabled/other-vhosts-access-log.conf.backup':
    onlyif => 'test -f /etc/apache2/conf-enabled/other-vhosts-access-log.conf',
    path   => ['/usr/bin','/usr/sbin','/bin','/sbin'],
  }
  exec { '/bin/mv /etc/apache2/conf-enabled/serve-cgi-bin.conf /etc/apache2/conf-enabled/serve-cgi-bin.conf.backup':
    onlyif => 'test -f /etc/apache2/conf-enabled/serve-cgi-bin.conf',
    path   => ['/usr/bin','/usr/sbin','/bin','/sbin'],
  }
  exec { '/bin/mv /etc/apache2/conf-enabled/localized-error-pages.conf /etc/apache2/conf-enabled/localized-error-pages.conf.backup':
    onlyif => 'test -f /etc/apache2/conf-enabled/localized-error-pages.conf',
    path   => ['/usr/bin','/usr/sbin','/bin','/sbin'],
  }
  exec { '/bin/mv /etc/apache2/conf-enabled/security.conf /etc/apache2/conf-enabled/security.conf.backup':
    onlyif => 'test -f /etc/apache2/conf-enabled/security.conf',
    path   => ['/usr/bin','/usr/sbin','/bin','/sbin'],
  }
  if $::osfamily == 'RedHat' {
    service { 'httpd':
      require => Package[$package_name],
      enable  => true,
    }
  }
}
