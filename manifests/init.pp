#
#== Class: wowza_server
#
#Installs the wowza_server package
#
class wowza_server(
  $licensekey          = undef,
  $licensesource       = undef,
  $wowza_server_version       = $wowza_server::params::wowza_server_version,
) inherits wowza_server::params {

  if ( ! ($licensekey or $licensesource) ) {
    fail('Please set a licensekey or licensesource for wowza_server!')
  }
  elsif ( $licensekey and $licensesource ) {
    fail("wowza_server:  licensekey or licensesource.  Chose one.")
  }

  include wowza_server::install
  include wowza_server::config
  include wowza_server::service

  Class['wowza_server::install'] ->
  Class['wowza_server::config']  ->
  Class['wowza_server::service']
}
