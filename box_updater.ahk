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



update_box_dynamic_version(box_name, box_version)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  quick_inform("update_box")
  ; assumption box is downloaded and compiled
  update_general_setting_helper_version(get_local_compiled(box_name, "general_settings"),get_backup_compiled(box_name, "general_settings"), box_version)
  pause_mechanism()
  update_entry_helper(get_local_compiled(box_name, "entry"),get_backup_compiled(box_name, "entry"))
  pause_mechanism()
  update_target_helper(get_local_compiled(box_name, "target"),get_backup_compiled(box_name, "target"))
  pause_mechanism()
  update_stop_helper(get_local_compiled(box_name, "stop"),get_backup_compiled(box_name, "stop"))
  pause_mechanism()
  update_basket_helper(get_local_compiled(box_name, "basket"),get_backup_compiled(box_name, "basket"),box_version)
  pause_mechanism()
  update_options_helper(get_local_compiled(box_name, "time_options"),get_local_compiled(box_name, "position_sizing"),get_backup_compiled(box_name, "time_options"),get_backup_compiled(box_name, "position_sizing"))
  pause_mechanism()
  update_risk_management_helper(get_local_compiled(box_name, "risk_management"),get_backup_compiled(box_name, "risk_management"))
  pause_mechanism()
  update_launch_rules_helper(get_local_compiled(box_name, "launch_rules"),get_backup_compiled(box_name, "launch_rules"))
  pause_mechanism()
  click_validate_and_close()
  pause_mechanism()
  launcher_click_save_box()
  pause_mechanism()
  information_click_ok()
  pause_mechanism()
}


update_box(box_name, box_version)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  quick_inform("update_box")
  ; assumption box is downloaded and compiled
  update_general_setting_helper(get_local_compiled(box_name, "general_settings"),get_backup_compiled(box_name, "general_settings"))
  update_entry_helper(get_local_compiled(box_name, "entry"),get_backup_compiled(box_name, "entry"))
  update_target_helper(get_local_compiled(box_name, "target"),get_backup_compiled(box_name, "target"))
  update_stop_helper(get_local_compiled(box_name, "stop"),get_backup_compiled(box_name, "stop"))
  update_basket_helper(get_local_compiled(box_name, "basket"),get_backup_compiled(box_name, "basket"),box_version)
  update_options_helper(get_local_compiled(box_name, "time_options"),get_local_compiled(box_name, "position_sizing"),get_backup_compiled(box_name, "time_options"),get_backup_compiled(box_name, "position_sizing"))
  update_risk_management_helper(get_local_compiled(box_name, "risk_management"),get_backup_compiled(box_name, "risk_management"))
  update_launch_rules_helper(get_local_compiled(box_name, "launch_rules"),get_backup_compiled(box_name, "launch_rules"))
  click_validate_and_close()
  launcher_click_save_box()
  information_click_ok()
}
