#include wait_policy.ahk
#include inform.ahk
#include logger.ahk

save_blackbox_click_save()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (!activate_and_wait("Save BlackBox", 60, 2))
    inform("click_save unable to activate save blackbox window")
  Click 73, 59
  Sleep, 200
  Click 235, 414
  wait_only("Information", 10)
}
