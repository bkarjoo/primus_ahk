set_basket_name(name)
{
    MouseClick, Left, 214, 37
    sleep, 200
    Send, ^a
    sleep, 200
    Clipboard := name
    sleep, 200
    Send, ^v
    sleep, 200
}

set_basket_description(desc)
{
  MouseClick, Left, 214, 72
  sleep, 200
  Send, ^a
  sleep, 200
  Clipboard := desc
  sleep, 200
  Send, ^v
  sleep, 200
}

get_edit_basket_checkboxes(checkboxes)
{
  checkboxes["activate_dynamic_basket_rules_check_box"] := [20,147]
  checkboxes["activate_dynamic_basket_rules_trigger_point"]  := [28,153]
  checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_check_box"] := [193,147]
  checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_trigger_point"] := [200,153]
}

set_basket_rule(rule)
{
  sleep, 200
  MouseClick, Left, 400, 200
  sleep, 200
  Send, ^a
  sleep, 200
  Clipboard := rule
  sleep, 200
  Send, ^v
  sleep, 200
}

set_basket_symbols(symbols)
{
  MouseClick, Left, 400, 500
  sleep, 200
  Send, ^a
  sleep, 200
  Clipboard := symbols
  sleep, 200
  Send, ^v
  sleep, 200
}

set_basket_always_exclude_symbols(symbols)
{
  MouseClick, Left, 400, 600
  sleep, 200
  Send, ^a
  sleep, 200
  Clipboard := symbols
  sleep, 200
  Send, ^v
  sleep, 200
}

set_basket_hard_to_borrow_allowed_symbols(symbols)
{
  MouseClick, Left, 400, 700
  sleep, 200
  Send, ^a
  sleep, 200
  Clipboard := symbols
  sleep, 200
  Send, ^v
  sleep, 200
}

click_edit_basket_save_button()
{
  MouseClick, Left, 805, 40
  WinWaitActive, Basket Manager
}
