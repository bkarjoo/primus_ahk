; this file contains code to manipulate the black box designer
; assumes that the black box designer is already opened
; opening the black box is the responsibility the launcher_clicks.ahk
#include launcher_clicks.ahk
#include file_reader.ahk

ActivateBlackBoxDesign()
{
  WinActivate, PRIMU$ - Black Box Design
  WinWait, PRIMU$ - Black Box Design
  sleep, 100
}

UpdateBoxName(name)
{
  MouseClick, Left, 252, 63
  Send, ^a
  SendRaw, %name%
}

UpdateBoxDescription(desc)
{
  MouseClick, Left, 325, 125
  Send, ^a
  SendRaw, %desc%
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

; takes a point array with x being first item and y the second
IsChecked(checkbox_point)
{
  ImageSearch,  LocX, LocY, checkbox_point[1], checkbox_point[2], checkbox_point[1]+41, checkbox_point[2]+30, checked.PNG
  return (ErrorLevel = 0)
}


TriggerCheckBox(checkbox_point)
{
  x := checkbox_point[1]
  y := checkbox_point[2]
  MouseClick, Left, %x%, %y%
}

SetCheckBox(value, check_box, trigger_point)
{
  if (value = "TRUE")
  {
    if (!IsChecked(check_box))
      TriggerCheckBox(trigger_point)
  } else {
    if (IsChecked(check_box))
      TriggerCheckBox(trigger_point)
  }
}

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

UpdateEntryTrigger(rule)
{
  MouseClick, Left, 450, 350
  Send, ^a
  Send, %rule%
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


OpenNewStopOrder()
{
  MouseClick, Left, 900, 750
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}


OpenExistingStopOrder()
{
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 775
  sleep, 100
  MouseClick, Left, 900, 785
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}


/*
box name update
entry trigger update
new entry order
update entry order
new target order
update target order
new stop order
update stop order
update position sizing
new basket
update basket
*/
