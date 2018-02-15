#
# = Class: ossim
#
# This module manages ossim agent
#
class ossim (
  $package_ensure   = $ossim::params::package_ensure,
  $agent_id         = $ossim::params::agent_id,
  $server_ip        = $ossim::params::server_ip,
  $sensor_ip        = $ossim::params::sensor_ip,
  $timezone         = $ossim::params::timezone,
  $include_snort    = $ossim::params::include_snort,
  $include_suricata = $ossim::params::include_suricata,
  $include_ossec    = $ossim::params::include_ossec,
  $verbose          = $ossim::params::verbose,
) inherits ossim::params {

  if $include_snort == true {
    include ::snort
    $snort_interfaces = $::snort::interfaces
    ::ossim::snortunified{$snort_interfaces: }
  }

  if $include_suricata == true {
    include ::suricata
    $suricata_interfaces = $::suricata::interfaces
    suricataunified{$suricata_interfaces: }
  }

  if $include_ossec == true {
    include ::ossim::ossec
  }

  package { 'ossim-agent':
    ensure  => $package_ensure,
  }

  file { '/etc/ossim/agent/config.cfg':
    ensure  => file,
    content => template('ossim/config.cfg.erb'),
    require => Package['ossim-agent'],
  }

  file { '/etc/ossim/agent/plugins':
    ensure => directory,
  }

  service { 'ossim-agent':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/ossim/agent/config.cfg'],
  }

}
