
; test if it can detect last is checked
#include black_box_clicks.ahk
#include file_reader.ahk


InputBox, response, Question,  Building a new box will override open box. You will lose unsaved changes. Do you wnat to proceed? (enter y or n)
If (response = "n")
  ExitApp
MsgBox, %response%
