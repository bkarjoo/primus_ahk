; loads everything from using file_reader.ahk
; every box is saved in the top folder
; the box definition file is supplied as a command line argument
#include launcher_clicks.ahk
#include file_reader.ahk
#include black_box_clicks.ahk

InputBox, response, Question,  Building a new box will override open box. You will lose unsaved changes. Do you want to proceed? (enter y or n)
If (response = "n")
  ExitApp
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
sleep 100
if (IsChecked(permit_backtesting_check_box) = 0)
  TriggerCheckBox(permit_backtesting_check_box)
SetCheckBox(enter_on_last, enter_on_last_check_box)
SetCheckBox(enter_on_bid, enter_on_bid_check_box)
SetCheckBox(enter_on_ask, enter_on_ask_check_box)
SetCheckBox(enter_on_pmi, enter_on_pmi_check_box)
SetCheckBox(enter_on_imbalance, enter_on_imbalance_check_box)
SetCheckBox(enter_on_snapshot, enter_on_snapshot_check_box)
SetCheckBox(enter_on_new_minute, enter_on_new_minute_check_box)
SetCheckBox(enter_on_stock_event, enter_on_stock_event_check_box)
SetCheckBox(use_strict_mode, use_strict_mode_check_box)
if (black_box_scheme = "PlainVanilla")
  UpdateEntryTrigger(entry_trigger)
