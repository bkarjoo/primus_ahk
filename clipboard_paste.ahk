
clipboard_paste(text) {
  Clipboard := text
  Send, ^y
  Send, {Enter}
  sleep, 1000
  return
}
