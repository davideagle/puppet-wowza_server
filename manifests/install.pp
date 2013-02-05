#
#== Class: wowza::install
#
#Installs the wowza package and Java.
class wowza::install {
  $wowza_version = $::wowza::wowza_version

  case $osfamily {
    'RedHat': {
      include wowza::install::redhat
      $wowza_packages     = $wowza::install::redhat::wowza_packages
      $java_pakages       = $wowza::install::redhat::java_packages
    }

    'Debian': {
      include wowza::install::debian
      $wowza_packages     = $wowza::install::debian::wowza_packages
      $java_pakages       = $wowza::install::debian::java_packages
    }

    default: {
      fail("wowza not implemented on $operatingsystem $lsbmajdistrelease")
    }
  }

  package { $wowza_packages:
    ensure => present,
    tag    => 'wowza',
  }

  package { $java_packages:
    ensure  => present,
    tag     => 'java'
  }


  Package <| tag == 'java' |>  ->
  Package <| tag == 'wowza' |>
}
