; load the settings from using file_reader.ahk
; assume the box is open, only build box and update box macros actually open the box
; every box is saved in the top folder then copied into sub folders that's how update boxes open boxes
; there's never any launch rules, launches are set by date picker
#include file_reader.ahk
#include black_box_clicks.ahk

/*
file_name = %1%
LoadFile(file_name)
ActivateBlackBoxDesign()
UpdateBoxName(box_name)
sleep 100
UpdateBoxDescription(black_box_description)
sleep 100
SetBlackBoxSide(black_box_side)
sleep 100
SetBlackBoxScheme(black_box_scheme)

if

ExitApp
*/

ActivateBlackBoxDesign()
TriggerCheckBox(use_strict_mode_check_box)
