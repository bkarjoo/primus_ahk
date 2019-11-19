#include inform.ahk

wait_only(window_name, wait_seconds)
{
  WinWaitActive, %window_name%, , %wait_seconds%
  return ErrorLevel
}

wait_activate_if_error(window_name, wait_seconds, attempts)
{
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

activate_and_wait_only(window_name, wait_seconds)
{
  WinActivate, %window_name%
  err := wait_only(window_name, wait_seconds)
  if (err = 0)
    return 1
  return 0
}

activate_and_wait(window_name, wait_seconds, attempts)
{
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
    msg_txt := "Will resume after " . seconds . " seconds. Press enter to override."
    InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
}

wait_until_idle(seconds)
{
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
  msg_txt := msg_txt . " (waiting for " . seconds . " seconds, enter p to pause, q to quit, enter to skip wait)"
  InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
  if (response = "p")
    InputBox, response, paused..., "Press enter to continue."
  else if (response = "q")
    ExitApp
}

hour_glass_sleep(millis)
{
  sleep, millis
  loop,
  {
    if (A_Cursor != "Wait")
      break
    sleep, 200
  }
}
