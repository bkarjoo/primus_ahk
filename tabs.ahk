#include wait_policy.ahk
#include inform.ahk
#include file_status.ahk

tab_state_image_search(caller_window, caller_wait_delay, caller_activation_attempts, tab_name, x1, y1, x2, y2)
{
  res := activate_and_wait(caller_window, caller_wait_delay, caller_activation_attempts)
  if (res = 0)
    inform("tab_state_img_search can't activate " . caller_window)
  i1 := "images/" . tab_name . ".PNG"
  i2 := "images/" . tab_name . "2.PNG"
  confirm_file_exists(i1)
  confirm_file_exists(i2)
  ImageSearch, ox, oy, %x1%, %y1%, %x2%, %y2%, %i1%
  Msgbox % ErrorLevel
  if (ErrorLevel = 0)
    return 1
  ImageSearch, ox, oy, %x1%, %y1%, %x2%, %y2%, %i2%
  if (ErrorLevel = 0)
    return 1
  return 0
}

tab_click_and_wait_active(caller_window, caller_wait_delay, caller_activation_attempts, activation_x, activation_y, activation_attempts, tab_name, x1, y1, x2, y2)
{
  ; try 5 times with 2 second in between each try
  Loop, %activation_attempts%
  {
    res := activate_and_wait(caller_window, caller_wait_delay, caller_activation_attempts)
    if (res = 0)
      inform("tab_click_and_wait_active cannot activate " . caller_window)

    ; check if tab is already clicked
    res := tab_state_image_search(caller_window, caller_wait_delay, caller_activation_attempts, tab_name, x1, y1, x2, y2)
    if (res = 1)
      return 1

    ; tab click
    MouseClick, Left, %activation_x%, %activation_y%
    Sleep, 500

    res := tab_state_image_search(caller_window, caller_wait_delay, caller_activation_attempts, tab_name, x1, y1, x2, y2)
    if (res = 1)
      return 1
  }
  return 0
}

msgbox % tab_click_and_wait_active("PRIMU$ - Black", 1, 2, 77, 32, 2, "symbols", 0, 0, 350, 50)
