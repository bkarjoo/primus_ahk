#include wait_policy.ahk

word_count(str, word)
{
  return (count, regexReplace( str, "(" word ")", word, count ))
}

task_queue_manager_select_and_copy_all()
{
  activate_and_wait_only("Task Queue Manager", 60)
  MouseClick, Left, 90, 80
  sleep, 200
  Send, ^a
  sleep, 200
  Send, ^c
  sleep, 333
}

maintenance_count()
{

  return word_count(Clipboard, "Maintenance")
}

in_progress_count()
{
  return word_count(Clipboard, "Processing")
}

created_count()
{
  return word_count(Clipboard, "Created")
}

waiting_for_run_count()
{
  return word_count(Clipboard, "WaitingForRun")
}

number_of_free_slots()
{
  task_queue_manager_select_and_copy_all()
  max_runs := 12
  if (maintenance_count() > 0)
    return 0
  return (max_runs - (in_progress_count() + waiting_for_run_count() + created_count()))
}
