#include black_box_tabs.ahk
#include wait_policy.ahk

stop_open_new_order(attempts)
{
  loop, %attempts%
  {
    click_design_tab()
    MouseClick, Left, 900, 705
    err := wait_only("PRIMU$ - Add/Edit Order Form", 5)
    if (err = 0)
      return 1
  }
  return 0
}
