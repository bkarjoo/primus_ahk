click_backtesting_time_interval_tab()
{
  MouseClick, Left, 335, 43
  Sleep, 1000
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
