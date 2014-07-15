# == Class: drone
#
# Full description of class drone here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class drone (
  $datasource = 'drone.sqlite',
  $driver = 'sqlite3',
  $gitlab_skip_cert_check = false,
  $port = 8080,
  $sslcert = undef,
  $sslkey = undef,
  $timeout = '5h0m0s',
  $workers = 4
) inherits drone::params {

  # validate parameters here

  anchor { 'drone::begin': } ->
  class { 'drone::install': } ->
  class { 'drone::config': }
  class { 'drone::service': } ->
  anchor { 'drone::end': }

  Anchor['drone::begin']  ~> Class['drone::service']
  Class['drone::install'] ~> Class['drone::service']
  Class['drone::config']  ~> Class['drone::service']
}
