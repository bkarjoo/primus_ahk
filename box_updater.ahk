; windows
#include launcher_control.ahk
#include black_box_design.ahk
#include order_form.ahk
#include expression_builder.ahk
#include basket_manager.ahk
#include edit_basket.ahk
#include save_blackbox.ahk
#include information.ahk
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
#include wait_policy.ahk
#include inform.ahk
#include code_parser.ahk

update_box(box_name, box_version)
{
  ; assumption box is downloaded and compiled
  update_general_setting_helper(get_local_compiled(box_name, "general_settings"),get_backup_compiled(box_name, "general_settings"))
  update_entry_helper(get_local_compiled(box_name, "entry"),get_backup_compiled(box_name, "entry"))
  update_target_helper(get_local_compiled(box_name, "target"),get_backup_compiled(box_name, "target"))
  update_stop_helper(get_local_compiled(box_name, "stop"),get_backup_compiled(box_name, "stop"))
  update_basket_helper(get_local_compiled(box_name, "basket"),get_backup_compiled(box_name, "basket"))
  update_options_helper(get_local_compiled(box_name, "time_options"),get_local_compiled(box_name, "position_sizing"),get_backup_compiled(box_name, "time_options"),get_backup_compiled(box_name, "position_sizing"))
  update_risk_management_helper(get_local_compiled(box_name, "risk_management"),get_backup_compiled(box_name, "risk_management"))
  update_launch_rules_helper(get_local_compiled(box_name, "launch_rules"),get_backup_compiled(box_name, "launch_rules"))
  click_validate_and_close()
  launcher_click_save_box()
  information_click_ok()
}
