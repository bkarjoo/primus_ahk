#include files.ahk
#include box_finder.ahk
#include wait_policy.ahk
#include inform.ahk

build(box_name)
{
  msgbox % "Hello wanna build" . box_name
}

update(box_name, instruction)
{
  msgbox % "Hello wanna update" . box_name
}

; program will keep going until stopped by user
; states
;      waiting for jobs to be added
;      processing jobs
;      waiting between jobs
;      TODO : waiting while jobs are in queue folder
Loop
{
  ; atempt to fetch file from jobs folder
  file_name := get_top_file()
  if (file_name = "")
  {
    wait_until_with_message(60, "Found no files in jobs folder. Will check again in a minute")
    continue
  }
  top_file := "jobs\" . file_name
  jobs := read_lines(top_file)

  Loop, % jobs.MaxIndex()
  {
    ; processing a job state
    line := jobs[A_Index]

    tokens := StrSplit(line, ",")
    box := tokens[1]
    instruction := Trim(tokens[2],"`r")
    ; last line is usually blank
    if (box = "")
      break

    if (SubStr(instruction,1,1) = "v")
    {
      if (instruction = "v0.0")
        build(box)
      else
        update(box, instruction)
      continue
    }

    launch_rule := instruction

    ; find the box
    find_result := find_box(box)

    if (find_result = 0)
    {
      Msgbox, not found
      ; TODO: should log an error in some file
      ; TODO: and archive the file into a joberror folder
      return
    }

    ; task 1.1 open the found box
    if (find_result = 1)
    {
      Click, Left, 1080, 710
      WinWait, PRIMU$ - Black Box Design
      sleep, 200
    }


    ; set desc to launch rule
    UpdateBoxDescription(launch_rule)

    ; task 2 : set the launch
    ; task 2.1 : launch translator, m1901 gets tranlated to proper launch rule
    ;   do this with a key-value pair file of all the launch rules
    ; task 2.2 : click the launch rule tab
    click_launch_rule_tab()
    Sleep, 200

    launch_script := launch_rule_dictionary[launch_rule]
    set_launch_rule(launch_script)
    Sleep, 200

    click_validate_and_close()
    WinWait, OK
    Sleep, 200
    Send, {Space}
    Sleep, 200

    ; attempting to press play for the box
    Loop
    {
      ; task 3 : press play
      WinActivate, Primu$ 7.
      WinWait, Primu$ 7.
      MouseClick, Left, 302, 51

      WinWait, BTQ Action

      ; task 4 : check the status of the play
      ImageSearch, imgLocA, imgLocB, 0, 0, 315, 107, Success.PNG
      Sleep, 200

      ; close the BTQ Action window
      MouseClick, Left, 271, 122

      if (ErrorLevel = 0)
        break
      else
      {
        wait_until_with_message(300, "Queue is full.")
      }
    }

    ; waiting between job state
    sleep, 200
    wait_until_with_message(5, "Submited 1 run.")
  }

  ; task 5 move the file to the done folder
  source_path := "jobs\" . file_name
  dest_path := "done\" . file_name
  FileMove, %source_path%, %dest_path%, 1
  wait_until_with_message(15, "Completed 1 file.")
}
