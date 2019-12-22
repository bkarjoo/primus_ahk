#include wait_policy.ahk
#include inform.ahk
#window_launcher.ahk
#include logger.ahk

open_blackbox_activate()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := activate_and_wait("Open BlackBox", 2, 2)
  if (res = 0)
    inform("launcher_control launcher_activate failed.")
}

open_blackbox_folder_search_mode_toggle()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; TODO include image search to get the desired state
  Click, Left, 700, 40
  Sleep, 200
}

open_blackbox_search_field_focus()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; click on the search field
  Click, Left, 550, 40
  Sleep, 200
}

open_blackbox_search_click()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; TODO image search to make sure there's results (first search for nonexistent)
  Click, Left, 620, 40
  Sleep, 200
}

open_blackbox_click_first_row()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; TODO do exact match with cut and paste
  Click, Left, 400, 80
  Sleep, 200
}

open_blackbox_click_open()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Click, Left, 1080, 710
  err := wait_only("PRIMU$ - B", 60)
  if (err != 0)
    inform("open_blackbox_click_open failed")
}

open_blackbox_click_close()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Click, Left, 50, 710
  launcher_activate()
}

open_black_box_search_results_empty()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  image_path := creds["image_path"] . "box_search.PNG"
  ImageSearch, x, y, 0, 0, 600, 100, %image_path%
  if (ErrorLevel = 0)
    return 1
  return 0
}
