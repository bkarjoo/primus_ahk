; windows
#include header.ahk



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
  update_basket_helper(get_local_compiled(box_name, "basket"), get_backup_compiled(box_name, "basket"), box_version)
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
