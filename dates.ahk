#include logger.ahk
#include window_launcher.ahk
#include window_configuration.ahk
#include launch_rule_cycle.ahk
#include window_btq_action.ahk
#include window_task_queue_manager.ahk
#include inform.ahk
#include wait_policy.ahk

date_convert_to_ahk(d)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  array := StrSplit(d, "/")
  m := array[1]
  d := array[2]
  y := array[3]

  y := "20" . y

  return (y . m . d . "120000")
}

date_convert_from_ahk(ahk_date)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  m := SubStr(ahk_date, 5, 2)
  d := SubStr(ahk_date, 7, 2)
  y := SubStr(ahk_date, 3, 2)

  return (m . "/" . d . "/" . y)
}

add_day(d)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ahk_date := date_convert_to_ahk(d)
  ahk_date += 1, Days
  return date_convert_from_ahk(ahk_date)
}

subtract_day(d)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ahk_date := date_convert_to_ahk(d)
  ahk_date += -1, Days
  return date_convert_from_ahk(ahk_date)
}

set_backtesting_date_intervals(start_month, start_day, start_year, end_month, end_day, end_year)
{
  launcher_activate()
  launcher_click_wrench()
  click_backtesting_time_interval_tab()
  click_multi_day_radio_button()
  click_start_date()
  enter_date(start_month,start_day,start_year)
  click_end_date()
  enter_date(end_month,end_day,end_year)
  click_configuration_box_save()
}


run_date_cycle(start_year, start_month, start_half, end_year, end_month, end_half)
{
  start_cycles := []
  end_cycles := []
  break_down_launch_rule_into_slash_cycles(start_year, start_month, start_half, end_year, end_month, end_half, start_cycles, end_cycles)

  Loop % start_cycles.MaxIndex()
  {
    n := A_Index
    while (number_of_free_slots() = 0)
    {
      wait_until_with_message(5, "No more free slots. " . start_cycles[n])
    }
    pause_mechanism()
    launcher_activate()
    launcher_click_wrench()
    click_backtesting_time_interval_tab()
    click_multi_day_radio_button()
    click_start_date()
    ; MsgBox % start_cycles[A_Index]
    Send % start_cycles[A_Index]
    ; MsgBox % end_cycles[A_Index]
    click_end_date()
    Send % end_cycles[A_Index]
    click_configuration_box_save()

    launcher_click_play()
    succeeded := is_success()
    ; quick_inform("succeeded: " . succeeded)
    if (succeeded)
    {
      btq_action_press_ok()
      Sleep, 1000
      i := i + 1
      if (i > schedule_cycles.MaxIndex())
        break
      continue
    }
    else
    {
      inform("Problem with run.")
    }
  }

  ;MsgBox % "Done " . start_year . "," . start_month . "," . start_half . "," . end_year . "," . end_month . "," . end_half
}
