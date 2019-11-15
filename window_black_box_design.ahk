#include wait_policy.ahk
#include inform.ahk

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
if (selected_bbdesign_tab() = index)
  return 1
MouseClick, Left, %x%, %y%
Loop, 10
{
  sleep, 100
  if (selected_bbdesign_tab() = index)
    return 1
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

click_validate_and_close()
{
  res := activate_and_wait_only("PRIMU$ - B", 5)
  if (res != 1)
    inform("Cannot activate black box design.")
  MouseClick, Left, 930, 920
  ; TODO control goes to info
  err := wait_only("OK", 5)
  if (err != 0)
    inform("There's a problem with the created box")
  ; TODO add option to cancel out of failed box so auto run doesn't crash
  send, {Space}
  err := wait_only("Primu$ 7.", 5)
  if (err != 0)
    inform("click_validate_and_close doesn't yield to launcher")
}

finalize_build()
{
  click_validate_and_close()
}
