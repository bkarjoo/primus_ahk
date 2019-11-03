#include black_box_tabs.ahk
#include wait_policy.ahk

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
