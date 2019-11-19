#include wait_policy.ahk
; this window doesn't have a title so can't be activated

click_create_custom_blotter_name_box()
{
  MouseClick, Left, 93, 55
  hour_glass_sleep(200)
}

click_create_blotter_button()
{
  MouseClick, Left, 270, 195
  hour_glass_sleep(200)
}


process_custom_blotter_form(box_name)
{
  hour_glass_sleep(2000)
  click_create_custom_blotter_name_box()
  hour_glass_sleep(200)
  send, ^a
  hour_glass_sleep(200)
  send, %box_name%
  hour_glass_sleep(200)
  click_create_blotter_button()
}
