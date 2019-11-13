; windows
#include launcher_control.ahk
#include black_box_design.ahk
#include order_form.ahk
#include expression_builder.ahk
#include basket_manager.ahk
#include edit_basket.ahk
#include save_blackbox.ahk
#include information.ahk
; tabs
#include design_tab.ahk
#include symbols_tab.ahk
#include options_tab.ahk
#include risk_management_tab.ahk
#include launch_rule_tab.ahk
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

update_box(box_name, box_version)
{
  ; assumption box is downloaded and compiled
  ; update_general_setting_helper(get_local_compiled(box_name, "general_settings"),get_backup_compiled(box_name, "general_settings"))
  update_entry_helper(get_local_compiled(box_name, "entry"),get_backup_compiled(box_name, "entry"))
  inform(A_LineNumber)
  update_target(box_name)
  inform(A_LineNumber)
  update_stop(box_name)
  inform(A_LineNumber)
  update_basket(box_name)
  inform(A_LineNumber)
  update_options(box_name)
  inform(A_LineNumber)
  update_risk_management(box_name)
  inform(A_LineNumber)
  update_launch_rules(box_name)
  inform(A_LineNumber)
  click_validate_and_close()
  inform(A_LineNumber)
}




break_down_launch_rule(box_name)
{
  ; get launch_rule.i and process it line by line
  inform(A_LineNumber)
}

run_launch_rules(launch_rules)
{
  inform(A_LineNumber)
  ; press play, waits 5 minutes
  Loop
  {
    ; task 3 : press play
    WinActivate, Primu$ 7.
    WinWaitActive, Primu$ 7.
    MouseClick, Left, 302, 51
    inform(A_LineNumber)

    WinWaitActive, BTQ Action
    inform(A_LineNumber)
    ; task 4 : check the status of the play
    ImageSearch, imgLocA, imgLocB, 0, 0, 315, 107, Success.PNG
    Sleep, 200
    inform(A_LineNumber)
    ; close the BTQ Action window
    MouseClick, Left, 271, 122
    inform(A_LineNumber)
    if (ErrorLevel = 0)
      break
    else
    {
      wait_until_with_message(300, "Queue is full.")
    }
  }
}

process_code(box_name, box_version)
{
  compile_code_folder(box_name)
  ; TODO confirm i files were created
  ; find the box
  found := find_box(box_name)

  ; if not found build it
  ; if found update it
  if (found)
    update_box(box_name, box_version)
  else
    build_local_box(box_name)
  inform(A_LineNumber)
  launch_rules := break_down_launch_rule(box_name)
  run_launch_rules(launch_rules)
  inform(A_LineNumber)
}

; process_code("emos", "master")
; msgbox done

process_instruction(box, version)
{
    ; pull the code for the box
    git_clone(box, version)
    ; TODO confirm new box folder created
    ; TODO confirm folder has all the requisite files

    process_code(box, version)
    inform(A_LineNumber)
    ; delete the code for the box
    remove_git_dir(box)
    inform(A_LineNumber)
}

remove_git_dir("emos")
ExitApp

; loop load files
Loop
{
  ; atempt to fetch file from jobs folder
  file_name := get_top_file("jobs")
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

    tokens := StrSplit(line, ",")
    box := tokens[1]

    ; check if there's no more boxes
    if (box = "")
      break
    version := Trim(tokens[2],"`r")

    process_instruction(box, version)
    inform(A_LineNumber)
    ; wait before going to the next job
    inform_timeout_pause_option("Done with job file " . box . " " . version, 60)
  }

  move_completed_job_file(file_name)
  inform(A_LineNumber)
  ; wait before checking for another file
  wait_until_with_message(15, "Completed 1 file.")
  inform(A_LineNumber)
}
