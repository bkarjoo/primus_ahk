#include wait_policy.ahk
#include inform.ahk
#include logger.ahk
#include files.ahk


win_activate_black_box_design()
{
  SetTitleMatchMode, 2
  WinActivate, ahk_exe mstsc.exe,, primus
}

win_wait_active_black_box_design()
{
  SetTitleMatchMode, 2
  WinWaitActive , ahk_exe mstsc.exe, , , primus
  if (ErrorLevel = 0)
    return 1
  else
    return 0
}

win_wait_active_black_box_design_2()
{
  PixelGetColor, OutputVar, 951, 453
  found := OutputVar = "0x2128BD"
  return found
}


selected_bbdesign_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := activate_and_wait_only("PRIMU$ - B", 5)
  if (res = 0)
    inform("selected_bbdesign_tab can't activate blackbox design")
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  image_path := creds["image_path"] . "design.PNG"
  ImageSearch, ox, oy, 0, 0, 500, 500, %image_path%
  if (ErrorLevel = 0)
    return 1
  image_path := creds["image_path"] . "symbols.PNG"
  ImageSearch, ox, oy, 0, 0, 500, 500, %image_path%
  if (ErrorLevel = 0)
    return 2
  image_path := creds["image_path"] . "options.PNG"
  ImageSearch, ox, oy, 0, 0, 500, 500, %image_path%
  if (ErrorLevel = 0)
    return 3
  image_path := creds["image_path"] . "risk_management.PNG"
  ImageSearch, ox, oy, 0, 0, 500, 500, %image_path%
  if (ErrorLevel = 0)
    return 4
  image_path := creds["image_path"] . "launch_rule.PNG"
  ImageSearch, ox, oy, 0, 0, 500, 500, %image_path%
  if (ErrorLevel = 0)
    return 5
}

click_tab(x, y)
{
  win_activate_black_box_design()
  res := win_wait_active_black_box_design()
  if (!res)
    msgbox stuck window_black_box_design.ahk 66
  MouseClick, Left, %x%, %y%
  Sleep, 300
  return 1
}

click_and_confirm_bbd_tab(x, y, index)
{
  return click_tab(x, y)
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := activate_and_wait_only("PRIMU$ - B", 5)
  if (res != 1)
    inform("Cannot activate black box design. 74")
  if (selected_bbdesign_tab() = index)
    return 1
  MouseClick, Left, %x%, %y%
  Loop, 10
  {
    hour_glass_sleep(200)
    if (selected_bbdesign_tab() = index)
      return 1
    send, {Tab}
  }
  return 0
}

click_design_tab_no_confirm()
{
  x := 26
  y := 32

  res := activate_and_wait_only("PRIMU$ - B", 5)
  if (res != 1)
    inform("Cannot activate black box design. 95")

  MouseClick, Left, %x%, %y%
}


click_design_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_and_confirm_bbd_tab(26, 32, 1)
  if (res = 0)
    inform("Failed to select design tab.")
}

click_symbols_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_and_confirm_bbd_tab(77, 32, 2)
  if (res = 0)
    inform("Failed to select symbols tab.")
}

click_options_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_and_confirm_bbd_tab(123, 32, 3)
  if (res = 0)
    inform("Failed to select options tab.")
}

click_risk_management_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_and_confirm_bbd_tab(187, 32, 4)
  if (res = 0)
    inform("Failed to select risk management tab.")
}

click_launch_rule_tab_no_confirm()
{
  x := 287
  y := 32

  res := activate_and_wait_only("PRIMU$ - B", 5)
  if (res != 1)
    inform("Cannot activate black box design. 140")

  MouseClick, Left, %x%, %y%
}

click_launch_rule_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_and_confirm_bbd_tab(287, 32, 5)
  if (res = 0)
    inform("Failed to select launch rule tab.")
}

click_validate_and_close()
{
  /*
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := win_wait_active_black_box_design()
  if (res != 1)
    inform("Cannot activate black box design. 158")
  */
  win_activate_black_box_design()
  win_wait_active_black_box_design()
  MouseClick, Left, 930, 910
  WinWaitActive, OK
  ; TODO add option to cancel out of failed box so auto run doesn't crash
  send, {Space}
  err := wait_only("Primu$ 7.", 5)
  if (err != 0)
    inform("click_validate_and_close doesn't yield to launcher")

}

finalize_build()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  click_validate_and_close()
}
