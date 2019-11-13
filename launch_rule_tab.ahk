; launch_rules -----------------------------------------------------------------
get_launch_rule_tab_vars(vars)
{
  vars["enable_black_box_launch_rule_check_box"] := [14,49]
  vars["enable_black_box_launch_rule_trigger_point"] := [21,57]
}

set_launch_rule(rule)
{
  sleep, 100
  MouseClick, Left, 217, 300
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := StrReplace(rule, ".", "#")
  sleep, 100
  Send, ^v
  sleep, 100
}

set_launch_rules_helper(lr)
{
  vars := {}
  get_launch_rule_tab_vars(vars)

  click_launch_rule_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,lr["enable_black_box_launch_rule"], vars["enable_black_box_launch_rule_check_box"], vars["enable_black_box_launch_rule_trigger_point"])
  set_launch_rule(lr["launch_rules"])
}

set_launch_rules()
{
  lr := {}
  generic_code_parser("pp/launch_rules.i", lr)
  set_launch_rules_helper(lr)
}

update_launch_rules_helper(i_vars, bu_vars)
{
  lr_vars := {}
  get_launch_rule_tab_vars(lr_vars)

  click_launch_rule_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,i_vars["enable_black_box_launch_rule"], lr_vars["enable_black_box_launch_rule_check_box"], lr_vars["enable_black_box_launch_rule_trigger_point"])
  if(i_vars["launch_rules"] != bu_vars["launch_rules"])
    set_launch_rule(i_vars["launch_rules"])
}

update_launch_rules(acronym)
{
  i_path := build_i_path("launch_rules")
  bu_path := build_bu_path("launch_rules", acronym)

  i_vars := {}
  generic_code_parser(i_path, i_vars)
  bu_vars := {}
  generic_code_parser(bu_path, bu_vars)

  update_launch_rules_helper(i_vars, bu_vars)
}
