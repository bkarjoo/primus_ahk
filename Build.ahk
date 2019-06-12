; loads everything from using file_reader.ahk
; every box is saved in the top folder
; the box definition file is supplied as a command line argument
#include launcher_clicks.ahk
#include file_reader.ahk
#include black_box_clicks.ahk
#include order_form_clicks.ahk
#include expression_builder_clicks.ahk
#include check_boxes.ahk
#include basket_edit_form_clicks.ahk

/*
InputBox, response, Question,  Building a new box will override open box. You will lose unsaved changes. Do you want to proceed? (enter y or n)
If (response = "n")
  ExitApp
*/
file_name = %1%
LoadFile(file_name)

/*
ClickNewBox()
*/
ActivateBlackBoxDesign()

/*
; box name and description -----------------------------------------------------
UpdateBoxName(box_name)
sleep 100
UpdateBoxDescription(black_box_description)
sleep 100
; design tab dropdowns ---------------------------------------------------------
SetBlackBoxSide(black_box_side)
sleep 100
SetBlackBoxScheme(black_box_scheme)
sleep 100
; design tab check boxes -------------------------------------------------------
if (IsChecked(permit_backtesting_check_box) = 0)
  TriggerCheckBox(permit_backtesting_trigger_point)
SetCheckBox(enter_on_last, enter_on_last_check_box, enter_on_last_trigger_point)
SetCheckBox(enter_on_bid, enter_on_bid_check_box, enter_on_bid_trigger_point)
SetCheckBox(enter_on_ask, enter_on_ask_check_box, enter_on_ask_trigger_point)
SetCheckBox(enter_on_pmi, enter_on_pmi_check_box, enter_on_pmi_trigger_point)
SetCheckBox(enter_on_imbalance, enter_on_imbalance_check_box, enter_on_imbalance_trigger_point)
SetCheckBox(enter_on_snapshot, enter_on_snapshot_check_box, enter_on_snapshot_trigger_point)
SetCheckBox(enter_on_new_minute, enter_on_new_minute_check_box, enter_on_new_minute_trigger_point)
SetCheckBox(enter_on_stock_event, enter_on_stock_event_check_box, enter_on_stock_event_trigger_point)
SetCheckBox(use_strict_mode, use_strict_mode_check_box, use_strict_mode_trigger_point)
; Entry Trigger ----------------------------------------------------------------
if (black_box_scheme = "PlainVanilla")
  UpdateEntryTrigger(entry_trigger)
; Entry Order ------------------------------------------------------------------

OpenNewEntryOrder()

set_order_form_order_type(entry_order_type)
set_order_form_order_side(entry_order_side)
set_order_form_destination(entry_destination)
set_order_form_TIF(entry_tif)
if (entry_tif = "SECONDS")
  set_order_form_TIF_seconds(entry_tif_seconds)

open_limit_price_expression_builder()
SetExpressionBuilderCode(entry_order_limit)

if (entry_order_type = "STOP_LIMIT")
{
  open_stop_price_expression_builder()
  SetExpressionBuilderCode(entry_order_stop)
  SetCheckBox(entry_aggregated_TIF, aggregated_tif_check_box, aggregated_tif_trigger_point)
  SetCheckBox(entry_calculate_limit_during_placement, calc_lmt_prc_durng_ord_plcmnt_check_box, calc_lmt_prc_durng_ord_plcmnt_trigger_point)
  set_order_form_TIF2(entry_tif2)
  set_order_form_TIF2_seconds(entry_tif2_seconds)
}

click_order_form_save_button()

; target order -----------------------------------------------------------------
OpenNewTargetOrder()

set_order_form_order_type(target_order_type)
set_order_form_order_side(target_order_side)
set_order_form_destination(target_destination)

if (target_order_type = "LIMIT") {
  set_order_form_TIF("TIF_DAY")
  open_limit_price_expression_builder()
  SetExpressionBuilderCode(target_limit)
} else if (target_order_type = "PRIMUS_AEL") {
  open_ael_trigger_expression_builder()
  SetExpressionBuilderCode(ael_trigger)
  open_ael_how_expression_builder()
  SetExpressionBuilderCode(ael_price)
  open_ael_time_increment_expression_builder()
  SetExpressionBuilderCode(ael_time_increment)
  open_ael_price_increment_expression_builder()
  SetExpressionBuilderCode(ael_price_increment)
  SetCheckBox(ael_on_last, ael_on_last_check_box, ael_on_last_trigger_point)
  SetCheckBox(ael_on_second, ael_on_second_check_box, ael_on_second_trigger_point)
  SetCheckBox(ael_on_bid_ask, ael_on_bid_check_box, ael_on_bid_trigger_point)
  SetCheckBox(ael_convert_to_stop, ael_convert_to_stop_check_box, ael_convert_to_stop_trigger_point)
} else {
  Msgbox, target order type %target_order_type% not supported
  ExitApp
}

click_order_form_save_button()

; stop order -------------------------------------------------------------------

OpenNewStopOrder()

set_order_form_order_side(stop_order_side)
set_order_form_order_type(stop_order_type)

SetCheckBox(enable_trailing, enable_trailing_check_box, enable_trailing_trigger_point)

if (enable_trailing = "TRUE")
{
  SetCheckBox(trail_after_entry_complete, trail_after_entry_complete_check_box, trail_after_entry_complete_trigger_point)
  SetCheckBox(trail_once, trail_once_check_box, trail_once_trigger_point)
  open_trail_trigger_expression_builder()
  SetExpressionBuilderCode(trail_trigger)
  open_trail_how_expression_builder()
  SetExpressionBuilderCode(trail_how)
  open_trail_increment_expression_builder()
  SetExpressionBuilderCode(trail_increment)
}
click_common_order_parameters_tab()
open_stop_price_expression_builder()
SetExpressionBuilderCode(stop_price)

click_order_form_save_button()

; basket -----------------------------------------------------------------------
click_symbols_tab()
click_choose_basket()
create_new_basket()

set_basket_name(basket_name)
set_basket_description(basket_description)

SetCheckBox(activate_dynamic_basket_rules, activate_dynamic_basket_rules_check_box, activate_dynamic_basket_rules_trigger_point)
SetCheckBox(apply_dynamic_basket_rules_to_all_available_symbols, apply_dynamic_basket_rules_to_all_available_symbols_check_box, apply_dynamic_basket_rules_to_all_available_symbols_trigger_point)

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
*/

; options ----------------------------------------------------------------------

; time options -----------------------------------------------------------------

; position sizing --------------------------------------------------------------

; risk management --------------------------------------------------------------

; launch rule ------------------------------------------------------------------
