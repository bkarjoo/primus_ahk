#include window_launcher.ahk
#include window_open_blackbox.ahk
#include clipboard_paste.ahk
#include logger.ahk
#include wait_policy.ahk

find_box(box_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  box_name := Trim(box_name, "`r") ; just incase
  launcher_activate()
  launcher_click_open_box()
  sleep, 1000
  MouseClick, Left, 98, 280 ; click on boxes
  sleep, 200
  open_blackbox_folder_search_mode_toggle()
  sleep 1000
  open_blackbox_search_field_focus()
  sleep 200
  clipboard_simple_paste(box_name)
  sleep 200
  open_blackbox_search_click()
  inform_timeout_pause_option("Waiting 2 seconds for box to be found. ", 2)
  if (open_black_box_search_results_empty())
  {
    open_blackbox_click_close()
    return 0
  }
  open_blackbox_click_first_row()
  open_blackbox_click_open()
  return 1
}
