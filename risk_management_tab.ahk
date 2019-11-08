; risk management --------------------------------------------------------------
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

set_risk_management()
{
  rm := {}
  generic_code_parser("pp/risk_management.i", rm)
  vars := {}
  get_risk_management_tab_vars(vars)

  click_risk_management_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,rm["enable_black_box_risk_management"], vars["enable_black_box_risk_management_check_box"], vars["enable_black_box_risk_management_trigger_point"])
  set_maximum_order_shares(rm["maximum_order_shares"])
}

update_risk_management(box_acronym)
{
  rm := {}
  generic_code_parser("pp/risk_management.i", rm)
  vars := {}
  get_risk_management_tab_vars(vars)

  click_risk_management_tab()
  set_check_box_confirm("PRIMU$ - Black", 1,rm["enable_black_box_risk_management"], vars["enable_black_box_risk_management_check_box"], vars["enable_black_box_risk_management_trigger_point"])
  set_maximum_order_shares(rm["maximum_order_shares"])
}
