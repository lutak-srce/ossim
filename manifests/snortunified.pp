# Define: ossim::snortunified
define ossim::snortunified (
  $interface = $title,
  $datadir   = "$snort::logdir/$title/",
) {

  file {"/etc/ossim/agent/plugins/snortunified${interface}.cfg":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('ossim/snortunified.cfg.erb'),
    require => [
      Package['ossim-agent'],
      File['/etc/ossim/agent/plugins'],
    ],
  }

}
