; tab selection, and bottom buttons if needed
#include tabs.ahk

bb_tab_x1 := 0
bb_tab_y1 := 0
bb_tab_x2 := 350
bb_tab_y2 := 50

click_design_tab()
{
return tab_click_and_wait_active("PRIMU$ - Black", 1, 2, 26, 32, 2, "design", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

click_symbols_tab()
{
return tab_click_and_wait_active("PRIMU$ - Black", 1, 2, 77, 32, 2, "symbols", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}



msgbox % click_design_tab()
msgbox done

click_options_tab()
{
tab_click_and_wait_active("PRIMU$ - Black", 1, 2, 123, 32, 2, "options", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

click_risk_management_tab()
{
tab_click_and_wait_active("PRIMU$ - Black", 1, 2, 187, 32, 2, "risk_management", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

click_launch_rule_tab()
{
tab_click_and_wait_active("PRIMU$ - Black", 1, 2, 287, 32, 2, "launch_rule", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

design_tab_selected()
{
  return tab_state_image_search("PRIMU$ - Black", 1, 2,"design", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

symbols_tab_selected()
{
  return tab_state_image_search("PRIMU$ - Black", 1, 2,"symbols", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

options_tab_selected()
{
  return tab_state_image_search("PRIMU$ - Black", 1, 2,"options", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

risk_management_tab_selected()
{
  return tab_state_image_search("PRIMU$ - Black", 1, 2,"risk_management", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}

launch_rule_tab_selected()
{
  return tab_state_image_search("PRIMU$ - Black", 1, 2,"launch_rule", bb_tab_x1, bb_tab_y1, bb_tab_x2, bb_tab_y2)
}
