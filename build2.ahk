; windows
#include launcher_control.ahk
#include black_box_design.ahk
; tabs
#include design_tab.ahk
; utilities
#include box_name_builder.ahk
#include files.ahk
#include gcc_compile.ahk
#include check_boxes.ahk

do_compile := True

compile_code_files()
{
  gcc_initial_compile()
  confirm_compiled_files_exist()
  general_settings := {}
  generic_code_parser("pp/general_settings.i", general_settings)
  make_back_up_directory(general_settings["box_acronym"])
}

initialize_new_build()
{
  confirm_image_search_files_exist()
  confirm_code_files_exist()
  compile_code_files()
  ; click new box
  launcher_click_new_box()
  wait_only("PRIMU$ - Black", 5)
}

set_general_setting()
{
  general_settings := {}
  generic_code_parser("pp/general_settings.i", general_settings)
  checkboxes := {}
  get_design_tab_checkboxes(checkboxes)
  bname := build_box_name(general_settings["box_name"], general_settings["box_acronym"])
  update_box_name(bname)
  desc := build_box_description(general_settings["launch_rule_name"], general_settings["black_box_description"], general_settings["basket_description"])
  update_box_description(desc)
  set_black_box_side(general_settings["black_box_side"])
  set_black_box_scheme(general_settings["black_box_scheme"])
  set_check_box_confirm("PRIMU$ - Black", 1,"TRUE", checkboxes["permit_backtesting_check_box"], checkboxes["permit_backtesting_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_last"], checkboxes["enter_on_last_check_box"], checkboxes["enter_on_last_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_bid"], checkboxes["enter_on_bid_check_box"], checkboxes["enter_on_bid_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_ask"], checkboxes["enter_on_ask_check_box"], checkboxes["enter_on_ask_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_pmi"], checkboxes["enter_on_pmi_check_box"], checkboxes["enter_on_pmi_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_imbalance"], checkboxes["enter_on_imbalance_check_box"], checkboxes["enter_on_imbalance_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_snapshot"], checkboxes["enter_on_snapshot_check_box"], checkboxes["enter_on_snapshot_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_new_minute"], checkboxes["enter_on_new_minute_check_box"], checkboxes["enter_on_new_minute_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["enter_on_stock_event"], checkboxes["enter_on_stock_event_check_box"], checkboxes["enter_on_stock_event_trigger_point"])
  set_check_box_confirm("PRIMU$ - Black", 1, general_settings["use_strict_mode"], checkboxes["use_strict_mode_check_box"], checkboxes["use_strict_mode_trigger_point"])
}

set_entry()
{

}

set_target()
{

}

set_stop()
{

}

set_basket()
{

}

set_time_options()
{

}

set_position_sizing()
{

}

set_risk_management()
{

}

set_launch_rule()
{

}

finalize_build()
{

}

initialize_new_build()
set_general_setting()
set_entry()
set_target()
set_stop()
set_basket()
set_time_options()
set_position_sizing()
set_risk_management()
set_launch_rule()
finalize_build()
Msgbox, DONE
