#include wait_policy.ahk
#include inform.ahk

tab_state_image_search(tab_name)
{
  activate_and_wait("PRIMU$ - Black Box Design", 2, 2)
  i1 := "images/" . tab_name . ".PNG"
  ImageSearch, ox, oy, 0, 0, 350, 50, %i1%
  if (ErrorLevel = 0)
    return 1
  i2 := "images/" . tab_name . "2.PNG"
  ImageSearch, ox, oy, 0, 0, 350, 50, %i2%
  if (ErrorLevel = 0)
    return 1
  return 0
}

tab_click_and_wait_active(x, y, tab_name, attempts)
{
  ; try 5 times with 2 second in between each try
  Loop, %attempts%
  {
    res := activate_and_wait("PRIMU$ - Black Box Design", 1, 2)
    if (res = 0)
      inform("Cannot activate black box design")

    ; check if tab is already clicked
    res := tab_state_image_search(tab_name)
    if (res = 1)
      return

    ; tab click
    MouseClick, Left, %x%, %y%
    Sleep, 200

    res := tab_state_image_search(tab_name)
    if (res = 1)
      return
  }
  inform("Cannot select tab " . tab_name)
}

click_design_tab()
{
tab_click_and_wait_active(26, 32, "design", 2)
}

click_symbols_tab()
{
tab_click_and_wait_active(77, 32, "symbols", 2)
}

click_options_tab()
{
tab_click_and_wait_active(123, 32, "options", 2)
}

click_risk_management_tab()
{
tab_click_and_wait_active(187, 32, "risk_management", 2)
}

click_launch_rule_tab()
{
tab_click_and_wait_active(287, 32, "launch_rule", 2)
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
