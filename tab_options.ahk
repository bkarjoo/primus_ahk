#include files.ahk
#include logger.ahk
#include window_black_box_design.ahk
#include check_boxes.ahk


get_options_variables(ops)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ops["use_time_options_check_box"] := [23, 76]
  ops["use_time_options_trigger_point"] := [25,77]

  ops["start_subscription_trigger_point"] := [175,93]
  ops["start_entering_positions_trigger_point"] := [175,118]
  ops["stop_entering_positions_trigger_point"] := [175,142]
  ops["cancel_all_pending_orders_trigger_point"] := [175,166]
  ops["close_all_open_positions_trigger_point"] := [175,189]
  ops["place_OPG_orders_trigger_point"] := [175,211]
  ops["close_box_save_results_trigger_point"] := [175,236]

  ops["enable_position_sizing_scheme_check_box"] := [25, 339]
  ops["enable_position_sizing_scheme_trigger_point"] := [27,341]

  ops["place_MOC_instead_of_close_position_check_box"] := [479,74]
  ops["place_MOC_instead_of_close_position_trigger_point"] := [480,76]
}

set_time_option(trigger_point, time)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  vars := {}
  get_options_variables(vars)

  click_options_tab()
  set_check_box_confirm("PRIMU$ - Black", 1, timeo["use_time_options"], vars["use_time_options_check_box"], vars["use_time_options_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, timeo["place_MOC_instead_of_close_position"], vars["place_MOC_instead_of_close_position_check_box"], vars["place_MOC_instead_of_close_position_trigger_point"])

  set_time_option(vars["start_subscription_trigger_point"], timeo["start_subscription"])
  set_time_option(vars["start_entering_positions_trigger_point"], timeo["start_entering_positions"])
  set_time_option(vars["stop_entering_positions_trigger_point"], timeo["stop_entering_positions"])
  set_time_option(vars["cancel_all_pending_orders_trigger_point"], timeo["cancel_all_pending_orders"])
  set_time_option(vars["close_all_open_positions_trigger_point"], timeo["close_all_open_positions"])
  set_time_option(vars["place_OPG_orders_trigger_point"], timeo["place_OPG_orders"])
  set_time_option(vars["close_box_save_results_trigger_point"], timeo["close_box_save_results"])
  set_check_box_confirm("PRIMU$ - Black", 1,pos["enable_position_sizing_scheme"], vars["enable_position_sizing_scheme_check_box"], vars["enable_position_sizing_scheme_trigger_point"])
  set_position_sizing_scheme(pos["position_sizing"])
}

set_options()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  timeo := {}
  generic_code_parser("pp/time_options.i", timeo)
  pos := {}
  generic_code_parser("pp/position_sizing.i", pos)
  set_options_helper(timeo, pos)
}

options_vars_changed(ti_vars, pi_vars, tbu_vars, pbu_vars)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (ti_vars["use_time_options"] != tbu_vars["use_time_options"])
    return 1
  if (ti_vars["start_subscription"] != tbu_vars["start_subscription"])
    return 1
  if (ti_vars["start_entering_positions"] != tbu_vars["start_entering_positions"])
    return 1
  if (ti_vars["stop_entering_positions"] != tbu_vars["stop_entering_positions"])
    return 1
  if (ti_vars["cancel_all_pending_orders"] != tbu_vars["cancel_all_pending_orders"])
    return 1
  if (ti_vars["close_all_open_positions"] != tbu_vars["close_all_open_positions"])
    return 1
  if (ti_vars["place_OPG_orders"] != tbu_vars["place_OPG_orders"])
    return 1
  if (ti_vars["close_box_save_results"] != tbu_vars["close_box_save_results"])
    return 1
  if (ti_vars["place_MOC_instead_of_close_position"] != tbu_vars["place_MOC_instead_of_close_position"])
    return 1
  if (pi_vars["enable_position_sizing_scheme"] != pbu_vars["enable_position_sizing_scheme"])
    return 1
  if (pi_vars["position_sizing"] != pbu_vars["position_sizing"])
    return 1

  return 0
}

update_options_helper(ti_vars, pi_vars, tbu_vars, pbu_vars)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (!options_vars_changed(ti_vars, pi_vars, tbu_vars, pbu_vars))
    return

  ot_vars := {} ; option tab vars (location of text boxes and check boxes)
  get_options_variables(ot_vars)

  click_options_tab()
  set_check_box_confirm("PRIMU$ - Black", 1, ti_vars["use_time_options"], ot_vars["use_time_options_check_box"], ot_vars["use_time_options_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, ti_vars["place_MOC_instead_of_close_position"], ot_vars["place_MOC_instead_of_close_position_check_box"], ot_vars["place_MOC_instead_of_close_position_trigger_point"])

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
  if (ti_vars["close_box_save_results"] != tbu_vars["close_box_save_results"])
    set_time_option(ot_vars["close_box_save_results_trigger_point"], ti_vars["close_box_save_results"])


  set_check_box_confirm("PRIMU$ - Black", 1,pi_vars["enable_position_sizing_scheme"], ot_vars["enable_position_sizing_scheme_check_box"], ot_vars["enable_position_sizing_scheme_trigger_point"])
  if (pi_vars["position_sizing"] != pbu_vars["position_sizing"])
    set_position_sizing_scheme(pi_vars["position_sizing"])
}

update_options(name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ti_path := build_i_path("time_options")
  tbu_path := build_bu_path("time_options", name)
  pi_path := build_i_path("position_sizing")
  pbu_path := build_bu_path("position_sizing", name)

  ti_vars := {}
  tbu_vars := {}
  pi_vars := {}
  pbu_vars := {}

  generic_code_parser(ti_path, ti_vars)
  generic_code_parser(tbu_path, tbu_vars)
  generic_code_parser(pi_path, pi_vars)
  generic_code_parser(pbu_path, pbu_vars)

  update_options_helper(ti_vars, pi_vars, tbu_vars, pbu_vars)
}
