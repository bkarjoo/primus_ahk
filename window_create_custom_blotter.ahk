; this window doesn't have a title so can't be activated

click_create_custom_blotter_name_box()
{
  MouseClick, Left, 93, 55
  sleep, 200
}

click_create_blotter_button()
{
  MouseClick, Left, 270, 195
  sleep, 200
}


process_custom_blotter_form(box_name)
{
  click_create_custom_blotter_name_box()
  send, ^a
  sleep, 200
  Clipboard := box_name
  send, ^v
  sleep, 200
  click_create_blotter_button()
}
