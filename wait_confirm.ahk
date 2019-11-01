wait_until_sec_or_enter(seconds)
{
    msg_txt := "Will resume after " . seconds . " seconds. Press enter to override."
    InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
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
