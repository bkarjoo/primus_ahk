#include logger.ahk

set_basket_name(name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  checkboxes["activate_dynamic_basket_rules_check_box"] := [20,147]
  checkboxes["activate_dynamic_basket_rules_trigger_point"]  := [28,153]
  checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_check_box"] := [193,147]
  checkboxes["apply_dynamic_basket_rules_to_all_available_symbols_trigger_point"] := [200,153]
}

set_basket_rule(rule)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  MouseClick, Left, 805, 40
  WinWaitActive, Basket Manager
}
