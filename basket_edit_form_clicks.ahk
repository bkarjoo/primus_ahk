


set_basket_name(name)
{
    MouseClick, Left, 214, 37
    sleep, 100
    Send, ^a
    sleep, 100
    Clipboard := name
    sleep, 100
    Send, ^v
    sleep, 100
}

set_basket_description(desc)
{
  MouseClick, Left, 214, 72
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := desc
  sleep, 100
  Send, ^v
  sleep, 100
}

activate_dynamic_basket_rules_check_box := [20,147]
activate_dynamic_basket_rules_trigger_point  := [28,153]
apply_dynamic_basket_rules_to_all_available_symbols_check_box := [193,147]
apply_dynamic_basket_rules_to_all_available_symbols_trigger_point := [200,153]

set_basket_rule(rule)
{
  sleep, 100
  MouseClick, Left, 400, 200
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := rule
  sleep, 100
  Send, ^v
  sleep, 100
}

set_basket_symbols(symbols)
{
  MouseClick, Left, 400, 500
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := symbols
  sleep, 100
  Send, ^v
  sleep, 100
}

set_basket_always_exclude_symbols(symbols)
{
  MouseClick, Left, 400, 600
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := symbols
  sleep, 100
  Send, ^v
  sleep, 100
}

set_basket_hard_to_borrow_allowed_symbols(symbols)
{
  MouseClick, Left, 400, 700
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := symbols
  sleep, 100
  Send, ^v
  sleep, 100
}

click_edit_basket_save_button()
{
  MouseClick, Left, 805, 40
  WinWait, Basket Manager (prms-rdgw.primustrade.com)
}
