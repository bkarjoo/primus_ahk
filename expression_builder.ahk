#include wait_policy.ahk
#include inform.ahk

expression_click_clear()
{
  ; assumes expression builder is open
  ; clear existing code by pressing the clear button
  wait_activate_if_error("PRIMU$ - Expression", 2, 2)
  MouseClick, Left, 760, 230
}


expression_click_ok()
{
  wait_activate_if_error("PRIMU$ - Expression", 2, 2)
  MouseClick, Left, 900, 550 ; press expression builder ok
}

expression_set_code(rule)
{
  ; assumes expression builder is open
  res := wait_activate_if_error("PRIMU$ - Expression", 2, 2)
  if (res != 1)
    inform("expression_set_code couldn't find active expression builder.")

  expression_click_clear()

  ; click the text area
  MouseClick, Left, 500, 100
  sleep, 200
  ; paste the rule
  Clipboard := rule
  Send, ^v
  sleep, 200

  expression_click_ok()

  ; control returns to order form
  err := wait_only("PRIMU$ - Add/Edit Order Form", 2)
  if (err != 0)
    inform("Expression close didn't return control to order form.")
}
