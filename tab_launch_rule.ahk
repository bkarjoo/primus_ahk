#include logger.ahk
; launch_rules -----------------------------------------------------------------
get_launch_rule_tab_vars(vars)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  vars["enable_black_box_launch_rule_check_box"] := [19, 54]
  vars["enable_black_box_launch_rule_trigger_point"] := [21,57]
}

set_launch_rule(rule)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  sleep, 300
  MouseClick, Left, 217, 300
  sleep, 300
  Send, ^a
  sleep, 200
  Clipboard := StrReplace(rule, ".", "#")
  sleep, 200
  Send, ^v
  sleep, 200
}

change_just_the_launch_rule(lr)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  click_launch_rule_tab_no_confirm()
  sleep, 1000
  set_launch_rule(lr)
}

set_launch_rules_helper(lr)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  vars := {}
  get_launch_rule_tab_vars(vars)

  click_launch_rule_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,lr["enable_black_box_launch_rule"], vars["enable_black_box_launch_rule_check_box"], vars["enable_black_box_launch_rule_trigger_point"])
  set_launch_rule(lr["launch_rules"])
}

set_launch_rules()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  lr := {}
  generic_code_parser("pp/launch_rules.i", lr)
  set_launch_rules_helper(lr)
}

launch_rules_changed(i_vars, bu_vars)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
if(i_vars["enable_black_box_launch_rule"] != bu_vars["enable_black_box_launch_rule"])
  return 1
if(i_vars["launch_rules"] != bu_vars["launch_rules"])
  return 1
return 0
}

update_launch_rules_helper(i_vars, bu_vars)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (!launch_rules_changed(i_vars, bu_vars))
    return

  lr_vars := {}
  get_launch_rule_tab_vars(lr_vars)

  click_launch_rule_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,i_vars["enable_black_box_launch_rule"], lr_vars["enable_black_box_launch_rule_check_box"], lr_vars["enable_black_box_launch_rule_trigger_point"])
  if(i_vars["launch_rules"] != bu_vars["launch_rules"])
    set_launch_rule(i_vars["launch_rules"])
}

update_launch_rules(name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  i_path := build_i_path("launch_rules")
  bu_path := build_bu_path("launch_rules", name)

  i_vars := {}
  generic_code_parser(i_path, i_vars)
  bu_vars := {}
  generic_code_parser(bu_path, bu_vars)

  update_launch_rules_helper(i_vars, bu_vars)
}
