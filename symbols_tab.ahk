#include wait_policy.ahk

click_choose_basket()
{
  MouseClick, Left, 918, 64
  err := wait_only("Basket Manager", 10)
  if (err != 0)
    inform("Basket didn't open.")
}

set_basket()
{
  basket := {}
  generic_code_parser("pp/basket.i", basket)
  checkboxes := {}
  get_edit_basket_checkboxes(checkboxes)

  click_symbols_tab()
  click_choose_basket()
  click_basket_manager_private_tab()
  basket_manager_new_basket()
  set_basket_name(basket["basket_name"])
  set_basket_description(basket["basket_description"])
  set_check_box(basket["activate_dynamic_basket_rules"], checkboxes["activate_dynamic_basket_rules_check_box"], checkboxes["activate_dynamic_basket_rules_trigger_point"])
  set_check_box(basket["apply_dynamic_basket_rules_to_all_available_symbols"], checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_check_box"], checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_trigger_point"])
  if (basket["basket_rules"] != "")
    set_basket_rule(basket["basket_rules"])
  if (basket["basket_symbols"] != "")
    set_basket_symbols(basket["basket_symbols"])
  if (basket["basket_exclude"] != "")
    set_basket_always_exclude_symbols(basket["basket_exclude"])
  if (basket["basket_htb"] != "")
    set_basket_hard_to_borrow_allowed_symbols(basket["basket_htb"])
  click_edit_basket_save_button()
  click_basket_manager_ok_button()
}
