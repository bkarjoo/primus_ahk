; windows
#include window_launcher.ahk
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

process_code(box_name, box_version)
{
  quick_inform("compile " . box_name)
  compile_code_folder(box_name)
  ; TODO confirm i files were created

  ; find the box
  found := find_box(box_name)

  ; if not found build it, if found update it
  if (found)
    update_box_no_launch_rules(box_name, box_version)
  else
    build_local_box(box_name)

    quick_inform("backup " . box_name)
  backup_compiled_files_helper(box_name, "")

  launch_rules := get_local_compiled(box_name, "launch_rules")
  cycles := []
  break_down_launch_rule_into_cycles(cycles, launch_rules["launch_rule_start_year"], launch_rules["launch_rule_start_month"], launch_rules["launch_rule_start_month_half"], launch_rules["launch_rule_end_year"], launch_rules["launch_rule_end_month"], launch_rules["launch_rule_end_month_half"])

  run_launch_rule_cycles(cycles, launch_rules["launch_rules"])

}

process_instruction(box, version)
{
    ; pull the code for the box
    quick_inform("git_clone " . box . " " . version)
    git_clone(box, version)
    ; TODO confirm new box folder created
    ; TODO confirm folder has all the requisite files

    process_code(box, version)

    ; delete the code for the box
    quick_inform("git remove " . box . " " . version)
    remove_git_dir(box)
}

; loop load files
Loop
{
  ; atempt to fetch file from jobs folder
  get_jobs()
  file_name := get_top_file("jobs")
  quick_inform("processing " . file_name . " file.")
  if (file_name = "")
  {
    wait_until_with_message(60, "Found no files in jobs folder. Will check again in a minute")
    continue
  }

  top_file := "jobs\" . file_name
  jobs := read_lines(top_file)
  ; loop over jobs
  Loop, % jobs.MaxIndex()
  {
    ; processing a job state
    line := jobs[A_Index]
    quick_inform("Processing " . line . " job.")
    tokens := StrSplit(line, ",")
    box := tokens[1]

    ; check if there's no more boxes
    if (box = "")
      break
    version := Trim(tokens[2],"`r")


    process_instruction(box, version)

    ; wait before going to the next job
    inform_timeout_pause_option("Done with job file " . box . " " . version, 2)
  }

  move_completed_job_file(file_name)
  ; wait before checking for another file
  wait_until_with_message(15, "Completed 1 file.")
}