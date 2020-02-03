#include inform.ahk
#include logger.ahk

wait_only(window_name, wait_seconds)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinWaitActive, %window_name%, , %wait_seconds%
  return ErrorLevel
}

wait_activate_if_error(window_name, wait_seconds, attempts)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (wait_only(window_name, wait_seconds) = 0)
    return 1

  Loop, %attempts%
  {
    WinActivate, %window_name%
    err := wait_only(window_name, wait_seconds)
    if (err = 0)
      return 1
  }
  if (err = 1)
    return 0
}

wait_activate_popup_error(window_name, wait_seconds, attempts)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (wait_only(window_name, wait_seconds) = 0)
    return 1

  Loop, %attempts%
  {
    WinActivate, %window_name%
    err := wait_only(window_name, wait_seconds)
    if (err = 0)
      return 1
  }
  if (err = 1)
    msgbox, was not able to activate %window_name% 
}

activate_and_wait_only(window_name, wait_seconds)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinActivate, %window_name%
  err := wait_only(window_name, wait_seconds)
  if (err = 0)
    return 1
  return 0
}

activate_and_wait(window_name, wait_seconds, attempts)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Loop, %attempts%
  {
    WinActivate, %window_name%
    err := wait_only(window_name, wait_seconds)
    if (err = 0)
      return 1
  }
  return 0
}

click_activate_and_wait(calling_window, expected_window, click_x, click_y, wait_seconds, attempts)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Loop, %attempts%
  {
    res := activate_and_wait(calling_window, 1, 2)
    if (res = 0)
      inform("Cannot activate " . calling_window)
    MouseClick, Left, %click_x%, %click_y%
    res := wait_activate_if_error(expected_window, 1, 2)
    if (res = 1)
      return 1
  }
  return 0
}

wait_until_sec_or_enter(seconds)
{
    log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
    msg_txt := "Will resume after " . seconds . " seconds. Press enter to override."
    InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
}

wait_until_idle(seconds)
{
    log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
    seconds := seconds * 1000
    loop
    {
      if (A_TimeIdlePhysical > seconds)
        break
      Sleep, 1000
    }
}

wait_until_with_message(seconds, msg_txt)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  msg_txt := msg_txt . " (waiting for " . seconds . " seconds, enter p to pause, q to quit, enter to skip wait)"
  InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
  if (response = "p")
    InputBox, response, paused..., "Press enter to continue."
  else if (response = "q")
    ExitApp
}

hour_glass_sleep(millis)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  sleep, millis
  loop,
  {
    if (A_Cursor != "Wait")
      break
    sleep, 200
  }
}

pause_mechanism()
{
  FileRead, out, run_state.txt
  if (out = "False")
    InputBox, response, paused..., "Press enter to continue. (q to exit app)"
  FileDelete, run_state.txt
  FileAppend, True, run_state.txt
  if (response = "q")
    ExitApp
}
