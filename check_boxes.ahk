#include wait_policy.ahk

; takes a point array with x being first item and y the second
is_checked(checkbox_point)
{
  sleep, 100
  ImageSearch,  LocX, LocY, checkbox_point[1], checkbox_point[2], checkbox_point[1]+41, checkbox_point[2]+30, checked.PNG
  return (ErrorLevel = 0)
}

trigger_check_box(checkbox_point)
{
  x := checkbox_point[1]
  y := checkbox_point[2]
  MouseClick, Left, %x%, %y%
}

set_check_box(value, check_box, trigger_point)
{
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
  err := wait_only(caller_window, wait_delay)
  if (err != 0)
    inform(caller_window . " could not be activated. set_check_box_confirm failed.")
  set_check_box(value, check_box, trigger_point)
}
