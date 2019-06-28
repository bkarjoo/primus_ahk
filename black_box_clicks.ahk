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
  MouseClick, Left, 200, 200
  sleep, 100
  if (side = "LONG")
    send, {Up}
  else if (side = "SHORT")
    send, {Down}
}

SetBlackBoxScheme(scheme)
{
  MouseClick, Left, 285, 225
  sleep, 100
  if (scheme = "OPG")
    MouseClick, Left, 285, 255
  else
    MouseClick, Left, 285, 240
}


; checkbox locations -----------------------------------------------------------
permit_backtesting_check_box := [616, 120]
enter_on_last_check_box := [760, 69]
enter_on_bid_check_box := [760, 94]
enter_on_ask_check_box := [760, 119]
enter_on_pmi_check_box := [760, 144]
enter_on_imbalance_check_box := [760, 169]
enter_on_snapshot_check_box := [760, 194]
enter_on_new_minute_check_box := [760, 219]
enter_on_stock_event_check_box := [760, 242]
use_strict_mode_check_box := [12, 258]
enable_stop_trailing_on_new_second_check_box := [17,877]
verify_code_during_validate_procedure_check_box := [515,930]


permit_backtesting_trigger_point := [628,130]
enter_on_last_trigger_point := [770, 79]
enter_on_bid_trigger_point := [770, 104]
enter_on_ask_trigger_point := [770, 129]
enter_on_pmi_trigger_point := [770, 154]
enter_on_imbalance_trigger_point := [770, 179]
enter_on_snapshot_trigger_point := [770, 204]
enter_on_new_minute_trigger_point := [770, 229]
enter_on_stock_event_trigger_point := [770, 252]
use_strict_mode_trigger_point := [23,267]
enable_stop_trailing_on_new_second_trigger_point := [27,884]
verify_code_during_validate_procedure_trigger_point := [533,943]

; entry trigger and order ------------------------------------------------------
UpdateEntryTrigger(rule)
{
  MouseClick, Left, 450, 350
  Send, ^a
  Clipboard := rule
  sleep, 100
  Send, ^v
  sleep, 100
}

OpenNewEntryOrder()
{
  MouseClick, Left, 900, 425
  WinWait, PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>
}

OpenExistingEntryOrder()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 445
  sleep, 100
  MouseClick, Left, 900, 450
  WinWait, PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>
}

; target order -----------------------------------------------------------------
OpenNewTargetOrder()
{
  MouseClick, Left, 900, 600
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}


OpenExistingTargetOrder()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 625
  sleep, 100
  MouseClick, Left, 900, 635
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}

; stop order -------------------------------------------------------------------
OpenNewStopOrder()
{
  MouseClick, Left, 900, 750
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_STOP_ORDER>
}


OpenExistingStopOrder()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 775
  sleep, 100
  MouseClick, Left, 900, 785
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_STOP_ORDER>
}

; symbols tab section ----------------------------------------------------------
click_choose_basket()
{
  MouseClick, Left, 918, 64
  WinWait, Basket Manager (prms-rdgw.primustrade.com)
}

; options tab section ----------------------------------------------------------

use_time_options_check_box := [20,70]
use_time_options_trigger_point := [27,75]

start_subscription_trigger_point := [180,106]
start_entering_positions_trigger_point := [180,144]
stop_entering_positions_trigger_point := [180,180]
cancel_all_pending_orders_trigger_point := [180,216]
close_all_open_positions_trigger_point := [180,251]
place_OPG_orders_trigger_point := [180,288]

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
  Clipboard := rule
  sleep, 100
  Send, ^v
  sleep, 100
}

click_validate_and_close()
{
  MouseClick, Left, 930, 945
}
