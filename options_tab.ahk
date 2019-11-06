
use_time_options_check_box := [17,65]
use_time_options_trigger_point := [27,75]

start_subscription_trigger_point := [180,106]
start_entering_positions_trigger_point := [180,139]
stop_entering_positions_trigger_point := [180,174]
cancel_all_pending_orders_trigger_point := [180,207]
close_all_open_positions_trigger_point := [180,238]
place_OPG_orders_trigger_point := [180,274]

set_time_option(trigger_point, time)
{
  time := Trim(time)

  tokens := StrSplit(time, " ")
  meridiem := tokens[2]
  tokens := StrSplit(tokens[1], ":")
  hour := tokens[1]
  minute := tokens[2]
  second := tokens[3]
  MouseClick, Left, trigger_point[1], trigger_point[2]
  Send, %hour%
  sleep, 100
  Send, {Right}
  sleep, 100
  Send, %minute%
  sleep, 100
  Send, {Right}
  sleep, 100
  Send, %second%
  sleep, 100
  Send, {Right}
  sleep, 100
  Send, %meridiem%
  sleep, 100
}

; position sizing section
enable_position_sizing_scheme_check_box := [19,346]
enable_position_sizing_scheme_trigger_point := [27,351]

set_position_sizing_scheme(code)
{
  sleep, 100
  MouseClick, Left, 200, 400
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := code
  sleep, 100
  Send, ^v
  sleep, 100
}
