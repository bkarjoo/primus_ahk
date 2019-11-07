; windows
#include launcher_control.ahk
#include black_box_design.ahk
#include order_form.ahk
#include expression_builder.ahk
#include basket_manager.ahk
#include edit_basket.ahk
; tabs
#include design_tab.ahk
#include symbols_tab.ahk
#include options_tab.ahk
; utilities
#include box_name_builder.ahk
#include files.ahk
#include gcc_compile.ahk
#include check_boxes.ahk

do_confirm_requisite_files := True
do_compile_code_files := False
do_create_backup_folder := False
do_general_settings := False
do_entry := False
do_target := False
do_stop := False
do_basket := False
do_time_options := True
do_position_sizing := True
do_risk_management := True
do_launch_rules := True
do_backup := True
do_validate_and_close := True

confirm_requisite_files()
{
  confirm_image_search_files_exist()
  confirm_code_files_exist()
}

compile_code_files()
{
  gcc_initial_compile()
  confirm_compiled_files_exist()
}

create_backup_folder()
{
  general_settings := {}
  generic_code_parser("pp/general_settings.i", general_settings)
  make_back_up_directory(general_settings["box_acronym"])
}

open_new_bb_design()
{
  ; click new box
  launcher_click_new_box()
  wait_only("PRIMU$ - Black", 5)
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

set_basket()
{
  basket := {}
  generic_code_parser("pp/basket.i", basket)
  checkboxes := {}
  get_edit_basket_checkboxes(checkboxes)

  click_symbols_tab()
  click_choose_basket()
  click_basket_manager_private_tab()
  basket_manager_new_basket()
  set_basket_name(basket["basket_name"])
  set_basket_description(basket["basket_description"])
  set_check_box(basket["activate_dynamic_basket_rules"], checkboxes["activate_dynamic_basket_rules_check_box"], checkboxes["activate_dynamic_basket_rules_trigger_point"])
  set_check_box(basket["apply_dynamic_basket_rules_to_all_available_symbols"], checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_check_box"], checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_trigger_point"])
  if (basket["basket_rules"] != "")
    set_basket_rule(basket["basket_rules"])
  if (basket["basket_symbols"] != "")
    set_basket_symbols(basket["basket_symbols"])
  if (basket["basket_exclude"] != "")
    set_basket_always_exclude_symbols(basket["basket_exclude"])
  if (basket["basket_htb"] != "")
    set_basket_hard_to_borrow_allowed_symbols(basket["basket_htb"])
  click_edit_basket_save_button()
  click_basket_manager_ok_button()
}

set_time_options()
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

set_position_sizing()
{

}

set_risk_management()
{

}

set_launch_rule()
{

}

finalize_build()
{

}

if (do_confirm_requisite_files)
  confirm_requisite_files()
if (do_compile_code_files)
  compile_code_files()
if (do_create_backup_folder)
  create_backup_folder()
open_new_bb_design()
if (do_general_settings)
  set_general_setting()
if (do_entry)
  set_entry()
if (do_target)
  set_target()
if (do_stop)
  set_stop()
if (do_basket)
  set_basket()
if (do_time_options)
  set_time_options()
if (do_position_sizing)
  set_position_sizing()
if (do_risk_management)
  set_risk_management()
if (do_launch_rules)
  set_launch_rule()

finalize_build()
Msgbox, DONE
