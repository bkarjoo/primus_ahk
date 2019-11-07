
get_options_variables(ops)
{
  ops["use_time_options_check_box"] := [17,65]
  ops["use_time_options_trigger_point"] := [27,75]
  ops["start_subscription_trigger_point"] := [180,106]
  ops["start_entering_positions_trigger_point"] := [180,139]
  ops["stop_entering_positions_trigger_point"] := [180,174]
  ops["cancel_all_pending_orders_trigger_point"] := [180,207]
  ops["close_all_open_positions_trigger_point"] := [180,238]
  ops["place_OPG_orders_trigger_point"] := [180,274]
  ops["enable_position_sizing_scheme_check_box"] := [19,346]
  ops["enable_position_sizing_scheme_trigger_point"] := [27,351]
}

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

set_options()
{
  timeo := {}
  generic_code_parser("pp/time_options.i", timeo)
  pos := {}
  generic_code_parser("pp/position_sizing.i", pos)
  vars := {}
  get_options_variables(vars)

  click_options_tab()
  set_check_box_confirm("PRIMU$ - Black", 1, timeo["use_time_options"], vars["use_time_options_check_box"], vars["use_time_options_trigger_point"])
  set_time_option(vars["start_subscription_trigger_point"], timeo["start_subscription"])
  set_time_option(vars["start_entering_positions_trigger_point"], timeo["start_entering_positions"])
  set_time_option(vars["stop_entering_positions_trigger_point"], timeo["stop_entering_positions"])
  set_time_option(vars["cancel_all_pending_orders_trigger_point"], timeo["cancel_all_pending_orders"])
  set_time_option(vars["close_all_open_positions_trigger_point"], timeo["close_all_open_positions"])
  set_time_option(vars["place_OPG_orders_trigger_point"], timeo["place_OPG_orders"])
  set_check_box_confirm("PRIMU$ - Black", 1,pos["enable_position_sizing_scheme"], vars["enable_position_sizing_scheme_check_box"], vars["enable_position_sizing_scheme_trigger_point"])
  set_position_sizing_scheme(pos["position_sizing"])
}

set_risk_management()
{
  rm := {}
  generic_code_parser("pp/risk_management.i", rm)
  vars := {}
  get_risk_management_tab_vars(vars)

  click_risk_management_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,rm["enable_black_box_risk_management"], vars["enable_black_box_risk_management_check_box"], vars["enable_black_box_risk_management_trigger_point"])
  set_maximum_order_shares(rm["maximum_order_shares"])
}
