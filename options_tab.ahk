#include files.ahk


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

set_options_helper(timeo, pos)
{
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

set_options()
{
  timeo := {}
  generic_code_parser("pp/time_options.i", timeo)
  pos := {}
  generic_code_parser("pp/position_sizing.i", pos)
  set_options_helper(timeo, pos)
}

update_options_helper(ti_vars, pi_vars)
{
  ot_vars := {} ; option tab vars (location of text boxes and check boxes)
  get_options_variables(ot_vars)

  click_options_tab()
  set_check_box_confirm("PRIMU$ - Black", 1, ti_vars["use_time_options"], ot_vars["use_time_options_check_box"], ot_vars["use_time_options_trigger_point"])

  if (ti_vars["start_subscription"] != tbu_vars["start_subscription"])
    set_time_option(ot_vars["start_subscription_trigger_point"], ti_vars["start_subscription"])
  if (ti_vars["start_entering_positions"] != tbu_vars["start_entering_positions"])
    set_time_option(ot_vars["start_entering_positions_trigger_point"], ti_vars["start_entering_positions"])
  if (ti_vars["stop_entering_positions"] != tbu_vars["stop_entering_positions"])
    set_time_option(ot_vars["stop_entering_positions_trigger_point"], ti_vars["stop_entering_positions"])
  if (ti_vars["cancel_all_pending_orders"] != tbu_vars["cancel_all_pending_orders"])
    set_time_option(ot_vars["cancel_all_pending_orders_trigger_point"], ti_vars["cancel_all_pending_orders"])
  if (ti_vars["close_all_open_positions"] != tbu_vars["close_all_open_positions"])
    set_time_option(ot_vars["close_all_open_positions_trigger_point"], ti_vars["close_all_open_positions"])
  if (ti_vars["place_OPG_orders"] != tbu_vars["place_OPG_orders"])
    set_time_option(ot_vars["place_OPG_orders_trigger_point"], ti_vars["place_OPG_orders"])

  set_check_box_confirm("PRIMU$ - Black", 1,pi_vars["enable_position_sizing_scheme"], ot_vars["enable_position_sizing_scheme_check_box"], ot_vars["enable_position_sizing_scheme_trigger_point"])
  if (pi_vars["position_sizing"] != pbu_vars["position_sizing"])
    set_position_sizing_scheme(pi_vars["position_sizing"])
}

update_options(acronym)
{
  ti_path := build_i_path("time_options")
  tbu_path := build_bu_path("time_options", acronym)
  pi_path := build_i_path("position_sizing")
  pbu_path := build_bu_path("position_sizing", acronym)

  ti_vars := {}
  tbu_vars := {}
  pi_vars := {}
  pbu_vars := {}

  generic_code_parser(ti_path, ti_vars)
  generic_code_parser(tbu_path, tbu_vars)
  generic_code_parser(pi_path, pi_vars)
  generic_code_parser(pbu_path, pbu_vars)

  update_options_helper(ti_vars, pi_vars)
}
