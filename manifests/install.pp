#
#== Class: wowza_server::install
#
#Installs the wowza_server package and Java.
class wowza_server::install {
  $wowza_server_version = $::wowza_server::wowza_server_version

  case $osfamily {
    'RedHat': {
      include wowza_server::install::redhat
      $wowza_server_packages = $wowza_server::install::redhat::wowza_server_packages
      $java_pakages          = $wowza_server::install::redhat::java_packages
    }

    'Debian': {
      include wowza_server::install::debian
      $wowza_server_packages = $wowza_server::install::debian::wowza_server_packages
      $java_pakages          = $wowza_server::install::debian::java_packages
    }

    default: {
      fail("wowza_server not implemented on $operatingsystem $lsbmajdistrelease")
    }
  }

  package { $wowza_server_packages:
    ensure => present,
    tag    => 'wowza_server',
  }

  package { $java_packages:
    ensure  => present,
    tag     => 'java'
  }

}
