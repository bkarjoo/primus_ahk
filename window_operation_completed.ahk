#include wait_policy.ahk

activate_operation_completed()
{
  WinActivate, Operation completed
  WinWaitActive, Operation completed
}

click_operation_completed_ok_button()
{
  activate_operation_completed()
  MouseClick, Left, 225, 120
  wait_only("D:\Users\", 60)
}
