# == Class drone::config
#
# This class is called from drone
#
class drone::config {

  $datasource = $drone::datasource
  $driver = $drone::driver
  $gitlab_skip_cert_check = $drone::gitlab_skip_cert_check
  $port = $drone::port
  $sslcert = $drone::sslcert
  $sslkey = $drone::sslkey
  $timeout = $drone::timeout
  $workers = $drone::workers

  file {'/etc/default/drone':
    content => template('drone/droneconf.erb');
  }
}
