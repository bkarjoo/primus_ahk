; tab selection, and bottom buttons if needed



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
