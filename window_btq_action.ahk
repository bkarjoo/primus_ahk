#include wait_policy.ahk
#include logger.ahk

is_success()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  activate_and_wait_only("BTQ Action", 5)
  ImageSearch, imgLocA, imgLocB, 0, 0, 315, 107, images/Success.PNG
  return (ErrorLevel = 0)
}

btq_action_press_ok()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  activate_and_wait_only("BTQ Action", 5)
  MouseClick, Left, 271, 122
  wait_only("Primu$ 7.", 60)
}
