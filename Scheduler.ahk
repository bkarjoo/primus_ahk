; windows
#include window_launcher.ahk
#include window_blotter.ahk
#include window_black_box_design.ahk
#include window_order_form.ahk
#include window_expression_builder.ahk
#include window_basket_manager.ahk
#include window_edit_basket.ahk
#include window_save_blackbox.ahk
#include window_information.ahk
#include window_btq_action.ahk
; tabs
#include tab_design.ahk
#include tab_symbols.ahk
#include tab_options.ahk
#include tab_risk_management.ahk
#include tab_launch_rule.ahk
; utilities
#include box_name_builder.ahk
#include files.ahk
#include gcc_compile.ahk
#include check_boxes.ahk
#include box_finder.ahk
#include wait_policy.ahk
#include inform.ahk
#include code_parser.ahk
#include box_builder.ahk
#include box_updater.ahk
#include launch_rule_cycle.ahk
#include receiver.ahk
#include logger.ahk

process_code(box_name, box_version, y1, m1, h1, y2, m2, h2)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  trace("compile " . box_name, A_ThisFunc, A_ScriptName, A_LineNumber, 3)

  compile_code_folder(box_name)
  ; TODO confirm i files were created

  ; find the box
  found := find_box(box_name)

  ; if not found build it, if found update it
  if (found)
    update_box(box_name, box_version)
  else
    build_local_box(box_name)

  trace("backup " . box_name, A_ThisFunc, A_ScriptName, A_LineNumber, 3)
  backup_compiled_files_helper(box_name, "")

  launch_rules := get_local_compiled(box_name, "launch_rules")
  cycles := []
  cycle_names := []

  ; break_down_launch_rule_into_cycles(cycles, launch_rules["launch_rule_start_year"], launch_rules["launch_rule_start_month"], launch_rules["launch_rule_start_month_half"], launch_rules["launch_rule_end_year"], launch_rules["launch_rule_end_month"], launch_rules["launch_rule_end_month_half"], cycle_names)

  break_down_launch_rule_into_cycles(cycles, y1, m1, h1, y2, m2, h2, cycle_names)

  run_launch_rule_cycles(cycles, launch_rules["launch_rules"], cycle_names)

}

process_instruction(box, version, y1, m1, h1, y2, m2, h2)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; pull the code for the box
  trace("git_clone " . box . " " . version, A_ThisFunc, A_ScriptName, A_LineNumber, 3)
  git_clone(box, version)
  ; TODO confirm new box folder created
  ; TODO confirm folder has all the requisite files

  process_code(box, version, y1, m1, h1, y2, m2, h2)

  ; delete the code for the box
  trace("git remove " . box . " " . version, A_ThisFunc, A_ScriptName, A_LineNumber, 3)
  remove_git_dir(box)
}

process_completed_run(box_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  trace("process_completed_run", A_ThisFunc, A_ScriptName, A_LineNumber, 3)
  process_test_results(box_name)
}

process_completed_runs(queue_array)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  trace("process_completed_runs", A_ThisFunc, A_ScriptName, A_LineNumber, 3)
  ; loop through boxes_in_queue array
  N :=  queue_array.MaxIndex()
  Loop, % N
  {
    reverse_i := N - A_Index + 1
    if (number_of_active_runs_for_box(queue_array[reverse_i]) = 0)
    {
      process_completed_run(queue_array[reverse_i])
      queue_array.RemoveAt(reverse_i)
    }
  }
}

; this array keeps track of boxes that are queued up
boxes_in_queue := []

; loop load files
Loop
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; atempt to fetch file from jobs folder
  get_jobs()
  file_name := get_top_file("jobs")
  trace("scheduler processing " . file_name, A_ThisFunc, A_ScriptName, A_LineNumber, 3)
  if (file_name = "")
  {
    process_completed_runs(boxes_in_queue)
    wait_until_with_message(60, "Found no files in jobs folder. Will check again in a minute")
    continue
  }

  top_file := "jobs\" . file_name
  jobs := read_lines(top_file)
  ; loop over jobs
  Loop, % jobs.MaxIndex()
  {
    log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
    ; processing a job state
    line := jobs[A_Index]
    line := Trim(line, "`r")
    trace("Processing " . line . " job.", A_ThisFunc, A_ScriptName, A_LineNumber, 3)
    tokens := StrSplit(line, ",")
    box := tokens[1]

    ; check if there's no more boxes
    if (box = "")
      break
    version := tokens[2]

    y1 := tokens[3]
    m1 := tokens[4]
    h1 := tokens[5]
    y2 := tokens[6]
    m2 := tokens[7]
    h2 := tokens[8]

    boxes_in_queue.Push(build_box_name(box, version))

    process_instruction(box, version, y1, m1, h1, y2, m2, h2)

    process_completed_runs(boxes_in_queue)
    get_jobs()

    ; wait before going to the next job
    inform_timeout_pause_option("Done with job file " . box . " " . version, 2)
  }
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)

  move_completed_job_file(file_name)
  ; wait before checking for another file
  wait_until_with_message(15, "Completed 1 file.")
}
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
