# == Class drone::install
#
class drone::install {
  include drone::params

  package { $drone::params::package_name:
    ensure => present,
  }
}
