#include wait_policy.ahk
#include logger.ahk

word_count(str, word)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return (count, regexReplace( str, "(" word ")", word, count ))
}

task_queue_manager_select_and_copy_all()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  activate_and_wait_only("Task Queue Manager", 60)
  MouseClick, Left, 90, 80 ; one row is always selected, clicking first row not necessary
  sleep, 200
  Send, ^a
  sleep, 200
  Send, ^c
  sleep, 333
}

maintenance_count(str)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return word_count(str, "Maintenance")
}

in_progress_count(str)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return word_count(str, "Processing")
}

created_count(str)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return word_count(str, "Created")
}

waiting_for_run_count(str)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return word_count(str, "WaitingForRun")
}

current_queue_size(str)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return (in_progress_count(str) + waiting_for_run_count(str) + created_count(str))
}

number_of_free_slots()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  task_queue_manager_select_and_copy_all()
  hour_glass_sleep(200)
  s := Clipboard
  max_runs := 24
  if (maintenance_count(s) > 0)
    return 0
  return (max_runs - current_queue_size(s))
}

number_of_active_runs_for_box(box_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  task_queue_manager_select_and_copy_all()
  hour_glass_sleep(200)
  s := Clipboard
  lines := StrSplit(s, "`n")
  count := 0
  Loop % lines.MaxIndex()
  {
    if (word_count(lines[A_Index], box_name) > 0)
    {
      if (current_queue_size(lines[A_Index]) > 0)
        count := count + 1
    }
  }
  return count
}
