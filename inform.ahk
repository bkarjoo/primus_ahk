

inform_timeout_pause_option(msg, seconds)
{
  msg_txt := msg . " (waiting for " . seconds . " seconds, enter p to pause, q to quit, enter to skip wait)"
  InputBox, response, waiting..., %msg_txt%, , , , , , , seconds
  if (response = "p")
    InputBox, response, paused..., "Press enter to continue."
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
