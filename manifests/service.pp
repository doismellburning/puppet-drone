# == Class drone::service
#
# This class is meant to be called from drone
# It ensure the service is running
#
class drone::service {
  include drone::params

  service { $drone::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
