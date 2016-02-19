#
#== Class: wowza_server::service
#
# Starts the wowza_server service
#
class wowza_server::service { 
  service { 'wowzaMediaServer':
    ensure    => running,
    hasstatus => true,
    enable    => true,
    tag       => 'wowza_server',
  }

  Package <| tag == 'wowza_server' |> ->
  Service <| tag == 'wowza_server' |>

  File <| tag == 'wowza_server' |>    ->
  Service <| tag == 'wowza_server' |>

  File <| tag == 'wowza_server' |>    ~>
  Service <| tag == 'wowza_server' |>
}
