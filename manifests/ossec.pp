class ossim::ossec {
  $osseclog = '/var/ossec/logs/alerts/alerts.log'
  file { '/etc/ossim/agent/plugins/ossec.cfg':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('ossim/ossec.cfg.erb'),
    require => Package['ossim-agent'],
  }
}
