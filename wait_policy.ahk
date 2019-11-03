; Wait policy
; if window is already expected to be loaded wait 2 seconds
; if window is to be loaded wait 5 seconds
; if wait times out, attempt 2 more times
; if 2 more attempts fail throw an exception


wait_only(window_name, seconds)
{
  WinWaitActive, %window_name%, , %seconds%
  return ErrorLevel
}

wait_activate_if_error(window_name, seconds, attempts)
{
  if (wait_only(window_name, seconds) = 0)
    return 1
  Loop, %attempts%
  {
    WinActivate, %window_name%
    err := wait_only(window_name, seconds)
    if (err = 0)
      return 1
  }
  if (err = 1)
    return 0
}

activate_and_wait(window_name, seconds)
{
  WinActivate, %window_name%
  wait_activate_if_error(window_name, seconds, 2)
}
