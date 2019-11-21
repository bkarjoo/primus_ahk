#include wait_policy.ahk


open_paint_app()
{
  run, mspaint.exe
  WinWait, ahk_class MSPaintApp
}

paint_app_activate()
{
  WinActivate, ahk_class MSPaintApp
  WinWaitActive, ahk_class MSPaintApp
}

paint_app_close()
{
  WinClose, ahk_class MSPaintApp
  WinWaitClose, ahk_class MSPaintApp
}

paint_app_paste_clipboard()
{
  paint_app_activate()
  send, ^v
  hour_glass_sleep(200)
}

paint_app_save_as(path)
{
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
