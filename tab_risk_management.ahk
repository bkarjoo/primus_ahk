#include files.ahk

get_risk_management_tab_vars(vars)
{
  vars["enable_black_box_risk_management_check_box"] := [15,50]
  vars["enable_black_box_risk_management_trigger_point"] := [21,58]
}


set_maximum_order_shares(shares)
{
  sleep, 100
  MouseClick, Left, 217, 634
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := shares
  sleep, 100
  Send, ^v
  sleep, 100
}

set_risk_management_helper(rm)
{
  vars := {}
  get_risk_management_tab_vars(vars)

  click_risk_management_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,rm["enable_black_box_risk_management"], vars["enable_black_box_risk_management_check_box"], vars["enable_black_box_risk_management_trigger_point"])
  set_maximum_order_shares(rm["maximum_order_shares"])
}

set_risk_management()
{
  rm := {}
  generic_code_parser("pp/risk_management.i", rm)
  set_risk_management_helper(rm)
}

risk_management_changed(i_vars, bu_vars)
{
  if(i_vars["enable_black_box_risk_management"] != bu_vars["enable_black_box_risk_management"])
    return 1
  if(i_vars["maximum_order_shares"] != bu_vars["maximum_order_shares"])
    return 1
  return 0
}

update_risk_management_helper(i_vars, bu_vars)
{
  if (!risk_management_changed(i_vars, bu_vars))
    return

  rm_vars := {}
  get_risk_management_tab_vars(rm_vars)

  click_risk_management_tab()
  set_check_box_confirm("PRIMU$ - Black", 1, i_vars["enable_black_box_risk_management"], vars["enable_black_box_risk_management_check_box"], vars["enable_black_box_risk_management_trigger_point"])
  if (i_vars["maximum_order_shares"] != bu_vars["maximum_order_shares"])
  set_maximum_order_shares(i_vars["maximum_order_shares"])
}

update_risk_management(acronym)
{
  i_path := build_i_path("risk_management")
  bu_path := build_bu_path("risk_management", acronym)

  i_vars := {}
  generic_code_parser(i_path, i_vars)
  bu_vars := {}
  generic_code_parser(bu_path, bu_vars)

  update_risk_management_helper(i_vars, bu_vars)
}
