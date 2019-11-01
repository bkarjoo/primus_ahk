; this module replaces launcher clicks
#include wait_policy.ahk

launcher_activate()
{
  activate_and_wait("Primu$ 7.", 2)
}

launcher_click_new_box()
{
  launcher_activate()
  Click 32,41
}

launcher_click_open_box()
{
  launcher_activate()
  Click 83, 54
  wait("Open BlackBox", 5)
}


launcher_click_save_box()
{
  launcher_activate()
  Click 133, 49

}


launcher_click_save_as()
{
  launcher_activate()
  Click 189, 49
  WinWait Save BlackBox
}


launcher_click_edit_box()
{
  launcher_activate()
  Click 243, 49
  WinWait PRIMU$ - Black Box Design
}


launcher_click_play()
{
launcher_activate()
Click 303, 49
WinWait BTQ Action
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
WinWait PRIMU$ -- Configuration
}


launcher_click_queue_manager()
{
launcher_activate()
Click 576, 49
WinWait PRIMU$ -- Backtesting Queue Manage
}


launcher_click_diagnostics()
{
launcher_activate()
Click 634, 49
; diagnostic window isn't detected
;WinWait PRIMU$ -- Diagnostics Window
}
