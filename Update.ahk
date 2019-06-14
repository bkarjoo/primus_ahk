; take the filename to update as command line argument
; expects there to be a back up for that file
; back up is created by Build.ahk and this module
#include launcher_clicks.ahk
#include file_reader.ahk
#include black_box_clicks.ahk
#include order_form_clicks.ahk
#include expression_builder_clicks.ahk
#include check_boxes.ahk
#include basket_edit_form_clicks.ahk
#include backup.ahk
#include file_reader_bu.ahk

main_file = %1%
/*
backup_file := get_backup_file_name(main_file)
LoadFile(main_file)
LoadFileBU(backup_file)


;-----------------------------------------------------------------------------------------------
InputBox, response, Question,  Make sure the box to update is loaded ready? (enter y or n)
If (response = "n")
  ExitApp
;-----------------------------------------------------------------------------------------------

ClickEditBox()
ActivateBlackBoxDesign()

; box name and description -----------------------------------------------------
if (box_name != box_name_bu)
{
  UpdateBoxName(box_name)
  sleep 100
}

if (black_box_description != black_box_description_bu)
{
  UpdateBoxDescription(black_box_description)
  sleep 100
}

; design tab dropdowns ---------------------------------------------------------
if (black_box_side != black_box_side_bu)
{
  SetBlackBoxSide(black_box_side)
  sleep 100
}

if (black_box_scheme != black_box_scheme_bu)
{
  SetBlackBoxScheme(black_box_scheme)
  sleep 100
}

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
if ((entry_trigger != entry_trigger_bu) or (black_box_scheme <> black_box_scheme_bu))
{
  if (black_box_scheme = "PlainVanilla")
    UpdateEntryTrigger(entry_trigger)
}


; Entry Order ------------------------------------------------------------------

if (entry_order_type != entry_order_type_bu
  or entry_order_side != entry_order_side_bu
  or entry_destination != entry_destination_bu
  or entry_tif != entry_tif_bu
  or entry_tif_seconds != entry_tif_seconds_bu
  or entry_order_limit != entry_order_limit_bu
  or entry_order_stop != entry_order_stop_bu
  or entry_aggregated_TIF != entry_aggregated_TIF_bu
  or entry_calculate_limit_during_placement != entry_calculate_limit_during_placement_bu
  or entry_tif2 != entry_tif2_bu
  or entry_tif2_seconds != entry_tif2_seconds_bu)
{
  Loop
  {
    OpenExistingEntryOrder()

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

    ;-----------------------------------------------------------------------------------------------
    InputBox, response, Question,  entry updated? (enter y or n or q)
    If (response = "q")
      ExitApp
    If (response = "y")
      break
    ;-----------------------------------------------------------------------------------------------

  }
}

; target order -----------------------------------------------------------------

if (target_order_type != target_order_type_bu
  or target_order_side !=target_order_side_bu
  or target_destination !=target_destination_bu
  or target_limit !=target_limit_bu
  or ael_price !=ael_price_bu
  or ael_trigger !=ael_trigger_bu
  or ael_time_increment !=ael_time_increment_bu
  or ael_price_increment !=ael_price_increment_bu
  or ael_on_last !=ael_on_last_bu
  or ael_on_second !=ael_on_second_bu
  or ael_on_bid_ask !=ael_on_bid_ask_bu
  or ael_convert_to_stop !=ael_convert_to_stop_bu)
{
  loop
  {
  OpenExistingTargetOrder()

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

  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  target updated? (enter y or n or q)
  If (response = "q")
    ExitApp
  If (response = "y")
    break
  ;-----------------------------------------------------------------------------------------------
  }
}

if (stop_order_side != stop_order_side_bu
or stop_order_type !=stop_order_type_bu
or enable_trailing != enable_trailing_bu
or trail_after_entry_complete != trail_after_entry_complete_bu
or trail_once != trail_once_bu
or trail_trigger != trail_trigger_bu
or trail_how != trail_how_bu
or trail_increment != trail_increment_bu
or stop_price != stop_price_bu)
{
  loop
  {
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
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  stop updated? (enter y or n or q)
  If (response = "q")
    ExitApp
  If (response = "y")
    break
  ;-----------------------------------------------------------------------------------------------

  }
}

if (basket_name != basket_name_bu
  or basket_description != basket_description_bu
  or activate_dynamic_basket_rules != activate_dynamic_basket_rules_bu
  or apply_dynamic_basket_rules_to_all_available_symbols != apply_dynamic_basket_rules_to_all_available_symbols_bu
  or basket_rules != basket_rules_bu
  or basket_symbols != basket_symbols_bu
  or basket_exclude != basket_exclude_bu
  or basket_htb != basket_htb_bu)
{
  loop
  {
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
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  basket updated? (enter y or n or q)
  If (response = "q")
    ExitApp
  If (response = "y")
    break
  ;-----------------------------------------------------------------------------------------------

  }
}

if (use_time_options != use_time_options_bu
or start_subscription != start_subscription_bu
or start_entering_positions != start_entering_positions_bu
or stop_entering_positions != stop_entering_positions_bu
or cancel_all_pending_orders != cancel_all_pending_orders_bu
or close_all_open_positions != close_all_open_positions_bu
or place_OPG_orders != place_OPG_orders_bu)
{
  loop
  {
  ; time options -----------------------------------------------------------------
  click_options_tab()
  SetCheckBox(use_time_options, use_time_options_check_box, use_time_options_trigger_point)

  set_time_option(start_subscription_trigger_point, start_subscription)
  set_time_option(start_entering_positions_trigger_point, start_entering_positions)
  set_time_option(stop_entering_positions_trigger_point, stop_entering_positions)
  set_time_option(cancel_all_pending_orders_trigger_point, cancel_all_pending_orders)
  set_time_option(close_all_open_positions_trigger_point, close_all_open_positions)
  set_time_option(place_OPG_orders_trigger_point, place_OPG_orders)

  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  time options updated? (enter y or n or q)
  If (response = "q")
    ExitApp
  If (response = "y")
    break
  ;-----------------------------------------------------------------------------------------------
  }
}

if (  enable_position_sizing_scheme != enable_position_sizing_scheme_bu
  or position_sizing != position_sizing_bu)
{
  loop
  {
  ; position sizing --------------------------------------------------------------
  SetCheckBox(enable_position_sizing_scheme, enable_position_sizing_scheme_check_box, enable_position_sizing_scheme_trigger_point)
  set_position_sizing_scheme(position_sizing)
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  position sizing updated? (enter y or n or q)
  If (response = "q")
    ExitApp
  If (response = "y")
    break
  ;-----------------------------------------------------------------------------------------------
  }
}

if (enable_black_box_risk_management != enable_black_box_risk_management_bu
  or maximum_order_shares != maximum_order_shares_bu)
{
  loop
  {
  ; risk management --------------------------------------------------------------
  click_risk_management_tab()
  SetCheckBox(enable_black_box_risk_management, enable_black_box_risk_management_check_box, enable_black_box_risk_management_trigger_point)
  set_maximum_order_shares(maximum_order_shares)
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  risk management updated? (enter y or n or q)
  If (response = "q")
    ExitApp
  If (response = "y")
    break
  ;-----------------------------------------------------------------------------------------------
  }
}

if (enable_black_box_launch_rule != enable_black_box_launch_rule_bu
or launch_rules != launch_rules_bu)
{
  loop
  {
  ; launch rule ------------------------------------------------------------------
  click_launch_rule_tab()
  SetCheckBox(enable_black_box_launch_rule, enable_black_box_launch_rule_check_box, enable_black_box_launch_rule_trigger_point)
  set_launch_rule(launch_rules)


  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question, launch rule updated? (enter y or n or q)
  If (response = "q")
    ExitApp
  If (response = "y")
    break
  ;-----------------------------------------------------------------------------------------------
  }
}

click_validate_and_close()
*/

backup(main_file)
