#include launcher_control.ahk
#include open_blackbox.ahk

find_box(box_name)
{
  ; requires exact match
  box_name := Trim(box_name, "`r")
  launcher_activate()
  launcher_click_open_box()
  open_blackbox_folder_search_mode_toggle()
  open_blackbox_search_field_focus()

  Clipboard := box_name
  Send, ^v
  Sleep, 500

  open_blackbox_search_click()
  open_blackbox_click_first_row()
  open_blackbox_click_open()
}
