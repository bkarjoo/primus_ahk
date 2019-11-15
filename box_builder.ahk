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

build_local_box(box_name)
{
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
