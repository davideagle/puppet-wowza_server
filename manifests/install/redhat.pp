#
#== Class: wowza_server::install::redhat
#
# Selects if we need any flavor-specific stuff for Redhat distros
class wowza_server::install::redhat {
  $wowza_server_version = $::wowza_server::wowza_server_version

  $wowza_server_packages = "wowzaMediaServer-$wowza_server_version"
  $java_packages  = 'java-1.7.0-openjdk'
}
