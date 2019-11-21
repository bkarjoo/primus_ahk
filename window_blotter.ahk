#include wait_policy.ahk
#include image_search.ahk
#include window_create_custom_blotter.ahk
#include window_operation_completed.ahk
#include email.ahk
#include window_pnl_analysis_charting.ahk

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
    hour_glass_sleep(1000)
  }
}

turn_backtesting_on()
{
  if (is_off_backtesting())
  {
    click_backtesting()
    hour_glass_sleep(1000)
  }
}

turn_live_on()
{
  if (is_off_live())
  {
    click_live()
    hour_glass_sleep(1000)
  }
}

click_name_box()
{
  activate_blotter()
  MouseClick, Left, 130, 180
  hour_glass_sleep(200)
}


click_select_all()
{
  activate_blotter()
  MouseClick, Left, 50, 150
  hour_glass_sleep(2000)
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
  hour_glass_sleep(200)
  click_name_box()
  hour_glass_sleep(200)
  send, ^a
  hour_glass_sleep(200)
  send, {Del}
  hour_glass_sleep(200)
  Clipboard := box_name
  send, ^v
  hour_glass_sleep(200)
  send, {Enter}
  hour_glass_sleep(2000)
}

custom_blotter_open()
{
  return image_search_simple(347,216,"images/create_custom_blotter.PNG")
}

open_create_custom_blotter()
{
  activate_blotter()
  MouseClick, Right, 198, 202
  hour_glass_sleep(200)
  MouseClick, Left, 330, 275
  hour_glass_sleep(1000)
}

create_custom_blotter(box_name)
{
  activate_blotter()
  click_primus_blotter_tab()
  enter_box_name_filter(box_name)
  hour_glass_sleep(2000)
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
  hour_glass_sleep(200)
}

click_custom_blotter_name_first_row()
{
  activate_blotter()
  MouseClick, Left, 22, 212
  hour_glass_sleep(2000)
}

select_custom_blotter(blotter_name)
{
  activate_blotter()
  click_custom_blotter_tab()
  click_custom_blotter_name_filter_box()
  Send, ^a
  hour_glass_sleep(200)
  Clipboard := blotter_name
  hour_glass_sleep(200)
  Send, %blotter_name%
  hour_glass_sleep(200)
  Send, {Enter}
  hour_glass_sleep(200)
  click_custom_blotter_name_first_row()
}

process_test_results(box_name)
{
  create_custom_blotter(box_name)
  select_custom_blotter(box_name)
  capture_equity_curve()
  email_attachment(box_name, box_name, "image.png")
}

process_test_results("emos 0.0")
