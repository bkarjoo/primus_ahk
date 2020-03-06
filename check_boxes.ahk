#include wait_policy.ahk
#include logger.ahk

/*
; takes a point array with x being first item and y the second
is_checked(checkbox_point)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  sleep, 100
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  image_path := creds["image_path"] . "checked.PNG"
  ImageSearch,  LocX, LocY, checkbox_point[1], checkbox_point[2], checkbox_point[1]+41, checkbox_point[2]+30, %image_path%
  return (ErrorLevel = 0)
}
*/

is_checked(checkbox_point)
{
  x := checkbox_point[1]
  y := checkbox_point[2]
  p := x + 18
  q := y + 18
  PixelSearch, out1, out2, %x%, %y%, %p%, %q%, 000

  return out1 > 0
}

trigger_check_box(checkbox_point)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  x := checkbox_point[1]
  y := checkbox_point[2]
  MouseClick, Left, %x%, %y%
}

set_check_box(value, check_box, trigger_point)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (value = "TRUE")
  {
    if (!is_checked(check_box))
      trigger_check_box(trigger_point)
  } else {
    if (is_checked(check_box))
      trigger_check_box(trigger_point)
  }
}

set_check_box_confirm(caller_window, wait_delay, value, check_box, trigger_point)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  err := wait_only(caller_window, wait_delay)
  if (err != 0)
    inform(caller_window . " could not be activated. set_check_box_confirm failed.")
  set_check_box(value, check_box, trigger_point)
}
