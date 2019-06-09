; load the entry trigger rule from using file_reader.ahk
; assume the box is open, only build box and update box macros actually open the box
; every box is saved in the top folder by the name supplied
; the box definition file is supplied as a command line argument
; assumes the name of the box has changed and will update it
#include file_reader.ahk
#include black_box_clicks.ahk



; load file
; update box name
file_name = %1%
LoadFile(file_name)

if (black_box_scheme = "OPG")
{
  MsgBox, To include entry trigger make the box scheme PlainVanilla.
  ExitApp
}

ActivateBlackBoxDesign()

UpdateBoxName(box_name)
sleep 100

UpdateEntryTrigger(entry_trigger)

ExitApp
