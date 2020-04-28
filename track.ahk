; windows
#include header.ahk

enable_debug := True

live_runs := read_csv_file("Book1.csv")
yesterday := get_previous_trading_date()

d := date_convert_from_ahk(yesterday)
InputBox, out, question, enter date,,,,,,,,%d%


launcher_activate()
launcher_click_wrench()
click_backtesting_time_interval_tab()
click_one_day_radio_button()
click_onde_day_date()

send, %out%
click_configuration_box_save()

loop % live_runs.MaxIndex()
{
  pause_mechanism()
  tokens := StrSplit(live_runs[A_Index], ",")

  launcher_click_open_box()
  MouseClick, Left, 100, 100
  pause_mechanism()

  open_blackbox_folder_search_mode_toggle()
  sleep, 500
  pause_mechanism()
  open_blackbox_search_field_focus()
  sleep, 500
  pause_mechanism()
  Clipboard := tokens[1]
  sleep, 500
  Send, ^v
  open_blackbox_search_click()
  inform_timeout_pause_option("Waiting 2 seconds for box to be found. If found you can press enter.", 2)
  pause_mechanism()
  sleep, 500
  open_blackbox_click_open()
  sleep, 500
  pause_mechanism()

  win_activate_black_box_design()
  win_wait_active_black_box_design()
  MouseClick, Left, 930, 910

  WinWaitActive, OK
  send, {Space}
  sleep, 500
  pause_mechanism()
  while (number_of_free_slots() = 0)
  {
    pause_mechanism()
    sleep 2000
  }
  launcher_click_play()

  btq_action_press_ok()

}


msgbox done
