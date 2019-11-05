; loads everything from using file_reader.ahk
; every box is saved in the top folder
; the box definition file is supplied as a command line argument
#include file_reader.ahk
#include files.ahk
#include black_box_clicks.ahk ; DELETE

#include expression_builder_clicks.ahk
#include check_boxes.ahk
#include basket_edit_form_clicks.ahk
#include box_vars.ahk
#include clipboard_paste.ahk
#include box_name_builder.ahk
#include gcc_compile.ahk
#include launcher_control.ahk
#include inform.ahk
#include order_form_clicks.ahk
#include expression_builder_clicks.ahk
#include design_tab.ahk
#include symbols_tab.ahk
#include options_tab.ahk
#include risk_management_tab.ahk
#include launch_rule_tab.ahk

; make sure required files are available
confirm_file_exists("general_settings.c")
confirm_file_exists("entry.c")
confirm_file_exists("target.c")
confirm_file_exists("stop.c")
confirm_file_exists("time_options.c")
confirm_file_exists("position_sizing.c")
confirm_file_exists("basket.c")
confirm_file_exists("launch_rules.c")
confirm_file_exists("images/checked.PNG")
confirm_file_exists("images/design.PNG")
confirm_file_exists("images/launch_rule.PNG")
confirm_file_exists("images/options.PNG")
confirm_file_exists("images/risk_management.PNG")
confirm_file_exists("images/symbols.PNG")

gcc_initial_compile()
load_compiled_rules()
make_back_up_directory(box_acronym)

; click new box
launcher_click_new_box()
wait_only("PRIMU$ - Black", 5)

; set general_settings ------------------------------------------------
bname := build_box_name(box_name, box_acronym)
update_box_name(bname)
desc := build_box_description(launch_rule_name, black_box_description, basket_description)
update_box_description(desc)
set_black_box_side(black_box_side)
set_black_box_scheme(black_box_scheme)
/*
if (is_checked(permit_backtesting_check_box) = 0)
  trigger_check_box(permit_backtesting_trigger_point)
  */
set_check_box_confirm("PRIMU$ - Black", 1,"TRUE", permit_backtesting_check_box, permit_backtesting_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_last, enter_on_last_check_box, enter_on_last_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_bid, enter_on_bid_check_box, enter_on_bid_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_ask, enter_on_ask_check_box, enter_on_ask_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_pmi, enter_on_pmi_check_box, enter_on_pmi_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_imbalance, enter_on_imbalance_check_box, enter_on_imbalance_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_snapshot, enter_on_snapshot_check_box, enter_on_snapshot_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_new_minute, enter_on_new_minute_check_box, enter_on_new_minute_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,enter_on_stock_event, enter_on_stock_event_check_box, enter_on_stock_event_trigger_point)
set_check_box_confirm("PRIMU$ - Black", 1,use_strict_mode, use_strict_mode_check_box, use_strict_mode_trigger_point)
inform_timeout("Done with general_settings.", 5)

; set entry -------------------------------------------------------------
if (black_box_scheme = "PlainVanilla")
  if (entry_update_trigger(entry_trigger, 2) = 0)
    inform("Unable to set entry trigger.")
if (entry_open_new_order(2) = 0)
  inform("Unable to open new order window.")
set_order_form_order_type(entry_order_type)
set_order_form_order_side(entry_order_side)
set_order_form_destination(entry_destination)
set_order_form_TIF(entry_tif)
if (entry_tif = "SECONDS")
  set_order_form_TIF_seconds(entry_tif_seconds)
open_limit_price_expression_builder()
expression_set_code(entry_order_limit)
if (entry_order_type = "STOP_LIMIT")
{
  open_stop_price_expression_builder()
  expression_set_code(entry_order_stop)
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,entry_aggregated_TIF, aggregated_tif_check_box, aggregated_tif_trigger_point)
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,entry_calculate_limit_during_placement, calc_lmt_prc_durng_ord_plcmnt_check_box, calc_lmt_prc_durng_ord_plcmnt_trigger_point)
  set_order_form_TIF2(entry_tif2)
  set_order_form_TIF2_seconds(entry_tif2_seconds)
}
click_order_form_save_button()
inform_timeout("Done with entry.", 5)

; set target -----------------------------------------------------------------
target_open_new_order(2)

set_order_form_order_type(target_order_type)
set_order_form_order_side(target_order_side)
set_order_form_destination(target_destination)

if (target_order_type = "LIMIT") {
  set_order_form_TIF("TIF_DAY")
  open_limit_price_expression_builder()
  expression_set_code(target_limit)
} else if (target_order_type = "PRIMUS_AEL") {
  open_ael_trigger_expression_builder()
  expression_set_code(ael_trigger)
  open_ael_how_expression_builder()
  expression_set_code(ael_price)
  open_ael_time_increment_expression_builder()
  expression_set_code(ael_time_increment)
  open_ael_price_increment_expression_builder()
  expression_set_code(ael_price_increment)
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,ael_on_last, ael_on_last_check_box, ael_on_last_trigger_point)
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,ael_on_second, ael_on_second_check_box, ael_on_second_trigger_point)
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,ael_on_bid_ask, ael_on_bid_check_box, ael_on_bid_trigger_point)
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,ael_convert_to_stop, ael_convert_to_stop_check_box, ael_convert_to_stop_trigger_point)
} else {
  Msgbox, target order type %target_order_type% not supported
  ExitApp
}
click_order_form_save_button()


; set stop -------------------------------------------------------------------
stop_open_new_order(2)
set_order_form_order_side(stop_order_side)
set_order_form_order_type(stop_order_type)
set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,enable_trailing, enable_trailing_check_box, enable_trailing_trigger_point)
if (enable_trailing = "TRUE")
{
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,trail_after_entry_complete, trail_after_entry_complete_check_box, trail_after_entry_complete_trigger_point)
  set_check_box_confirm("PRIMU$ - Add/Edit Order Form", 1,trail_once, trail_once_check_box, trail_once_trigger_point)
  open_trail_trigger_expression_builder()
  expression_set_code(trail_trigger)
  open_trail_how_expression_builder()
  expression_set_code(trail_how)
  open_trail_increment_expression_builder()
  expression_set_code(trail_increment)
}
click_common_order_parameters_tab()
open_stop_price_expression_builder()
expression_set_code(stop_price)
click_order_form_save_button()
inform_timeout("Done with stop.", 5)


; set basket -----------------------------------------------------------------------
click_symbols_tab()
click_choose_basket()
click_basket_manager_private_tab()
basket_manager_new_basket()

set_basket_name(box_acronym)
set_basket_description(basket_description)

set_check_box(activate_dynamic_basket_rules, activate_dynamic_basket_rules_check_box, activate_dynamic_basket_rules_trigger_point)
set_check_box(apply_dynamic_basket_rules_to_all_available_symbols, apply_dynamic_basket_rules_to_all_available_symbols_check_box, apply_dynamic_basket_rules_to_all_available_symbols_trigger_point)

if (basket_rules != "")
  set_basket_rule(basket_rules)

if (basket_symbols != "")
  set_basket_symbols(basket_symbols)
if (basket_exclude != "")
  set_basket_always_exclude_symbols(basket_exclude)
if (basket_htb != "")
  set_basket_hard_to_borrow_allowed_symbols(basket_htb)
click_edit_basket_save_button()
click_basket_manager_ok_button()

inform_timeout("Done with basket.", 5)


loop
{
; time options -----------------------------------------------------------------
click_options_tab()
set_check_box_confirm("PRIMU$ - Black", 1,use_time_options, use_time_options_check_box, use_time_options_trigger_point)

set_time_option(start_subscription_trigger_point, start_subscription)
set_time_option(start_entering_positions_trigger_point, start_entering_positions)
set_time_option(stop_entering_positions_trigger_point, stop_entering_positions)
set_time_option(cancel_all_pending_orders_trigger_point, cancel_all_pending_orders)
set_time_option(close_all_open_positions_trigger_point, close_all_open_positions)
set_time_option(place_OPG_orders_trigger_point, place_OPG_orders)

;-----------------------------------------------------------------------------------------------
InputBox, response, Question,  Ready for time position sizing? (enter y or n or q)
If (response = "q")
  ExitApp
If (response = "y")
  break
;-----------------------------------------------------------------------------------------------

}

loop
{
; position sizing --------------------------------------------------------------
set_check_box_confirm("PRIMU$ - Black", 1,enable_position_sizing_scheme, enable_position_sizing_scheme_check_box, enable_position_sizing_scheme_trigger_point)
set_position_sizing_scheme(position_sizing)
;-----------------------------------------------------------------------------------------------
InputBox, response, Question,  Ready for time risk management? (enter y or n or q)
If (response = "q")
  ExitApp
If (response = "y")
  break
;-----------------------------------------------------------------------------------------------

}

loop
{
; risk management --------------------------------------------------------------
click_risk_management_tab()
set_check_box_confirm("PRIMU$ - Black", 1,enable_black_box_risk_management, enable_black_box_risk_management_check_box, enable_black_box_risk_management_trigger_point)
set_maximum_order_shares(maximum_order_shares)
;-----------------------------------------------------------------------------------------------
InputBox, response, Question,  Ready for launch rules? (enter y or n or q)
If (response = "q")
  ExitApp
If (response = "y")
  break
;-----------------------------------------------------------------------------------------------

}

loop
{
; launch rule ------------------------------------------------------------------
click_launch_rule_tab()
set_check_box_confirm("PRIMU$ - Black", 1,enable_black_box_launch_rule, enable_black_box_launch_rule_check_box, enable_black_box_launch_rule_trigger_point)
set_launch_rule(launch_rules)

click_validate_and_close()
;-----------------------------------------------------------------------------------------------
InputBox, response, Question, Done? (enter y or n or q)
If (response = "q")
  ExitApp
If (response = "y")
  break
;-----------------------------------------------------------------------------------------------

}


backup("basket", box_acronym)
backup("entry", box_acronym)
backup("general_settings", box_acronym)
backup("launch_rules", box_acronym)
backup("position_sizing", box_acronym)
backup("stop", box_acronym)
backup("target", box_acronym)
backup("time_options", box_acronym)
