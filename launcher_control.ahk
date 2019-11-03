; this module replaces launcher clicks
#include wait_policy.ahk
#include inform.ahk

launcher_activate()
{
  activate_and_wait("Primu$ 7.", 2)
}

launcher_click_new_box()
{
  launcher_activate()
  Click 32,41
  wait_only("PRIMU$ - Black", 5)
}

launcher_click_open_box()
{
  launcher_activate()
  Click 83, 54
  wait_only("Open BlackBox", 5)
}

launcher_click_save_box()
{
  launcher_activate()
  Click 133, 49
  err := wait_only("Information", 1)
  if (err != 0)
    err := wait_only("Save BlackBox", 1)
  if (err != 0)
    inform("Save button didn't click.")
}

launcher_click_save_as()
{
  launcher_activate()
  Click 189, 49
  wait_only("Save BlackBox", 5)
}

launcher_click_edit_box()
{
  launcher_activate()
  Click 243, 49
  wait_only("WinWait PRIMU$ - Black Box Design", 5)
}


launcher_click_play()
{
  launcher_activate()
  Click 303, 49
  wait_only("WinWait BTQ Action", 5)
}


launcher_click_gear()
{
  launcher_activate()
  Click 462, 49
}


launcher_click_wrench()
{
launcher_activate()
Click 515, 49
wait_only("PRIMU$ -- Configuration", 5)
}


launcher_click_queue_manager()
{
launcher_activate()
Click 576, 49
wait_only("PRIMU$ -- Backtesting Queue Manage", 5)
}


launcher_click_diagnostics()
{
launcher_activate()
Click 634, 49
; diagnostic window isn't detected
wait_only("PRIMU$ -- Diagnostics Window", 5)
}
