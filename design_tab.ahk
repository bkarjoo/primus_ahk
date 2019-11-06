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
