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
  debug := true
  create_backup_folder_helper(box_name)
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 36")
  open_new_bb_design()
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 41")
  set_general_settings_helper(get_local_compiled(box_name, "general_settings"))
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 46")
  set_entry_helper(get_local_compiled(box_name, "entry"))
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 51")
  set_target_helper(get_local_compiled(box_name, "target"))
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 56")
  set_stop_helper(get_local_compiled(box_name, "stop"))
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 61")
  set_basket_helper(get_local_compiled(box_name, "basket"), "0.0")
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 66")
  set_options_helper(get_local_compiled(box_name, "time_options"),get_local_compiled(box_name, "position_sizing"))
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 71")
  set_risk_management_helper(get_local_compiled(box_name, "risk_management"))
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 76")
  set_launch_rules_helper(get_local_compiled(box_name, "launch_rules"))
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 81")
  backup_compiled_files_helper(box_name, "")
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 86")
  click_validate_and_close()
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 91")
  launcher_click_save_as()
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 96")
  save_blackbox_click_save()
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 101")
  information_click_ok()
  pause_mechanism()

  if (debug)
    quick_inform("debug: box_builder.ahk 106")
}

build_local_box_version(box_name, box_version)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  quick_inform("build_local_box")
  create_backup_folder_helper(box_name)
  open_new_bb_design()
  pause_mechanism()
  set_general_settings_helper_version(get_local_compiled(box_name, "general_settings"), box_version)
  pause_mechanism()
  set_entry_helper(get_local_compiled(box_name, "entry"))
  pause_mechanism()
  set_target_helper(get_local_compiled(box_name, "target"))
  pause_mechanism()
  set_stop_helper(get_local_compiled(box_name, "stop"))
  pause_mechanism()
  set_basket_helper(get_local_compiled(box_name, "basket"), box_version)
  pause_mechanism()
  set_options_helper(get_local_compiled(box_name, "time_options"),get_local_compiled(box_name, "position_sizing"))
  pause_mechanism()
  set_risk_management_helper(get_local_compiled(box_name, "risk_management"))
  pause_mechanism()
  set_launch_rules_helper(get_local_compiled(box_name, "launch_rules"))
  pause_mechanism()
  backup_compiled_files_helper(box_name, "")
  pause_mechanism()
  click_validate_and_close()
  pause_mechanism()
  launcher_click_save_as()
  pause_mechanism()
  save_blackbox_click_save()
  pause_mechanism()
  information_click_ok()
  pause_mechanism()
}
