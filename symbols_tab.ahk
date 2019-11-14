#include wait_policy.ahk
#include files.ahk

click_choose_basket()
{
  MouseClick, Left, 918, 64
  err := wait_only("Basket Manager", 60)
  if (err != 0)
    inform("Basket didn't open.")
}

set_basket_helper(basket)
{
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

set_basket()
{
  basket := {}
  generic_code_parser("pp/basket.i", basket)
  set_basket_helper(basket)
}

update_basket_helper(i_vars, bu_vars)
{
  checkboxes := {}
  get_edit_basket_checkboxes(checkboxes)

  click_symbols_tab()
  click_choose_basket()
  click_basket_manager_private_tab()

  ; TODO find confirm the basket loaded matches, what if no baskets return
  open_existing_basket(i_vars["basket_name"])

  if(i_vars["basket_name"] != bu_vars["basket_name"])
    set_basket_name(i_vars["basket_name"])
  if(i_vars["basket_description"] != bu_vars["basket_description"])
    set_basket_description(i_vars["basket_description"])

  set_check_box(i_vars["activate_dynamic_basket_rules"], checkboxes["activate_dynamic_basket_rules_check_box"], checkboxes["activate_dynamic_basket_rules_trigger_point"])
  set_check_box(i_vars["apply_dynamic_basket_rules_to_all_available_symbols"], checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_check_box"], checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_trigger_point"])

  ; TODO checkboxes determine rules, if apply is checked symbols shouldn't be there
  if (i_vars["basket_rules"] != "" or i_vars["basket_rules"] != bu_vars["basket_rules"])
    set_basket_rule(i_vars["basket_rules"])
  if (i_vars["basket_symbols"] != "" or i_vars["basket_symbols"] != bu_vars["basket_symbols"])
    set_basket_symbols(i_vars["basket_symbols"])
  if (i_vars["basket_exclude"] != "" or i_vars["basket_exclude"] != bu_vars["basket_exclude"])
    set_basket_always_exclude_symbols(i_vars["basket_exclude"])
  if (i_vars["basket_htb"] != "" or i_vars["basket_htb"] != bu_vars["basket_htb"])
    set_basket_hard_to_borrow_allowed_symbols(i_vars["basket_htb"])

  click_edit_basket_save_button()
  click_basket_manager_ok_button()
}

update_basket(acronym)
{
  i_path := build_i_path("basket")
  bu_path := build_bu_path("basket", acronym)

  i_vars := {}
  generic_code_parser(i_path, i_vars)
  bu_vars := {}
  generic_code_parser(bu_path, bu_vars)

  update_basket_helper(i_vars, bu_vars)
}
