#include logger.ahk

; old deprecated version
clipboard_paste(text) {
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Clipboard := text
  Send, ^v
  Send, {Enter}
  sleep, 1000
  return
}

clipboard_simple_paste(text)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Clipboard := text
  Sleep, 200
  Send, ^v
  Sleep, 200
}

clipboard_simple_paste_followed_by_enter(text)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Clipboard := box_name
  Sleep, 200
  Send, ^v
  Sleep, 200
  Send, {Enter}
  Sleep, 200
}
