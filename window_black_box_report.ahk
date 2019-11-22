#include window_blotter.ahk
#include wait_policy.ahk
#include inform.ahk


activate_black_box_report()
{
  WinActivate, Black Box Report
  WinWaitActive, Black Box Report
}

save_black_box_reports()
{
  ; this loop keys down the blotter and saves reports in the active directory in docx format
  Loop
  {
    activate_blotter()
    if (A_index > 1)
      send, {down}
    sleep, 200
    send, ^c
    sleep, 200
    box_name := Clipboard
    activate_black_box_report()
    sleep, 500
    MouseClick, Left, 336, 32
    sleep, 500
    MouseClick, Left, 372, 98
    sleep, 500

    WinWait, Save As
    WinWaitActive, Save As
    send, ^v
    sleep, 1000
    MouseClick, Left, 798, 510

    msg := "resuming soon"

    if (wait_only("Confirm Save As", 2) = 0)
    {
      send, {Space}
      WinWaitActive, Save As
      MouseClick, Left, 914, 508
      msg := "box exists"
    }

    WinWaitActive, Black Box Report
    WinActivate, cmd
    inform_timeout(msg, 5)
  }
}
