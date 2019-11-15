; windows
#include window_launcher.ahk
#include window_black_box_design.ahk
#include window_order_form.ahk
#include window_expression_builder.ahk
#include window_basket_manager.ahk
#include window_edit_basket.ahk
; tabs
#include tab_design.ahk
#include tab_symbols.ahk
#include tab_options.ahk
#include tab_risk_management.ahk
#include tab_launch_rule.ahk
; utilities
#include box_name_builder.ahk
#include files.ahk
#include gcc_compile.ahk
#include check_boxes.ahk

do_confirm_requisite_files := True
do_compile_code_files := True
do_create_backup_folder := True
do_general_settings := True
do_entry := True
do_target := True
do_stop := True
do_basket := True
do_options := True
do_risk_management := True
do_launch_rules := True
do_backup := True
do_validate_and_close := True

if (do_confirm_requisite_files)
  confirm_requisite_files()
if (do_compile_code_files)
  compile_code_files()
if (do_create_backup_folder)
  create_backup_folder()

open_new_bb_design()

if (do_general_settings)
  set_general_setting()
if (do_entry)
  set_entry()
if (do_target)
  set_target()
if (do_stop)
  set_stop()
if (do_basket)
  set_basket()
if (do_options)
  set_options()
if (do_risk_management)
  set_risk_management()
if (do_launch_rules)
  set_launch_rules()
if (do_backup)
  backup_compiled_files()

click_validate_and_close()
