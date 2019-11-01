#include wait_policy.ahk

tab_state_image_search(tab_name)
{
  activate_and_wait("PRIMU$ - Black Box Design", 2)
  i1 := tab_name . ".PNG"
  ImageSearch, ox, oy, 0, 0, 350, 50, %i1%
  if (ErrorLevel = 0)
    return 1
  i2 := tab_name . "2.PNG"
  ImageSearch, ox, oy, 0, 0, 350, 50, %i2%
  if (ErrorLevel = 0)
    return 1
  return 0
}

tab_click_and_wait_active(x, y, tab_name)
{
  ; try 5 times with 2 second in between each try
  Loop, 5
  {
    activate_and_wait("PRIMU$ - Black Box Design", 2)
    MouseClick, Left, %x%, %y%
    Sleep, 1000
    err := tab_state_image_search(tab_name)
    if (tab_state_image_search(tab_name) = 1)
      return
    msgbox, not
    Sleep, 800
  }
}

click_design_tab()
{
tab_click_and_wait_active(26, 32, "design")
}

click_symbols_tab()
{
tab_click_and_wait_active(77, 32, "symbols")
}

click_options_tab()
{
tab_click_and_wait_active(123, 32, "options")
}

click_risk_management_tab()
{
tab_click_and_wait_active(187, 32, "risk_management")
}

click_launch_rule_tab()
{
tab_click_and_wait_active(287, 32, "launch_rule")
}

design_tab_selected()
{
  return tab_state_image_search("design")
}

symbols_tab_selected()
{
  return tab_state_image_search("symbols")
}

options_tab_selected()
{
  return tab_state_image_search("options")
}

risk_management_tab_selected()
{
  return tab_state_image_search("risk_management")
}

launch_rule_tab_selected()
{
  return tab_state_image_search("launch_rule")
}
