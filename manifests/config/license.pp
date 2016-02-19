#
#== Class: wowza_server::config::license
#
#Configures wowza_server license
#
class wowza_server::config::license {
  $licensekey          = $::wowza_server::licensekey
  $licensesource       = $::wowza_server::licensesource

  file { '/usr/local/wowzaMediaServer':
    ensure   => link,
    target   => "/usr/local/wowzaMediaServer-$wowza_server_version",
    owner    => 'root',
    group    => 'root',
    mode     => '0777',
    tag      => 'wowza_server',
  }

  file { '/usr/local/wowzaMediaServer/conf/Server.license':
    ensure   => present,
    source   => $licensesource,
    content  => $licensekey,
    owner    => 'root',
    group    => 'root',
    mode     => '0400',
    tag      => 'wowza_server',
    require  => File['/usr/local/wowzaMediaServer'],
  }
}
