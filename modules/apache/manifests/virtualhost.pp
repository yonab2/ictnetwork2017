define apache::virtualhost (
  $package_name          = $::apache::params::package_name,
  $sitesdir              = $::apache::params::sitesdir,
  $template              = 'apache/virtualhost.erb',
  $filename              = undef,
  $listen                = undef,
  $serveradmin           = undef,
  $documentroot          = undef,
  $servername            = undef,
  $serveralias           = undef,
  $errorlog              = undef,
  $customlog             = undef,
  $redirect              = undef,
  $sslengine             = undef,
  $sslcertificatefile    = undef,
  $sslcertificatekeyfile = undef,
  $proxyrequests         = undef,
  $proxypreservehost     = undef,
  $proxypass             = undef,
  $proxypassreverse      = undef,
) {
  include apache::params
  if ! defined(File["${sitesdir}/sites-available"]) {
    file { "${sitesdir}/sites-available":
      ensure  => directory,
      require => Package[$package_name],
    }
    file { "${sitesdir}/sites-enabled":
      ensure  => directory,
      require => Package[$package_name],
    }
  }
  file { "${sitesdir}/sites-available/${filename}":
    require => Package[$package_name],
    content => template($template),
  }
}
