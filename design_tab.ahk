#include wait_policy.ahk
#include inform.ahk
#include files.ahk

update_box_name(box_name)
{
  click_design_tab()
  MouseClick, Left, 252, 63
  Send, ^a
  sleep, 100
  Clipboard := box_name
  sleep, 100
  Send, ^v
  sleep, 100
}

update_box_description(desc)
{
  click_design_tab()
  MouseClick, Left, 325, 125
  Send, ^a
  sleep, 100
  Clipboard := desc
  sleep, 100
  Send, ^v
  sleep, 100
}

set_black_box_side(side)
{
  click_design_tab()
  MouseClick, Left, 200, 160
  sleep, 100
  if (side = "LONG")
    send, {Up}
  else if (side = "SHORT")
    send, {Down}
}

set_black_box_scheme(scheme)
{
  click_design_tab()
  MouseClick, Left, 285, 190
  sleep, 100
  if (scheme = "OPG")
    MouseClick, Left, 285, 221
  else
    MouseClick, Left, 285, 206
}


entry_confirm_trigger(rule)
{
  click_design_tab()
  MouseClick, Left, 450, 300
  Send, ^a
  sleep, 200
  Send, ^c
  sleep, 200
  return Clipboard = rule
}

entry_update_trigger(rule)
{
  click_design_tab()
  MouseClick, Left, 450, 300
  Send, ^a
  Clipboard := rule
  sleep, 200
  Send, ^v
  sleep, 200
  if (entry_confirm_trigger(rule))
    return 1
  else
    return 0
}

entry_open_new_order()
{
  click_design_tab()
  MouseClick, Left, 900, 375
  err := wait_only("PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>", 5)
  if (err = 0)
    return 1
  else
    return 0
}

entry_open_existing_order()
{
  ; assumes there's only one order, therefore click top line
  click_design_tab()
  MouseClick, Left, 400, 394
  sleep, 200
  MouseClick, Left, 900, 400
  err := wait_only("PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>", 5)
  if (err = 0)
    return 1
  else
    return 0
}

target_open_new_order()
{
  click_design_tab()
  MouseClick, Left, 900, 556
  err := wait_only("PRIMU$ - Add/Edit Order Form", 5)
  if (err = 0)
    return 1
  else
    return 0
}

target_open_existing_order()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 577
  sleep, 100
  MouseClick, Left, 900, 585
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}

stop_open_new_order()
{
  click_design_tab()
  MouseClick, Left, 900, 705
  err := wait_only("PRIMU$ - Add/Edit Order Form", 5)
  if (err = 0)
    return 1
  else
    return 0
}

stop_open_existing_order()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 725
  sleep, 100
  MouseClick, Left, 900, 735
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_STOP_ORDER>
}

get_design_tab_checkboxes(checkbox_array)
{
  ; checkbox locations -----------------------------------------------------------
  checkbox_array["permit_backtesting_check_box"] := [616, 120]
  checkbox_array["enter_on_last_check_box"] := [760, 69]
  checkbox_array["enter_on_bid_check_box"] := [760, 94]
  checkbox_array["enter_on_ask_check_box"] := [760, 119]
  checkbox_array["enter_on_pmi_check_box"] := [760, 144]
  checkbox_array["enter_on_imbalance_check_box"] := [760, 193]
  checkbox_array["enter_on_snapshot_check_box"] := [867, 192]
  checkbox_array["enter_on_new_minute_check_box"] := [867, 170]
  checkbox_array["enter_on_stock_event_check_box"] := [760, 170]
  checkbox_array["use_strict_mode_check_box"] := [618, 197]
  checkbox_array["enable_stop_trailing_on_new_second_check_box"] := [12,825]
  checkbox_array["verify_code_during_validate_procedure_check_box"] := [523,909]

  checkbox_array["permit_backtesting_trigger_point"] := [628,130]
  checkbox_array["enter_on_last_trigger_point"] := [770, 79]
  checkbox_array["enter_on_bid_trigger_point"] := [770, 104]
  checkbox_array["enter_on_ask_trigger_point"] := [770, 129]
  checkbox_array["enter_on_pmi_trigger_point"] := [770, 154]
  checkbox_array["enter_on_imbalance_trigger_point"] := [770, 203]
  checkbox_array["enter_on_snapshot_trigger_point"] := [877, 202]
  checkbox_array["enter_on_new_minute_trigger_point"] := [877, 180]
  checkbox_array["enter_on_stock_event_trigger_point"] := [770, 180]
  checkbox_array["use_strict_mode_trigger_point"] := [628,207]
  checkbox_array["enable_stop_trailing_on_new_second_trigger_point"] := [22,835]
  checkbox_array["verify_code_during_validate_procedure_trigger_point"] := [533,919]
}

set_general_setting()
{
  general_settings := {}
  generic_code_parser("pp/general_settings.i", general_settings)
  checkboxes := {}
  get_design_tab_checkboxes(checkboxes)
  bname := build_box_name(general_settings["box_name"], general_settings["box_acronym"])
  update_box_name(bname)
  desc := build_box_description(general_settings["launch_rule_name"], general_settings["black_box_description"], general_settings["basket_description"])
  update_box_description(desc)
  set_black_box_side(general_settings["black_box_side"])
  set_black_box_scheme(general_settings["black_box_scheme"])
  set_check_box_confirm("PRIMU$ - Black", 1,"TRUE", checkboxes["permit_backtesting_check_box"], checkboxes["permit_backtesting_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_last"], checkboxes["enter_on_last_check_box"], checkboxes["enter_on_last_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_bid"], checkboxes["enter_on_bid_check_box"], checkboxes["enter_on_bid_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_ask"], checkboxes["enter_on_ask_check_box"], checkboxes["enter_on_ask_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_pmi"], checkboxes["enter_on_pmi_check_box"], checkboxes["enter_on_pmi_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_imbalance"], checkboxes["enter_on_imbalance_check_box"], checkboxes["enter_on_imbalance_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_snapshot"], checkboxes["enter_on_snapshot_check_box"], checkboxes["enter_on_snapshot_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_new_minute"], checkboxes["enter_on_new_minute_check_box"], checkboxes["enter_on_new_minute_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_stock_event"], checkboxes["enter_on_stock_event_check_box"], checkboxes["enter_on_stock_event_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["use_strict_mode"], checkboxes["use_strict_mode_check_box"], checkboxes["use_strict_mode_trigger_point"])
}

set_entry()
{
  entry := {}
  generic_code_parser("pp/entry.i", entry)
  checkboxes := {}
  get_order_form_check_boxes(checkboxes)

  if (entry["black_box_scheme"] = "PlainVanilla")
    if (entry_update_trigger(entry["entry_trigger"]) = 0)
      inform("Unable to set entry trigger.")
  if (entry_open_new_order() = 0)
    inform("Unable to open new order window.")
  set_order_form_order_type(entry["entry_order_type"])
  set_order_form_order_side(entry["entry_order_side"])
  set_order_form_destination(entry["entry_destination"])
  set_order_form_TIF(entry["entry_tif"])
  if (entry["entry_tif"] = "SECONDS")
    set_order_form_TIF_seconds(entry["entry_tif_seconds"])
  open_limit_price_expression_builder()
  expression_set_code(entry["entry_order_limit"])
  if (entry["entry_order_type"] = "STOP_LIMIT")
  {
    open_stop_price_expression_builder()
    expression_set_code(entry["entry_order_stop"])
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,entry["entry_aggregated_TIF"], checkboxes["aggregated_tif_check_box"], checkboxes["aggregated_tif_trigger_point"])
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,entry["entry_calculate_limit_during_placement"], checkboxes["calc_lmt_prc_durng_ord_plcmnt_check_box"], checkboxes["calc_lmt_prc_durng_ord_plcmnt_trigger_point"])
    set_order_form_TIF2(entry["entry_tif2"])
    set_order_form_TIF2_seconds(entry["entry_tif2_seconds"])
  }
  click_order_form_save_button()
}

set_target()
{
  target := {}
  generic_code_parser("pp/target.i", target)
  checkboxes := {}
  get_order_form_check_boxes(checkboxes)

  target_open_new_order()
  set_order_form_order_type(target["target_order_type"])
  set_order_form_order_side(target["target_order_side"])
  set_order_form_destination(target["target_destination"])
  if (target["target_order_type"] = "LIMIT")
  {
    set_order_form_TIF("TIF_DAY")
    open_limit_price_expression_builder()
    expression_set_code(target["target_limit"])
  }
  else if (target["target_order_type"] = "PRIMUS_AEL")
  {
    open_ael_trigger_expression_builder()
    expression_set_code(target["ael_trigger"])
    open_ael_how_expression_builder()
    expression_set_code(target["ael_price"])
    open_ael_time_increment_expression_builder()
    expression_set_code(target["ael_time_increment"])
    open_ael_price_increment_expression_builder()
    expression_set_code(target["ael_price_increment"])
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,target["ael_on_last"], checkboxes["ael_on_last_check_box"], checkboxes["ael_on_last_trigger_point"])
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,target["ael_on_second"], checkboxes["ael_on_second_check_box"], checkboxes["ael_on_second_trigger_point"])
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,target["ael_on_bid_ask"], checkboxes["ael_on_bid_check_box"], checkboxes["ael_on_bid_trigger_point"])
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,target["ael_convert_to_stop"], checkboxes["ael_convert_to_stop_check_box"], checkboxes["ael_convert_to_stop_trigger_point"])
  }
  else
  {
    inform("target order type not supported: " . target["target_order_type"])
  }
  click_order_form_save_button()
}

set_stop()
{
  stop := {}
  generic_code_parser("pp/stop.i", stop)
  checkboxes := {}
  get_order_form_check_boxes(checkboxes)
  stop_open_new_order()
  set_order_form_order_side(stop["stop_order_side"])
  set_order_form_order_type(stop["stop_order_type"])
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,stop["enable_trailing"], checkboxes["enable_trailing_check_box"], checkboxes["enable_trailing_trigger_point"])
  if (stop["enable_trailing"] = "TRUE")
  {
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,stop["trail_after_entry_complete"], checkboxes["trail_after_entry_complete_check_box"], checkboxes["trail_after_entry_complete_trigger_point"])
    set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,stop["trail_once"], checkboxes["trail_once_check_box"], checkboxes["trail_once_trigger_point"])
    open_trail_trigger_expression_builder()
    expression_set_code(stop["trail_trigger"])
    open_trail_how_expression_builder()
    expression_set_code(stop["trail_how"])
    open_trail_increment_expression_builder()
    expression_set_code(stop["trail_increment"])
  }
  click_common_order_parameters_tab()
  open_stop_price_expression_builder()
  expression_set_code(stop["stop_price"])
  click_order_form_save_button()
}
