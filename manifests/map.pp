
define autofs::map(
  $key,
  $prefix,
  $location,
  $options = '-fstype=nfs,rw',
  $ensure  = present) {

  include autofs::params

  $fname = "${autofs::params::prefix_maps}/auto.${name}"
  $fline = "auto.master - ${name}"

  File[$fname] -> Class['autofs']

  #if(! is_array($key) and is_array($location)) {
  #  fail('If location is specified as an array, key must be as well')
  #} elsif(is_array($key) and ! is_array($location)) {
  #  fail('If key is specified as an array, location must be as well')
  #}

  if(is_array($key) and is_array($location)) {
    $mount_points = hash(zip($key, $location))
  } else {
    $mount_points = hash([ $key, $location ])
  }

  file { $fname:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('autofs/map.erb'),
  }

  file_line { $fline:
    ensure  => $ensure,
    path    => $autofs::params::master_cfg,
    line    => "${prefix}    ${autofs::params::prefix_maps}/auto.${name}",
    notify  => Service[$autofs::params::service],
    require => File[$fname]
  }

}
