
class autofs(
  $enable_motd = false,
  $ensure      = present) {

  include autofs::params
  include stdlib
  
  if($enable_motd) {
    motd::register { 'autofs': }
  }

  package { $autofs::params::package:
    ensure => $ensure,
  }

  file { $autofs::params::master_cfg:
    ensure => $ensure,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  service { $autofs::params::service:
    pattern => $autofs::params::pattern,
    require => File[$autofs::params::master_cfg],
    enable  => $ensure ? {
                present => true,
                latest  => true,
                default => false,
              },
    ensure  => $ensure ? {
                present => running,
                latest  => running,
                default => false,
              },
  
  }

}
