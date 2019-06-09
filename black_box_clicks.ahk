; this file contains code to manipulate the black box designer
; assumes that the black box designer is already opened by the launcher_clicks.ahk




#include launcher_clicks.ahk
#include file_reader.ahk

; OpenBlackBoxDesign() is launcher_clicks.ahk responsibility

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
  ImageSearch,  LocX, LocY, checkbox_point[1], checkbox_point[2], checkbox_point[1]+31, checkbox_point[2]+20, checked.PNG
  return (ErrorLevel = 0)
}


TriggerCheckBox(checkbox_point)
{
  x := checkbox_point[1] + 10
  y := checkbox_point[2] + 10
  MouseClick, Left, %x%, %y%
}

SetCheckBox(value, check_box)
{
  if (value = "TRUE")
  {
    if (!IsChecked(check_box))
      TriggerCheckBox(check_box)
  } else {
    if (IsChecked(check_box))
      TriggerCheckBox(check_box)
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


UpdateEntryTrigger(rule)
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  MouseClick, Left, 450, 350
  Send, ^a
  Send, %rule%
}

OpenNewEntryOrder()
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  MouseClick, Left, 900, 425
  WinWait, PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>
}

OpenExistingEntryOrder()
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 445
  sleep, 100
  MouseClick, Left, 900, 450
  WinWait, PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>
}


OpenNewTargetOrder()
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  MouseClick, Left, 900, 600
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}


OpenExistingTargetOrder()
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 625
  sleep, 100
  MouseClick, Left, 900, 635
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}


OpenNewStopOrder()
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  MouseClick, Left, 900, 750
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}


OpenExistingStopOrder()
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  ; assumes there's only one order, therefore click top line
  MouseClick, Left, 400, 775
  sleep, 100
  MouseClick, Left, 900, 785
  WinWait, PRIMU$ - Add/Edit Order Form <EXIT_LIMIT_ORDER>
}

ClearExpressionBuilderCode()
{
  ; assumes expression builder is open
  ; clear existing code by pressing the clear button
  MouseClick, Left, 760, 230
  sleep, 10
}

ClickExpressionBuilderOk()
{
  MouseClick, Left, 900, 550 ; press expression builder ok
  sleep, 10
}

SetExpressionBuilderCode(rule)
{
  ; assumes expression builder is open
  ClearExpressionBuilderCode()

  ; click the text area
  MouseClick, Left, 500, 100
  sleep, 100
  ; add the rule
  Send, %rule%
  sleep, 100

  ClickExpressionBuilderOk()
}

OpenLimitOrderExpressionBuilder()
{
  MouseClick, Left, 540, 150
  WinWait, PRIMU$ - Expression Builder
}


SetOrderLimitRule(rule)
{
  ; assumes the order window is open
  ; use this function with entry and target orders
  ; open the edit window
  WinActivate, PRIMU$ - Add/Edit Order Form
  WinWait, PRIMU$ - Add/Edit Order Form
  OpenLimitOrderExpressionBuilder()
  SetExpressionBuilderCode(rule)
}



SetAelTriggerRule()
{

}

SetAelHowRule()
{

}

SetAelPriceIncrement()
{

}

SetAelTimeIncrement()
{

}

;LoadFile("test_file.i")
;MsgBox, %entry_order_limit%


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
