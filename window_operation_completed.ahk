#include wait_policy.ahk
#include logger.ahk

activate_operation_completed()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinActivate, Operation completed
  WinWaitActive, Operation completed
}

click_operation_completed_ok_button()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  activate_operation_completed()
  MouseClick, Left, 225, 120
  wait_only("D:\Users\", 60)
}
