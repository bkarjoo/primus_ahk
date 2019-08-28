

OpenBox(box_name)  {
  ; remove carriage return from box_name if any
  box_name := Trim(box_name, "`r")

  WinActivate, Primu$ 7.
  WinWait, Primu$ 7.
  Sleep, 100

  ; press the open button
  Click, Left, 80, 50
  Click, Left, 80, 50
  WinWait, Open BlackBox

  ; click include subfolders
  Click, Left, 700, 40
  Sleep, 100

  ; click the search field in open black box
  Click, Left, 550, 40
  Sleep, 100
  ; paste box name

  ;MsgBox, row 22, setting Clipboard to %box_name%
  Clipboard := box_name
  Click, Left, 550, 40
  Sleep, 100
  Send, ^v
  Sleep, 100
  Click, Left, 620, 40

  i := 1

  ; click first row
  Click, Left, 400, 80
  Sleep, 100


}
