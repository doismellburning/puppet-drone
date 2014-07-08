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
