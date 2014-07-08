# == Class drone::params
#
# This class is meant to be called from drone
# It sets variables according to platform
#
class drone::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'drone'
      $service_name = 'drone'
    }
    'RedHat', 'Amazon': {
      $package_name = 'drone'
      $service_name = 'drone'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
