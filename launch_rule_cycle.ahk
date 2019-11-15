#include task_queue_manager.ahk
#include inform.ahk
#include launcher_control.ahk
#include black_box_design.ahk

create_15_day_launch_rule(year, month, half)
{
  if (month < 10)
    month := "0" . month

  if (half = 1)
  {
    d1 := "01"
    d2 := "14"
  }
  else
  {
    d1 := "15"
    if (month = 2)
    {
      if (year = 2012 or year = 2016 or year = 2020 or year = 2024)
        d2 := "29"
      else
        d2 := "28"
    }
    else if (month = 4 or month = 6 or month = 9 or month = 11)
      d2 := "30"
    else
      d2 := "31"
  }


  s := "(CurrentDate >= #" . year . "-" . month . "-" . d1 . "# AND CurrentDate <= #" . year . "-" . month . "-" . d2 . "#" . ")"

  return s
}


break_down_launch_rule_into_cycles(schedule_cycles, start_year, start_month, start_half, end_year, end_month, end_half)
{

  y := start_year
  m := start_month
  h := start_half
  Loop,
    {
      s := create_15_day_launch_rule(y,m,h)
      schedule_cycles.Push(s)

      if (y = end_year and m = end_month and h = end_half)
        break

      h := h + 1

      if (h = 3)
      {
        h := 1
        m := m + 1
      }

      if (m = 13)
      {
        m := 1
        y := y + 1
      }

    }
}

cyclify_launch_rule(cycle, launch_rule)
{
  return "(" . cycle . ")" . " AND " . "(" . launch_rule . ")"

}



run_launch_rule_cycles(schedule_cycles, launch_rules)
{
  quick_inform("run_launch_rule_cycles: # of cycles: " . schedule_cycles.MaxIndex())

  i := 1
  j := 0
  loop
  {
    if (i != j)
    {
      cycle_launch_rule := cyclify_launch_rule(schedule_cycles[i], launch_rules)
      if (!WinExist("PRIMU$ - Black"))
        launcher_click_edit_box()
      change_just_the_launch_rule(cycle_launch_rule)
      click_validate_and_close()
      j := i
    }

    if (number_of_free_slots() > 1)
    {
      launcher_click_play()
      succeeded := is_success()
      quick_inform("succeeded: " . succeeded)
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
        btq_action_press_ok()
      }
    }
    wait_until_with_message(60, "waiting for free slots...")
  }
}

;launch_rule := "(CurrentDate = #2011-09-09#)"
;
;schedule_cycles := []
;break_down_launch_rule_into_cycles(schedule_cycles, 2011, 9, 2, 2012, 2, 2)
;
;for index, element in schedule_cycles
;{
;  msgbox % cyclify_launch_rule(element, launch_rule)
;}
