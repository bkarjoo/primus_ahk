#include wait_policy.ahk
#include inform.ahk

open_blackbox_folder_search_mode_toggle()
{
  ; TODO include image search to get the desired state
  Click, Left, 700, 40
  Sleep, 200
}

open_blackbox_search_field_focus()
{
  ; click on the search field
  Click, Left, 550, 40
  Sleep, 200
}

open_blackbox_search_click()
{
  ; TODO image search to make sure there's results (first search for nonexistent)
  Click, Left, 620, 40
  Sleep, 200
}

open_blackbox_click_first_row()
{
  ; TODO do exact match with cut and paste
  Click, Left, 400, 80
  Sleep, 200
}

open_blackbox_click_open()
{
  Click, Left, 1080, 710
  err := wait_only("PRIMU$ - B", 5)
  if (err != 0)
    inform("open_blackbox_click_open failed")
}
