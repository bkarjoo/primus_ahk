#include header.ahk

information_click_ok()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (!activate_and_wait_only("Information", 60))
    inform("information_click_ok unable to activate save Information window")
  Click 130, 120
  wait_only("Primu$ 7.", 10)
}
