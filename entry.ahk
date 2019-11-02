#include black_box_tabs.ahk
#includ wait_policy.ahk

entry_update_trigger(rule)
{
  click_design_tab()
  MouseClick, Left, 450, 300
  Send, ^a
  Clipboard := rule
  sleep, 200
  Send, ^v
  sleep, 200
}

entry_open_new_order()
{
  click_design_tab()
  MouseClick, Left, 900, 375
  err := wait_only("PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>", 5)
  return err ; if err is not 0 you can try again
}

entry_open_existing_order()
{
  ; assumes there's only one order, therefore click top line
  click_design_tab()
  MouseClick, Left, 400, 394
  sleep, 200
  MouseClick, Left, 900, 400
  err := wait_only("PRIMU$ - Add/Edit Order Form <ENTRY_ORDER>", 5)
  return err ; if err is not 0 you can try again
}
