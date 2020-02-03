#include wait_policy.ahk

configuration_activate()
{
  wait_activate_popup_error("PRIMU$ -- Configuration", 3, 2)
}

click_backtesting_time_interval_tab()
{
  MouseClick, Left, 335, 43
  Sleep, 1000
}

click_one_day_radio_button()
{
  MouseClick, Left, 30, 76
  Sleep, 200
}

click_onde_day_date()
{
  MouseClick, Left, 187, 76
  Sleep, 200
}

click_multi_day_radio_button()
{
  MouseClick, Left, 30, 230
  Sleep, 200
}

click_start_date()
{
  MouseClick, Left, 187, 233
  Sleep, 200
}

click_end_date()
{
  MouseClick, Left, 187, 263
  Sleep, 200
}

enter_date(month, day, year)
{
  Send, %month%/%day%/%year%
}

click_configuration_box_save()
{
 MouseClick, Left, 512, 460
 sleep, 200
}
