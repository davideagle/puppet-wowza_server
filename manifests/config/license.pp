#
#== Class: wowza::config::license
#
#Configures wowza license
#
class wowza::config::license {
  $licensekey          = $::wowza::licensekey
  $licensesource       = $::wowza::licensesource

  file { '/usr/local/WowzaMediaServer':
    ensure   => link,
    target   => "/usr/local/WowzaMediaServer-$wowza_version",
    owner    => 'root',
    group    => 'root',
    mode     => '0777',
    tag      => 'wowza',
  }

  file { '/usr/local/WowzaMediaServer/conf/Server.license':
    ensure   => present,
    source   => $licensesource,
    content  => $licensekey,
    owner    => 'root',
    group    => 'root',
    mode     => '0400',
    tag      => 'wowza',
  }

  File [ '/usr/local/WowzaMediaServer' ] ->
  File [ '/usr/local/WowzaMediaServer/conf/Server.license'
}
