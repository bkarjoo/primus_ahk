#include file_reader.ahk
#include file_reader_bu.ahk
#include box_finder.ahk
/*
#include launcher_clicks.ahk
#include file_reader.ahk
#include order_form_clicks.ahk
#include expression_builder_clicks.ahk
#include check_boxes.ahk
#include basket_edit_form_clicks.ahk
#include box_vars.ahk
#include files.ahk
#include clipboard_paste.ahk
#include box_name_builder.ahk


#include files.ahk
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
#include box_vars_bu.ahk

*/
; -----------------------------------------------------------
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
#include risk_management_tab.ahk
#include launch_rule_tab.ahk
; utilities
#include box_name_builder.ahk
#include files.ahk
#include gcc_compile.ahk
#include check_boxes.ahk

; selective compile if file has changed (compare c to i)
; selective update if var has changed (compare i to bu_i)


get_code_files_update_status(box_acronym, array)
{
  array["basket_updated"] := updated("basket", box_acronym)
  array["entry_updated"] := updated("entry", box_acronym)
  array["target_updated"] := updated("target", box_acronym)
  array["stop_updated"] := updated("stop", box_acronym)
  array["time_options_updated"] := updated("time_options", box_acronym)
  array["general_settings_updated"] := updated("general_settings", box_acronym)
  array["position_sizing_updated"] := updated("position_sizing", box_acronym)
  array["risk_management_updated"] := updated("risk_management", box_acronym)
  array["launch_rules_updated"] := updated("launch_rules", box_acronym)
}

number_of_updated_files(array)
{
  i := 0
  if (array["basket_updated"])
    i := i + 1
  if (array["entry_updated"])
    i := i + 1
  if (array["target_updated"])
    i := i + 1
  if (array["stop_updated"])
    i := i + 1
  if (array["time_options_updated"])
    i := i + 1
  if (array["general_settings_updated"])
    i := i + 1
  if (array["position_sizing_updated"])
    i := i + 1
  if (array["risk_management_updated"])
    i := i + 1
  if (array["launch_rules_updated"])
    i := i + 1
  return i
}

compile_code_files_if_changed(ustate)
{
  if (ustate["basket_updated"])
    clipboard_paste("gcc basket.c -E -o pp/basket.i -P")
  if (ustate["entry_updated"])
    clipboard_paste("gcc entry.c -E -o pp/entry.i -P")
  if (ustate["launch_rules_updated"])
    clipboard_paste("gcc launch_rules.c -E -o pp/launch_rules.i -P")
  if (ustate["position_sizing_updated"])
    clipboard_paste("gcc position_sizing.c -E -o pp/position_sizing.i -P")
  if (ustate["stop_updated"])
    clipboard_paste("gcc stop.c -E -o pp/stop.i -P")
  if (ustate["target_updated"])
    clipboard_paste("gcc target.c -E -o pp/target.i -P")
  if (ustate["general_settings_updated"])
    clipboard_paste("gcc general_settings.c -E -o pp/general_settings.i -P")
  if (ustate["time_options_updated"])
    clipboard_paste("gcc time_options.c -E -o pp/time_options.i -P ")
  if (ustate["risk_management_updated"])
    clipboard_paste("gcc risk_management.c -E -o pp/risk_management.i -P ")
}

backup_compiled_files_if_changed(ustate)
{
  if (ustate["basket_updated"])
    backup("basket", box_acronym)
  if (ustate["entry_updated"])
    backup("entry", box_acronym)
  if (ustate["launch_rules_updated"])
    backup("launch_rules", box_acronym)
  if (ustate["position_sizing_updated"])
    backup("position_sizing", box_acronym)
  if (ustate["stop_updated"])
    backup("stop", box_acronym)
  if (ustate["target_updated"])
    backup("target", box_acronym)
  if (ustate["general_settings_updated"])
    backup("general_settings", box_acronym)
  if (ustate["time_options_updated"])
    backup("time_options", box_acronym)
  if (ustate["risk_management_updated"])
    backup("risk_management", box_acronym)
}

gs := {}
generic_code_parser("general_settings.c", gs)
acronym := gs["box_acronym"]
msgbox % acronym
ustate := {}
get_code_files_update_status(acronym, ustate)
updated_file_count := number_of_updated_files(ustate)
msgbox % updated_file_count
if (updated_file_count = 0)
  inform("There's no files to update.")
compile_code_files_if_changed(ustate)
backup_compiled_files_if_changed(ustate)
;-------------------------------------------------------------------------------------------
ExitApp







; note general settings could've been changed so reload it
LoadFile("pp/general_settings.i")
LoadFile("pp/basket.i")
LoadFile("pp/entry.i")
LoadFile("pp/launch_rules.i")
LoadFile("pp/position_sizing.i")
LoadFile("pp/stop.i")
LoadFile("pp/target.i")
LoadFile("pp/time_options.i")

commit_message := box_acronym . " " . box_name . " L: " . launch_rule_name . " B: " . basket_description . " D: " .  black_box_description

if (basket_updated or entry_updated or target_updated or stop_updated or time_options_updated or general_settings_updated or position_sizing_updated)
{
  clipboard_paste("git add -A")
  clipboard_paste("git commit -m " . """" . commit_message . """")
}
; clipboard_paste("git push")
; InputBox, response, press a key when done pushing...

; push the bu branch as well
clipboard_paste("cd ..\bu")
clipboard_paste("git add -A")
commit_message := "-"
clipboard_paste("git commit -m " . """" . commit_message . """")

; clipboard_paste("git push")
; InputBox, response, press a key when done pushing...

clipboard_paste("cd ..\" . box_acronym)

;-----------------------------------------------------------------------------------------------
; load the box and then ask if it was loaded properly
OpenBox(box_acronym)
Click, Left, 1080, 710
WinWait, PRIMU$ - Black Box Design
; cancel out of box
; sleep, 100
; Click, Left, 75, 943
sleep, 100
InputBox, response, Question,  Make sure the box to update is loaded ready? (enter y or q)
If (response = "q")
  ExitApp
;-----------------------------------------------------------------------------------------------

; ClickEditBox()
activate_and_wait_only("PRIMU$ - Black", 5)

; box name and description -----------------------------------------------------
if (box_name != box_name_bu or box_acronym != box_acronym_bu)
{
  bname := build_box_name(box_name, box_acronym)
  update_box_name(bname)
  sleep 100
}

if (black_box_description != black_box_description_bu or launch_rule_name != launch_rule_name_bu or basket_description != basket_description_bu)
{
  desc := build_box_description(launch_rule_name, black_box_description, basket_description)
  update_box_description(desc)
  sleep 100
}

; design tab dropdowns ---------------------------------------------------------
if (black_box_side != black_box_side_bu)
{
  set_black_box_side(black_box_side)
  sleep 100
}

if (black_box_scheme != black_box_scheme_bu)
{
  set_black_box_scheme(black_box_scheme)
  sleep 100
}

; design tab check boxes -------------------------------------------------------
if (is_checked(permit_backtesting_check_box) = 0)
  trigger_check_box(permit_backtesting_trigger_point)
set_check_box(enter_on_last, enter_on_last_check_box, enter_on_last_trigger_point)
set_check_box(enter_on_bid, enter_on_bid_check_box, enter_on_bid_trigger_point)
set_check_box(enter_on_ask, enter_on_ask_check_box, enter_on_ask_trigger_point)
set_check_box(enter_on_pmi, enter_on_pmi_check_box, enter_on_pmi_trigger_point)
set_check_box(enter_on_imbalance, enter_on_imbalance_check_box, enter_on_imbalance_trigger_point)
set_check_box(enter_on_snapshot, enter_on_snapshot_check_box, enter_on_snapshot_trigger_point)
set_check_box(enter_on_new_minute, enter_on_new_minute_check_box, enter_on_new_minute_trigger_point)
set_check_box(enter_on_stock_event, enter_on_stock_event_check_box, enter_on_stock_event_trigger_point)
set_check_box(use_strict_mode, use_strict_mode_check_box, use_strict_mode_trigger_point)

; Entry Trigger ----------------------------------------------------------------
if ((entry_trigger != entry_trigger_bu) or (black_box_scheme <> black_box_scheme_bu))
{
  if (black_box_scheme = "PlainVanilla")
    entry_update_trigger(entry_trigger)
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
    entry_open_existing_order()

    if (entry_order_type != entry_order_type_bu)
      set_order_form_order_type(entry_order_type)
    if (entry_order_side != entry_order_side_bu)
      set_order_form_order_side(entry_order_side)
    if (entry_destination != entry_destination_bu)
      set_order_form_destination(entry_destination)
    if (entry_tif != entry_tif_bu)
      set_order_form_TIF(entry_tif)
    if (entry_tif = "SECONDS") {
      if (entry_tif_seconds != entry_tif_seconds_bu)
        set_order_form_TIF_seconds(entry_tif_seconds)
    }

    if (entry_order_limit != entry_order_limit_bu) {
      open_limit_price_expression_builder()
      expression_set_code(entry_order_limit)
    }

    if (entry_order_type = "STOP_LIMIT")
    {
      if (entry_order_stop != entry_order_stop_bu
        or entry_aggregated_TIF != entry_aggregated_TIF_bu
        or entry_calculate_limit_during_placement != entry_calculate_limit_during_placement_bu
        or entry_tif2 != entry_tif2_bu
        or entry_tif2_seconds != entry_tif2_seconds_bu)
        {
          open_stop_price_expression_builder()
          if (entry_order_stop != entry_order_stop_bu)
            expression_set_code(entry_order_stop)

          set_check_box(entry_aggregated_TIF, aggregated_tif_check_box, aggregated_tif_trigger_point)
          set_check_box(entry_calculate_limit_during_placement, calc_lmt_prc_durng_ord_plcmnt_check_box, calc_lmt_prc_durng_ord_plcmnt_trigger_point)

          if (entry_tif2 != entry_tif2_bu)
            set_order_form_TIF2(entry_tif2)

          if (entry_tif2_seconds != entry_tif2_seconds_bu)
            set_order_form_TIF2_seconds(entry_tif2_seconds)
        }
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
  target_open_existing_order()

  if (target_order_type != target_order_type_bu)
    set_order_form_order_type(target_order_type)
  if (target_order_side != target_order_side_bu)
    set_order_form_order_side(target_order_side)
  if (target_destination != target_destination_bu)
    set_order_form_destination(target_destination)

  if (target_order_type = "LIMIT") {
    if (target_order_type != target_order_type_bu)
      set_order_form_TIF("TIF_DAY")
    if (target_limit != target_limit_bu or target_order_type_bu != "LIMIT") {
      open_limit_price_expression_builder()
      expression_set_code(target_limit)
    }
  } else if (target_order_type = "PRIMUS_AEL") {
    if (ael_trigger != ael_trigger_bu or target_order_type_bu != "PRIMUS_AEL") {
      open_ael_trigger_expression_builder()
      expression_set_code(ael_trigger)
    }
    if (ael_price != ael_price_bu or target_order_type_bu != "PRIMUS_AEL") {
      open_ael_how_expression_builder()
      expression_set_code(ael_price)
    }
    if (ael_time_increment != ael_time_increment_bu or target_order_type_bu != "PRIMUS_AEL") {
      open_ael_time_increment_expression_builder()
      expression_set_code(ael_time_increment)
    }
    if (ael_price_increment != ael_price_increment_bu or target_order_type_bu != "PRIMUS_AEL") {
      open_ael_price_increment_expression_builder()
      expression_set_code(ael_price_increment)
    }

    set_check_box(ael_on_last, ael_on_last_check_box, ael_on_last_trigger_point)
    set_check_box(ael_on_second, ael_on_second_check_box, ael_on_second_trigger_point)
    set_check_box(ael_on_bid_ask, ael_on_bid_check_box, ael_on_bid_trigger_point)
    set_check_box(ael_convert_to_stop, ael_convert_to_stop_check_box, ael_convert_to_stop_trigger_point)
  } else {
    Msgbox, target order type %target_order_type% not supported
    ExitApp
  }

  click_order_form_save_button()

  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  target updated? (enter y or n or q)

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

  stop_open_existing_order()

  if (stop_order_side != stop_order_side_bu)
    set_order_form_order_side(stop_order_side)
  if (stop_order_type != stop_order_type_bu)
    set_order_form_order_type(stop_order_type)

  set_check_box(enable_trailing, enable_trailing_check_box, enable_trailing_trigger_point)

  if (enable_trailing = "TRUE")
  {
    click_primus_stop_order_tab()
    set_check_box(trail_after_entry_complete, trail_after_entry_complete_check_box, trail_after_entry_complete_trigger_point)
    set_check_box(trail_once, trail_once_check_box, trail_once_trigger_point)

    if (trail_trigger != trail_trigger_bu) {
      open_trail_trigger_expression_builder()
      expression_set_code(trail_trigger)
    }
    if (trail_how != trail_how_bu) {
      open_trail_how_expression_builder()
      expression_set_code(trail_how)
    }
    if (trail_increment != trail_increment_bu) {
      open_trail_increment_expression_builder()
      expression_set_code(trail_increment)
    }
  }


  if (stop_price != stop_price_bu) {
    click_common_order_parameters_tab()
    open_stop_price_expression_builder()
    expression_set_code(stop_price)
  }
  click_order_form_save_button()
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  stop updated? (enter y or n or q)

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
  open_existing_basket(box_acronym)

  loop
  {
  InputBox, response, Question,  basket loaded? (enter y or n or q)

  }

  if (basket_description != basket_description_bu)
    set_basket_description(basket_description)

  set_check_box(activate_dynamic_basket_rules, activate_dynamic_basket_rules_check_box, activate_dynamic_basket_rules_trigger_point)
  set_check_box(apply_dynamic_basket_rules_to_all_available_symbols, apply_dynamic_basket_rules_to_all_available_symbols_check_box, apply_dynamic_basket_rules_to_all_available_symbols_trigger_point)

  if (basket_rules != basket_rules_bu)
    set_basket_rule(basket_rules)

  if (basket_symbols != basket_symbols_bu)
    set_basket_symbols(basket_symbols)
  if (basket_exclude != basket_exclude_bu)
    set_basket_always_exclude_symbols(basket_exclude)
  if (basket_htb != basket_htb_bu)
    set_basket_hard_to_borrow_allowed_symbols(basket_htb)
  click_edit_basket_save_button()
  click_basket_manager_ok_button()
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  basket updated? (enter y or n or q)

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
  set_check_box(use_time_options, use_time_options_check_box, use_time_options_trigger_point)

  if (start_subscription != start_subscription_bu)
    set_time_option(start_subscription_trigger_point, start_subscription)
  if (start_entering_positions != start_entering_positions_bu)
    set_time_option(start_entering_positions_trigger_point, start_entering_positions)
  if (stop_entering_positions != stop_entering_positions_bu)
    set_time_option(stop_entering_positions_trigger_point, stop_entering_positions)
  if (cancel_all_pending_orders != cancel_all_pending_orders_bu)
    set_time_option(cancel_all_pending_orders_trigger_point, cancel_all_pending_orders)
  if (close_all_open_positions != close_all_open_positions_bu)
    set_time_option(close_all_open_positions_trigger_point, close_all_open_positions)
  if (place_OPG_orders != place_OPG_orders_bu)
    set_time_option(place_OPG_orders_trigger_point, place_OPG_orders)

  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  time options updated? (enter y or n or q)

  ;-----------------------------------------------------------------------------------------------
  }

}

if (  enable_position_sizing_scheme != enable_position_sizing_scheme_bu
  or position_sizing != position_sizing_bu)
{
  loop
  {
  ; position sizing --------------------------------------------------------------
  click_options_tab()
  set_check_box(enable_position_sizing_scheme, enable_position_sizing_scheme_check_box, enable_position_sizing_scheme_trigger_point)
  if (enable_position_sizing_scheme = "TRUE")
    set_position_sizing_scheme(position_sizing)
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  position sizing updated? (enter y or n or q)

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
  set_check_box(enable_black_box_risk_management, enable_black_box_risk_management_check_box, enable_black_box_risk_management_trigger_point)
  If (enable_black_box_risk_management = "TRUE")
    set_maximum_order_shares(maximum_order_shares)
  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question,  risk management updated? (enter y or n or q)

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
  set_check_box(enable_black_box_launch_rule, enable_black_box_launch_rule_check_box, enable_black_box_launch_rule_trigger_point)
  If(enable_black_box_launch_rule = "TRUE")
    set_launch_rule(launch_rules)


  ;-----------------------------------------------------------------------------------------------
  InputBox, response, Question, launch rule updated? (enter y or n or q)

  ;-----------------------------------------------------------------------------------------------
  }

}

click_validate_and_close()
