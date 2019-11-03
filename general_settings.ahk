#include black_box_tabs.ahk

update_box_name(box_name)
{
  click_design_tab()
  MouseClick, Left, 252, 63
  Send, ^a
  sleep, 100
  Clipboard := box_name
  sleep, 100
  Send, ^v
  sleep, 100
}

update_box_description(desc)
{
  click_design_tab()
  MouseClick, Left, 325, 125
  Send, ^a
  sleep, 100
  Clipboard := desc
  sleep, 100
  Send, ^v
  sleep, 100
}

set_black_box_side(side)
{
  click_design_tab()
  MouseClick, Left, 200, 160
  sleep, 100
  if (side = "LONG")
    send, {Up}
  else if (side = "SHORT")
    send, {Down}
}

set_black_box_scheme(scheme)
{
  click_design_tab()
  MouseClick, Left, 285, 190
  sleep, 100
  if (scheme = "OPG")
    MouseClick, Left, 285, 221
  else
    MouseClick, Left, 285, 206
}
