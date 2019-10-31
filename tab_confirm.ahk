
design_tab_selected()
{
  WinActivate, PRIMU$ - Black Box Design
  WinWait, PRIMU$ - Black Box Design
  ImageSearch, ox, oy, 0, 0, 350, 50, design.PNG
  if (ErrorLevel = 0)
    return 1
  ImageSearch, ox, oy, 0, 0, 350, 50, design2.PNG
  if (ErrorLevel = 0)
    return 1
  return 0
}

symbols_tab_selected()
{
  WinActivate, PRIMU$ - Black Box Design
  WinWait, PRIMU$ - Black Box Design
  ImageSearch, ox, oy, 0, 0, 350, 50, symbols.PNG
  if (ErrorLevel = 0)
    return 1
  ImageSearch, ox, oy, 0, 0, 350, 50, symbols2.PNG
  if (ErrorLevel = 0)
    return 1
  return 0
}

options_tab_selected()
{
  WinActivate, PRIMU$ - Black Box Design
  WinWait, PRIMU$ - Black Box Design
  ImageSearch, ox, oy, 0, 0, 350, 50, options.PNG
  if (ErrorLevel = 0)
    return 1
  ImageSearch, ox, oy, 0, 0, 350, 50, options2.PNG
  if (ErrorLevel = 0)
    return 1
  return 0
}

risk_management_tab_selected()
{
WinActivate, PRIMU$ - Black Box Design
WinWait, PRIMU$ - Black Box Design
ImageSearch, ox, oy, 0, 0, 350, 50, risk_management.PNG
if (ErrorLevel = 0)
  return 1
ImageSearch, ox, oy, 0, 0, 350, 50, risk_management2.PNG
if (ErrorLevel = 0)
  return 1
return 0
}

launch_rule_tab_selected()
{
WinActivate, PRIMU$ - Black Box Design
WinWait, PRIMU$ - Black Box Design
ImageSearch, ox, oy, 0, 0, 350, 50, launch_rule.PNG
if (ErrorLevel = 0)
  return 1
ImageSearch, ox, oy, 0, 0, 350, 50, launch_rule2.PNG
if (ErrorLevel = 0)
  return 1
return 0
}
