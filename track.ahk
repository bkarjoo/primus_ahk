; windows
#include header.ahk

live_runs := read_csv_file("Book1.csv")
yesterday := get_previous_trading_date()

;launcher_activate()
;launcher_click_wrench()
;click_backtesting_time_interval_tab()
;click_one_day_radio_button()
;click_onde_day_date()
d := date_convert_from_ahk(yesterday)
;send, %d%
;click_configuration_box_save()

loop % live_runs.MaxIndex()
{
  tokens := StrSplit(live_runs[A_Index], ",")

  launcher_click_open_box()
  MouseClick, Left, 100, 100

  open_blackbox_folder_search_mode_toggle()
  open_blackbox_search_field_focus()
  Clipboard := tokens[1]
  Send, ^v
  open_blackbox_search_click()
  open_blackbox_click_open()
  click_validate_and_close()

  while (number_of_free_slots() = 0)
    sleep 5000

  launcher_click_play()

  btq_action_press_ok()
 
}


msgbox done
