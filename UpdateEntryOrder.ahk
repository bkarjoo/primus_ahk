; load the settings from using file_reader.ahk
; assume the box is open, only build box and update box macros actually open the box
; every box is saved in the top folder
; the box definition file is supplied as a command line argument
#include file_reader.ahk
#include black_box_clicks.ahk
#include order_form_clicks.ahk
#include expression_builder_clicks.ahk

file_name = %1%
LoadFile(file_name)
ActivateBlackBoxDesign()

UpdateBoxName(box_name)
sleep 100

OpenExistingEntryOrder()

WinWait, PRIMU$ - Add/Edit Order Form
OpenLimitOrderExpressionBuilder()
SetExpressionBuilderCode(rule)
