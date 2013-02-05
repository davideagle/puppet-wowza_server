#
#== Class: wowza::install::redhat
#
# Selects if we need any flavor-specific stuff for Redhat distros
class wowza::install::redhat {
  $wowza_version = $::wowza::wowza_version

  $wowza_packages = "WowzaMediaServer-$wowza_version"
  $java_packages  = 'java-1.7.0-openjdk'
}
