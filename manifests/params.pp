# Class: ossim::params
#
#   The ossim configuration settings.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class ossim::params {
  $package_ensure      = 'present'
  $agent_id            = '127.0.0.1'
  $server_ip           = '127.0.0.1'
  $sensor_ip           = '127.0.0.1'
#  $timezone            = $::timezone
  $timezone            = 'Europe/Zagreb'
  $include_snort       = false
  $include_suricata    = false
  $suricata_interfaces = undef
  $suricata_logdir     = '/data/suricata/logs/'
  $include_ossec       = false
  $verbose             = 'error'
}
