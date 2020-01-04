#include window_task_queue_manager.ahk
#include inform.ahk
#include window_launcher.ahk
#include window_black_box_design.ahk
#include logger.ahk

create_15_day_launch_rule_slash_style(year, month, half, byref out_start_date, byref out_end_date)
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

  out_start_date := month . "/" . d1 . "/" . year
  out_end_date := month . "/" . d2 . "/" . year
}

create_15_day_launch_rule(year, month, half)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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

create_cycle_name(y, m, h)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  mo := m
  if (m < 10)
    mo := "0" . mo
  return y . mo . "h" . h
}

break_down_launch_rule_into_slash_cycles(start_year, start_month, start_half, end_year, end_month, end_half, start_cycles, end_cycles)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  y := start_year
  m := start_month
  h := start_half
  Loop,
    {
      out_start := ""
      out_end := ""
      create_15_day_launch_rule_slash_style(y, m, h, out_start, out_end)

      start_cycles.Push(out_start)
      end_cycles.Push(out_end)

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

break_down_launch_rule_into_cycles(schedule_cycles, start_year, start_month, start_half, end_year, end_month, end_half, cycle_names)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  y := start_year
  m := start_month
  h := start_half
  Loop,
    {
      s := create_15_day_launch_rule(y,m,h)
      schedule_cycles.Push(s)
      cycle_names.Push(create_cycle_name(y,m,h))

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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return "(" . cycle . ")" . " AND " . "(" . launch_rule . ")"

}
