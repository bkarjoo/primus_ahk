#include wait_policy.ahk
#include inform.ahk
#include files.ahk

selected_bbdesign_tab()
{
  res := activate_and_wait_only("PRIMU$ - B", 5)
  if (res = 0)
    inform("selected_bbdesign_tab can't activate blackbox design")
  ImageSearch, ox, oy, 0, 0, 500, 500, images/design.PNG
  if (ErrorLevel = 0)
    return 1
  ImageSearch, ox, oy, 0, 0, 500, 500, images/symbols.PNG
  if (ErrorLevel = 0)
    return 2
  ImageSearch, ox, oy, 0, 0, 500, 500, images/options.PNG
  if (ErrorLevel = 0)
    return 3
  ImageSearch, ox, oy, 0, 0, 500, 500, images/risk_management.PNG
  if (ErrorLevel = 0)
    return 4
  ImageSearch, ox, oy, 0, 0, 500, 500, images/launch_rule.PNG
  if (ErrorLevel = 0)
    return 5
}

click_and_confirm_bbd_tab(x, y, index)
{
res := activate_and_wait_only("PRIMU$ - B", 5)
if (res != 1)
  inform("Cannot activate black box design.")
MouseClick, Left, %x%, %y%
Loop, 10
{
  sleep, 100
  if (selected_bbdesign_tab() = index)
    return A_Index
  send, {Tab}
}
return 0
}

click_design_tab()
{
res := click_and_confirm_bbd_tab(26, 32, 1)
if (res = 0)
  inform("Failed to select design tab.")
}

click_symbols_tab()
{
res := click_and_confirm_bbd_tab(77, 32, 2)
if (res = 0)
  inform("Failed to select symbols tab.")
}

click_options_tab()
{
res := click_and_confirm_bbd_tab(123, 32, 3)
if (res = 0)
  inform("Failed to select options tab.")
}

click_risk_management_tab()
{
res := click_and_confirm_bbd_tab(187, 32, 4)
if (res = 0)
  inform("Failed to select risk management tab.")
}

click_launch_rule_tab()
{
res := click_and_confirm_bbd_tab(287, 32, 5)
if (res = 0)
  inform("Failed to select launch rule tab.")
}


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

entry_update_trigger(rule, attempts)
{
  loop, %attempts%
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
  }
  return 0
}

entry_open_new_order(attempts)
{
  loop, %attempts%
  {
    click_design_tab()
    MouseClick, Left, 900, 375
    err := wait_only("PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>", 5)
    if (err = 0)
      return 1
  }
  return 0
}

entry_open_existing_order(attempts)
{
  loop, %attempts%
  {
    ; assumes there's only one order, therefore click top line
    click_design_tab()
    MouseClick, Left, 400, 394
    sleep, 200
    MouseClick, Left, 900, 400
    err := wait_only("PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>", 5)
    if (err = 0)
      return 1
  }
  return 0
}

target_open_new_order(attempts)
{
  loop, %attempts%
  {
    click_design_tab()
    MouseClick, Left, 900, 556
    err := wait_only("PRIMU$ - Add/Edit Order Form", 5)
    if (err = 0)
      return 1
  }
  return 0
}

stop_open_new_order(attempts)
{
  loop, %attempts%
  {
    click_design_tab()
    MouseClick, Left, 900, 705
    err := wait_only("PRIMU$ - Add/Edit Order Form", 5)
    if (err = 0)
      return 1
  }
  return 0
}
