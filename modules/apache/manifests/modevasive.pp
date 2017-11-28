class apache::modevasive (
  $packagename_modevasive = $::apache::params::packagename_modevasive,
  $configfile_modevasive  = $::apache::params::configfile_modevasive,
  $template_modevasive    = 'apache/modevasive.erb',
  $loadmodule             = [],
  $ifmodule               = undef,
  $doshashtablesize       = undef,
  $dospagecount           = undef,
  $dossitecount           = undef,
  $dospageinterval        = undef,
  $dossiteinterval        = undef,
  $dosblockingperiod      = undef,
  $dosemailnotify         = undef,
  $doslogdir              = undef,
  $doswhitelist           = [],
){
  package { $packagename_modevasive: ensure => installed }
  file { $configfile_modevasive:
    require => Package[$packagename_modevasive],
    backup  => '.backup',
    content => template($template_modevasive),
  }
}
