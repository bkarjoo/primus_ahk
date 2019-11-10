; windows
#include launcher_control.ahk
#include black_box_design.ahk
#include order_form.ahk
#include expression_builder.ahk
#include basket_manager.ahk
#include edit_basket.ahk
; tabs
#include design_tab.ahk
#include symbols_tab.ahk
#include options_tab.ahk
#include risk_management_tab.ahk
#include launch_rule_tab.ahk
; utilities
#include box_name_builder.ahk
#include files.ahk
#include gcc_compile.ahk
#include check_boxes.ahk
#include box_finder.ahk

; get acronym
gs := {}
generic_code_parser("general_settings.c", gs)
acronym := gs["box_acronym"]

; get update status
file_state := {}
get_code_files_update_status(acronym, file_state)
updated_file_count := number_of_updated_files(file_state)

if (updated_file_count = 0)
  inform("There's no files to update.")
compile_code_files_if_changed(file_state)

find_box(acronym)

if (file_state["general_settings_updated"])
  update_general_setting(acronym)
if (file_state["entry_updated"])
  update_entry(acronym)
if (file_state["target_updated"])
  update_target(acronym)
if (file_state["stop_updated"])
  update_stop(acronym)
if (file_state["basket_updated"])
  update_basket(acronym)
if (file_state["time_options_updated"] or file_state["position_sizing_updated"])
  update_options(acronym)
if (file_state["risk_management_updated"])
  update_risk_management(acronym)
if (file_state["launch_rules_updated"])
  update_launch_rules(acronym)

click_validate_and_close()

backup_compiled_files_if_changed(file_state, acronym)
