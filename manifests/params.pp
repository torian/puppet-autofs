
class autofs::params {

  case $::osfamily {
  
    'Debian' : {
    
      $package = 'autofs'
      $service = 'autofs'
      $pattern = 'automount'

      $master_cfg  = '/etc/auto.master'
      $prefix_maps = '/etc'
    }
    
    'Redhat' : {

      $package = 'autofs'
      $service = 'autofs'
      $pattern = 'automount'
    
      $master_cfg  = '/etc/auto.master'
      $prefix_maps = '/etc'
    }

    'Suse' : {
    
      $package = 'autofs'
      $service = 'autofs'
      $pattern = 'automount'

      $master_cfg  = '/etc/auto.master'
      $prefix_maps = '/etc'
    }

    default : {
      fail("Operating system ${::operatingsystem} (${::osfamily}) not supported")
    }
  }

}

