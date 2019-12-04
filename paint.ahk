#include wait_policy.ahk
#include logger.ahk


open_paint_app()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  run, mspaint.exe
  WinWait, ahk_class MSPaintApp
}

paint_app_activate()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinActivate, ahk_class MSPaintApp
  WinWaitActive, ahk_class MSPaintApp
}

paint_app_close()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinClose, ahk_class MSPaintApp
  WinWaitClose, ahk_class MSPaintApp
}

paint_app_paste_clipboard()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  paint_app_activate()
  send, ^v
  hour_glass_sleep(200)
}

paint_app_save_as(path)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  paint_app_activate()
  send, ^s
  WinWaitActive, Save As
  send, %path%
  hour_glass_sleep(200)
  send, {Enter}
  hour_glass_sleep(1000)
  if (WinExist("Confirm Save As"))
  {
    Send, y
    hour_glass_sleep(200)
    WinWaitActive,ahk_class MSPaintApp
  }
}
