#include wait_policy.ahk
#include files.ahk
#include paint.ahk
#include logger.ahk

capture_equity_curve()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinActivate, Multi-Day Analysis Report
  WinWaitActive, Multi-Day Analysis Report
  WinActivate, Statistic Report
  WinWaitActive, Statistic Report
  WinActivate, PnL Analysis Charting
  WinWaitActive, PnL Analysis Charting
  hour_glass_sleep(200)
  send, {PrintScreen}
  hour_glass_sleep(200)
  open_paint_app()
  hour_glass_sleep(1000)
  paint_app_paste_clipboard()

  creds := {}
  load_csv_dictionary("secret.csv", creds)
  path := creds["capture_path"]

  paint_app_save_as(path)
  paint_app_close()
}
