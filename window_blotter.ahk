#include wait_policy.ahk
#include image_search.ahk
#include window_create_custom_blotter.ahk
#include window_operation_completed.ahk

activate_blotter()
{
   WinActivate, D:\Users\
   WinWaitActive, D:\Users\
}

click_custom_blotter_tab()
{
   activate_blotter()
   MouseClick, Left, 114, 85
}

click_primus_blotter_tab()
{
   activate_blotter()
   MouseClick, Left, 190, 85
}

click_all_records()
{
  activate_blotter()
  MouseClick, Left, 220, 110
}

click_live()
{
  activate_blotter()
  MouseClick, Left, 270, 110
}

click_backtesting()
{
  activate_blotter()
  MouseClick, Left, 325, 110
}

is_off_all_records()
{
  activate_blotter()
  MouseMove, 0, 0
  return image_search_simple(500, 150, "images/all_records.PNG")
}

is_off_live()
{
  activate_blotter()
  MouseMove, 0, 0
  return image_search_simple(500, 150, "images/live.PNG")
}

is_off_backtesting()
{
  activate_blotter()
  MouseMove, 0, 0
  return image_search_simple(500, 150, "images/backtesting.PNG")
}

turn_all_records_on()
{
  if (is_off_all_records())
  {
    click_all_records()
    sleep, 1000
  }
}

turn_backtesting_on()
{
  if (is_off_backtesting())
  {
    click_backtesting()
    sleep, 1000
  }
}

turn_live_on()
{
  if (is_off_live())
  {
    click_live()
    sleep, 1000
  }
}

click_name_box()
{
  activate_blotter()
  MouseClick, Left, 130, 180
  sleep, 200
}


click_select_all()
{
  activate_blotter()
  MouseClick, Left, 50, 150
  sleep, 2000
}

select_all_checked()
{
  activate_blotter()
  return !image_search_simple(100,200,"images/select_all_checkbox.PNG")
}

check_select_all()
{
  if (!select_all_checked())
  {
    click_select_all()
  }
}

enter_box_name_filter(box_name)
{
  if (select_all_checked())
    click_select_all()
  sleep, 200
  click_name_box()
  sleep, 200
  send, ^a
  sleep, 200
  send, {Del}
  sleep, 200
  Clipboard := box_name
  send, ^v
  sleep, 200
  send, {Enter}
  sleep, 2000
}

custom_blotter_open()
{
  return image_search_simple(347,216,"images/create_custom_blotter.PNG")
}

open_create_custom_blotter()
{
  activate_blotter()
  MouseClick, Right, 198, 202
  sleep, 200
  MouseClick, Left, 330, 275
  sleep, 1000
}

create_custom_blotter(box_name)
{
  activate_blotter()
  click_primus_blotter_tab()
  enter_box_name_filter(box_name)
  check_select_all()
  open_create_custom_blotter()
  process_custom_blotter_form(box_name)
  wait_only("Operation completed", 500)
  click_operation_completed_ok_button()
}

click_custom_blotter_name_filter_box()
{
  activate_blotter()
  MouseClick, Left, 166, 191
  sleep, 200
}

click_custom_blotter_name_first_row()
{
  activate_blotter()
  MouseClick, Left, 22, 212
  sleep, 200
}

select_custom_blotter(blotter_name)
{
  activate_blotter()
  click_custom_blotter_tab()
  click_custom_blotter_name_filter_box()
  Send, ^a
  sleep, 200
  Clipboard := blotter_name
  Send, ^v
  sleep, 200
  Send, {Enter}
  sleep, 200
  click_custom_blotter_name_first_row()
}

select_custom_blotter("emos 0.0")
msgbox, done
