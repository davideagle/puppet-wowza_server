#
#== Class: wowza_server::install::debian
#
# Selects if we need any flavor-specific stuff for Debian distros
class wowza_server::install::debian {
  $wowza_server_version = $::wowza_server::wowza_server_version

  $wowza_server_packages = "wowzaMediaServer-$wowza_server_version"
  $java_packages  = 'default-jdk'
}
