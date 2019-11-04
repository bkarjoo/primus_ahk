#include wait_policy.ahk
#include inform.ahk

tab_state_image_search(tab_name)
{
  activate_and_wait("PRIMU$ - Black Box Design", 2, 2)
  i1 := "images\\" . tab_name . ".PNG"
  ImageSearch, ox, oy, 0, 0, 350, 50, %i1%
  if (ErrorLevel = 0)
    return 1
  i2 := "images/" . tab_name . "2.PNG"
  ImageSearch, ox, oy, 0, 0, 350, 50, %i2%
  if (ErrorLevel = 0)
    return 1
  return 0
}

WinActivate, PRIMU$ - Black
WinWaitActive, PRIMU$ - Black
msgbox % A_WorkingDir
ImageSearch, j, k, 0, 0, 350, 50, "images/checked.PNG"
msgbox % ErrorLevel

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
