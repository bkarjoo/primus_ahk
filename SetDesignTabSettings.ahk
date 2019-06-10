; load the settings from using file_reader.ahk
; assume the box is open, only build box and update box macros actually open the box
; every box is saved in the top folder
; the box definition file is supplied as a command line argument
#include file_reader.ahk
#include black_box_clicks.ahk

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

; permit backtesting is always checked
if (IsChecked(permit_backtesting_check_box) = 0)
  TriggerCheckBox(permit_backtesting_trigger_point)

  SetCheckBox(enter_on_last, enter_on_last_check_box, enter_on_last_trigger_point)
  SetCheckBox(enter_on_bid, enter_on_bid_check_box, enter_on_bid_trigger_point)
  SetCheckBox(enter_on_ask, enter_on_ask_check_box, enter_on_ask_trigger_point)
  SetCheckBox(enter_on_pmi, enter_on_pmi_check_box, enter_on_pmi_trigger_point)
  SetCheckBox(enter_on_imbalance, enter_on_imbalance_check_box, enter_on_imbalance_trigger_point)
  SetCheckBox(enter_on_snapshot, enter_on_snapshot_check_box, enter_on_snapshot_trigger_point)
  SetCheckBox(enter_on_new_minute, enter_on_new_minute_check_box, enter_on_new_minute_trigger_point)
  SetCheckBox(enter_on_stock_event, enter_on_stock_event_check_box, enter_on_stock_event_trigger_point)
  SetCheckBox(use_strict_mode, use_strict_mode_check_box, use_strict_mode_trigger_point)

ExitApp
