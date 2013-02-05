#
#== Class: wowza::service
#
# Starts the wowza service
#
class wowza::service { 
  service { 'WowzaMediaServer':
    ensure    => running,
    hasstatus => true,
    enable    => true,
    tag       => 'wowza',
  }

  Package <| tag == 'wowza' |> ->
  Service <| tag == 'wowza' |>

  File <| tag == 'wowza' |>    ->
  Service <| tag == 'wowza' |>

  File <| tag == 'wowza' |>    ~>
  Service <| tag == 'wowza' |>
}
