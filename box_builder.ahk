; windows
#include window_launcher.ahk
#include window_black_box_design.ahk
#include window_order_form.ahk
#include window_expression_builder.ahk
#include window_basket_manager.ahk
#include window_edit_basket.ahk
#include window_save_blackbox.ahk
#include window_information.ahk
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
#include box_finder.ahk
#include wait_policy.ahk
#include inform.ahk
#include code_parser.ahk
#include logger.ahk

build_local_box(box_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  quick_inform("build_local_box")
  create_backup_folder_helper(box_name)
  open_new_bb_design()
  set_general_settings_helper(get_local_compiled(box_name, "general_settings"))
  set_entry_helper(get_local_compiled(box_name, "entry"))
  set_target_helper(get_local_compiled(box_name, "target"))
  set_stop_helper(get_local_compiled(box_name, "stop"))
  set_basket_helper(get_local_compiled(box_name, "basket"))
  set_options_helper(get_local_compiled(box_name, "time_options"),get_local_compiled(box_name, "position_sizing"))
  set_risk_management_helper(get_local_compiled(box_name, "risk_management"))
  set_launch_rules_helper(get_local_compiled(box_name, "launch_rules"))
  backup_compiled_files_helper(box_name, "")
  click_validate_and_close()
  launcher_click_save_as()
  save_blackbox_click_save()
  information_click_ok()
}

build_local_box_version(box_name, box_version)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  quick_inform("build_local_box")
  create_backup_folder_helper(box_name)
  open_new_bb_design()
  set_general_settings_helper_version(get_local_compiled(box_name, "general_settings"), box_version)
  set_entry_helper(get_local_compiled(box_name, "entry"))
  set_target_helper(get_local_compiled(box_name, "target"))
  set_stop_helper(get_local_compiled(box_name, "stop"))
  set_basket_helper(get_local_compiled(box_name, "basket"))
  set_options_helper(get_local_compiled(box_name, "time_options"),get_local_compiled(box_name, "position_sizing"))
  set_risk_management_helper(get_local_compiled(box_name, "risk_management"))
  set_launch_rules_helper(get_local_compiled(box_name, "launch_rules"))
  backup_compiled_files_helper(box_name, "")
  click_validate_and_close()
  launcher_click_save_as()
  save_blackbox_click_save()
  information_click_ok()
}
