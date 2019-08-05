
clipboard_paste(text) {
  Clipboard := text
  Send, ^v
  Send, {Enter}
  sleep, 1000
  return
}
