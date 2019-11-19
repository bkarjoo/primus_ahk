#include wait_policy.ahk

capture_equity_curve()
{
  WinActivate, PnL Analysis Charting
  WinWaitActive, PnL Analysis Charting
  WinActivate, Multi-Day Analysis Report
  WinWaitActive, Multi-Day Analysis Report
  WinActivate, Statistic Report
  WinWaitActive, Statistic Report
  hour_glass_sleep(200)
  send, {PrintScreen}
  hour_glass_sleep(200)
  run, mspaint.exe
  WinWaitActive, Untitled - Paint
  hour_glass_sleep(1000)
  send, ^v
  hour_glass_sleep(200)
  send, ^s
  WinWaitActive, Save As
  send, image.png
  hour_glass_sleep(200)
  send, {Enter}
  hour_glass_sleep(200)
  if (WinExist("Confirm Save As"))
  {
    Send, y
    hour_glass_sleep(200)
    WinWaitActive, image.png
  }
  WinClose, image.png
}
