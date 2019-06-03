; this file contains code to manipulate the black box designer
; assumes that the black box designer is already opened by the launcher_clicks.ahk




#include launcher_clicks.ahk
#include file_reader.ahk

UpdateBoxName(name)
{
  WinActivate, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  WinWait, PRIMU$ - Black Box Design (prms-rdgw.primustrade.com)
  MouseClick, Left, 252, 63
  Send, ^a
  Send, %name%
}

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




SetOrderLimitRule("Some Other Rule")

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
