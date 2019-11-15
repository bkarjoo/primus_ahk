#include window_launcher.ahk
#include window_open_blackbox.ahk
#include clipboard_paste.ahk

find_box(box_name)
{
  box_name := Trim(box_name, "`r") ; just incase
  launcher_activate()
  launcher_click_open_box()
  open_blackbox_folder_search_mode_toggle()
  sleep 200
  open_blackbox_search_field_focus()
  sleep 200
  clipboard_simple_paste(box_name)
  open_blackbox_search_click()
  sleep, 500
  if (open_black_box_search_results_empty())
  {
    open_blackbox_click_close()
    return 0
  }
  open_blackbox_click_first_row()
  open_blackbox_click_open()
  return 1
}
