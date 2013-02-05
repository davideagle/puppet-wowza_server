#
#== Class: wowza
#
#Installs the wowza package
#
class wowza(
  $licensekey          = undef,
  $licensesource       = undef,
  $wowza_version       = $wowza::params::wowza_version,
) inherits wowza::params {

  if ( ! ($licensekey or $licensesource) ) {
    fail('Please set a licensekey or licensesource for Wowza!')
  }
  elsif ( $licensekey and $licensesource ) {
    fail("Wowza:  licensekey or licensesource.  Chose one.")
  }

  include wowza::install
  include wowza::config
  include wowza::service

  Class['wowza::install'] ->
  Class['wowza::config']  ->
  Class['wowza::service']
}
