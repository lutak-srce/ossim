define ossim::suricataunified (
  $interface = $title,
  $datadir   = "$ossim::params::suricata_logdir",
) {
  file {"/etc/ossim/agent/plugins/suricataunified$interface.cfg":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('ossim/suricataunified.cfg.erb'),
    require => Package['ossim-agent'],
  }
}
