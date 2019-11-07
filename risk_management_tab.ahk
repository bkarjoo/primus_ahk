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
