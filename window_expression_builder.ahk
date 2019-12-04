#include wait_policy.ahk
#include inform.ahk
#include logger.ahk

expression_builder_activate()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  WinActivate, PRIMU$ - Expression Builder
  WinWaitActive, PRIMU$ - Expression Builder
}

expression_click_clear()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; assumes expression builder is open
  ; clear existing code by pressing the clear button
  wait_activate_if_error("PRIMU$ - Expression", 2, 2)
  MouseClick, Left, 760, 230
}


expression_click_ok()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  wait_activate_if_error("PRIMU$ - Expression", 2, 2)
  MouseClick, Left, 900, 550 ; press expression builder ok
}

expression_set_code(rule)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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

expression_click_edit_custom_expression()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  MouseClick, Left, 308, 508
}

copy_cutom_functions_from_expression_builder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  row := 260
  loop,
  {
    row += 13
    expression_builder_activate()
    if (row > 489)
    {
      MouseClick , Left, 400, 472
      row := 286
      inform_timeout("resuming in ", 3)
    }


    MouseClick, Left, 270, %row%

    expression_click_edit_custom_expression()
    Sleep, 500
    MouseClick, Left, 275, 45
    Sleep, 200
    Send, ^a
    Sleep, 200
    Send, ^c
    Sleep, 200
    function_name := Clipboard
    MouseClick, Left, 442, 306
    Sleep, 200
    Send, ^a
    Sleep, 200
    Send, ^c
    Sleep, 200
    function_def := Clipboard
    MouseClick, Left, 50, 398
    Sleep, 400
    WinActivate, Untitled - Notepad
    WinWaitActive, Untitled - Notepad
    Clipboard := function_name
    Send, ^v
    Sleep, 200
    Send, {Space}
    Clipboard := function_def
    Send, ^v
    Sleep, 200
    Send, {Enter}


    Sleep, 200
  }
}
