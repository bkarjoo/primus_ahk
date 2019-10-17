; this file contains code to manipulate the black box designer
; assumes that the black box designer is already opened
; opening the black box is the responsibility the launcher_clicks.ahk
#include launcher_clicks.ahk
#include file_reader.ahk
#include check_boxes.ahk
#include basket_manager_clicks.ahk


ActivateBlackBoxDesign()
{
  WinActivate, PRIMU$ - Black Box Design
  WinWait, PRIMU$ - Black Box Design
  sleep, 100
}


; tabs -------------------------------------------------------------------------

click_design_tab()
{
MouseClick, Left, 26, 32
sleep, 200
}

click_symbols_tab()
{
MouseClick, Left, 77, 32
sleep, 500
}

click_options_tab()
{
MouseClick, Left, 123, 32
sleep, 500
}

click_risk_management_tab()
{
MouseClick, Left, 187, 32
sleep, 500
}

click_launch_rule_tab()
{
MouseClick, Left, 287, 32
sleep, 500
}

; main section -----------------------------------------------------------------
UpdateBoxName(name)
{
  MouseClick, Left, 252, 63
  Send, ^a
  sleep, 100
  Clipboard := name
  sleep, 100
  Send, ^v
  sleep, 100
}

UpdateBoxDescription(desc)
{
  MouseClick, Left, 325, 125
  Send, ^a
  sleep, 100
  Clipboard := desc
  sleep, 100
  Send, ^v
  sleep, 100
}

SetBlackBoxSide(side)
{
  MouseClick, Left, 200, 160
  sleep, 100
  if (side = "LONG")
    send, {Up}
  else if (side = "SHORT")
    send, {Down}
}

SetBlackBoxScheme(scheme)
{
  MouseClick, Left, 285, 190
  sleep, 100
  if (scheme = "OPG")
    MouseClick, Left, 285, 221
  else
    MouseClick, Left, 285, 206
}


; checkbox locations -----------------------------------------------------------
permit_backtesting_check_box := [616, 120]
enter_on_last_check_box := [760, 69]
enter_on_bid_check_box := [760, 94]
enter_on_ask_check_box := [760, 119]
enter_on_pmi_check_box := [760, 144]
enter_on_imbalance_check_box := [760, 193]
enter_on_snapshot_check_box := [867, 192]
enter_on_new_minute_check_box := [867, 170]
enter_on_stock_event_check_box := [760, 170]
use_strict_mode_check_box := [618, 197]
enable_stop_trailing_on_new_second_check_box := [12,825]
verify_code_during_validate_procedure_check_box := [523,909]

permit_backtesting_trigger_point := [628,130]
enter_on_last_trigger_point := [770, 79]
enter_on_bid_trigger_point := [770, 104]
enter_on_ask_trigger_point := [770, 129]
enter_on_pmi_trigger_point := [770, 154]
enter_on_imbalance_trigger_point := [770, 203]
enter_on_snapshot_trigger_point := [877, 202]
enter_on_new_minute_trigger_point := [877, 180]
enter_on_stock_event_trigger_point := [770, 180]
use_strict_mode_trigger_point := [628,207]
enable_stop_trailing_on_new_second_trigger_point := [22,835]
verify_code_during_validate_procedure_trigger_point := [533,919]


; entry trigger and order ------------------------------------------------------
UpdateEntryTrigger(rule)
{
  MouseClick, Left, 450, 300
  Send, ^a
  Clipboard := rule
  sleep, 100
  Send, ^v
  sleep, 100
}

OpenNewEntryOrder()
{
  MouseClick, Left, 900, 375
  WinWait, PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>
}

OpenExistingEntryOrder()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 394
  sleep, 100
  MouseClick, Left, 900, 400
  WinWait, PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>
}

; target order -----------------------------------------------------------------
OpenNewTargetOrder()
{
  MouseClick, Left, 900, 556
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}


OpenExistingTargetOrder()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 577
  sleep, 100
  MouseClick, Left, 900, 585
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}

; stop order -------------------------------------------------------------------
OpenNewStopOrder()
{
  MouseClick, Left, 900, 700
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_STOP_ORDER>
}


OpenExistingStopOrder()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 725
  sleep, 100
  MouseClick, Left, 900, 735
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_STOP_ORDER>
}

; symbols tab section ----------------------------------------------------------
click_choose_basket()
{
  MouseClick, Left, 918, 64
  WinWait, Basket Manager (prms-rdgw.primustrade.com)
}

; options tab section ----------------------------------------------------------

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
  Send, {Right}
  Send, %minute%
  Send, {Right}
  Send, %second%
  Send, {Right}
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

; risk management --------------------------------------------------------------
enable_black_box_risk_management_check_box := [15,50]
enable_black_box_risk_management_trigger_point := [21,58]

set_maximum_order_shares(shares)
{
  sleep, 100
  MouseClick, Left, 217, 634
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := shares
  sleep, 100
  Send, ^v
  sleep, 100
}

; launch_rules -----------------------------------------------------------------
enable_black_box_launch_rule_check_box := [14,49]
enable_black_box_launch_rule_trigger_point := [21,57]

set_launch_rule(rule)
{
  sleep, 100
  MouseClick, Left, 217, 300
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := StrReplace(rule, ".", "#")
  sleep, 100
  Send, ^v
  sleep, 100
}

click_validate_and_close()
{
  MouseClick, Left, 930, 920
}
