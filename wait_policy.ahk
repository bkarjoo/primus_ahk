#include logger.ahk


inform_timeout_pause_option(msg, seconds)
{
  msg_txt := msg . " (waiting for " . seconds . " seconds, enter p to pause, q to quit, enter to skip wait)"
  InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
  if (response = "p")
    pause_only()
  else if (response = "q")
    ExitApp
}

inform_timeout(msg, seconds)
{
  msg_txt := msg . " Will resume after " . seconds . " seconds. Press enter to override, q to quit."
  InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
  if (response = "q")
    ExitApp
}

quick_inform(msg)
{
  inform_timeout(msg, 2)
}


; pauses with option to quit or continue
inform(msg)
{
  prompt := msg . " (q to quit or enter to continue)"
  InputBox, response, question, %prompt%
  if (response = "q")
    ExitAPP
}

inform_activation_error(window_name)
{
  prompt := "Cannot activate window: " . window_name
  inform(prompt)
}

trace(msg, file, function, line, wait_time := 0)
{
  is_enabled := True
  if (!is_enabled)
    return
  msg := file . " " . function . " line: " . line . ". " . msg
  if (wait_time = 0)
    inform(msg)
  else
    inform_timeout(msg, wait_time)
}


is_paused()
{
  FileRead, out, run_state.txt
  if (out = "False")
    return True
  else
    return False
}

pause_release()
{
  ; pause state is stored in a file, this resets it
  FileDelete, run_state.txt
  FileAppend, True, run_state.txt
}

pause_only()
{
  msg := "Program is paused. Enter to continue, q to quit."
  InputBox, out, paused, %msg%
  if (out = "q")
    ExitApp
  pause_release()
}

pause_with_message(message)
{
  msg := message . " (Program is paused. Enter to continue, q to quit.)"
  InputBox, out, paused, %msg%
  if (out = "q")
    ExitApp
  pause_release()
}

pause_mechanism()
{
  if (is_paused())
    pause_only()
}

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

wait_activate_popup_error_black_box(wait_seconds, attempts)
{
  SetTitleMatchMode, 2

  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinWaitActive , ahk_exe mstsc.exe, , %wait_seconds%, primus
  if (ErrorLevel = 0)
    return 1

  Loop, %attempts%
  {
    WinActivate, ahk_exe mstsc.exe,, primus
    WinWaitActive , ahk_exe mstsc.exe, , %wait_seconds%, primus
    if (ErrorLevel = 0)
      return 1
  }
  if (err = 1)
    msgbox, was not able to activate %window_name%
}

wait_activate_popup_error(window_name, wait_seconds, attempts)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)

  if (window_name = "PRIMU$ - B")
    return wait_activate_popup_error_black_box(wait_seconds, attempts)

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

activate_and_wait_black_box()
{
  SetTitleMatchMode, 2
  WinActivate, ahk_exe mstsc.exe,, primus
  WinWaitActive , ahk_exe mstsc.exe, , , primus
}

activate_and_wait_only(window_name, wait_seconds)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; exceptions
  if (window_name = "PRIMU$ - B")
  {
    return activate_and_wait_black_box()
  }
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
    pause_only()
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
