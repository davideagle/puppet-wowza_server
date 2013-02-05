#
#== Class: wowza::install::debian
#
# Selects if we need any flavor-specific stuff for Debian distros
class wowza::install::debian {
  $wowza_version = $::wowza::wowza_version

  $wowza_packages = "WowzaMediaServer-$wowza_version"
  $java_packages  = 'default-jdk'
}
