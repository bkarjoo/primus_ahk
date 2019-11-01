; Wait policy
; if window is already expected to be loaded wait 2 seconds
; if window is to be loaded wait 5 seconds
; if wait times out, attempt 2 more times
; if 2 more attempts fail throw an exception

inform_of_error(window_name)
{
  prompt := "Cannot activate window: " . window_name . " (q to quit or enter to continue)"
  InputBox, response, question, %prompt%
  if (response = "q")
    ExitAPP
}

wait(window_name, seconds)
{
  WinWaitActive, %window_name%, , %seconds%
  if (ErrorLevel = 0)
    return
  Loop, 2
  {
    WinActivate, %window_name%
    WinWaitActive, %window_name%, , %seconds%
    if (ErrorLevel = 0)
      break
  }
  if (ErrorLevel = 1)
    inform_of_error(window_name)
}

activate_and_wait(window_name, seconds)
{
  WinActivate, %window_name%
  wait(window_name, seconds)
}
