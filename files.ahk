#include wait_policy.ahk
#include clipboard_paste.ahk
#include cmd.ahk
#include logger.ahk

file_updated(c_path, i_path)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
FileGetTime, p1time, %c_path%
FilegetTime, p2time, %i_path%
return p1time > p2time
}

; code_component = entry, target, stop, etc...
build_c_path(code_component)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
return code_component . ".c"
}
build_i_path(code_component)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
return "pp/" code_component . ".i"
}
build_bu_path(code_component, name)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
return "../bu/" . name . "/" . code_component . "_bu.i"
}

updated(code_component, name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  i_file := what . ".c"
  bu_file := "../bu/" . name . "/" . what . "_bu.i"
  FileGetTime, i_time, %i_file%
  FileGetTime, bu_time, %bu_file%
  return i_time > bu_time
}

confirm_file_exists(path)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  msg := "File " . path . " not found."
  if !FileExist(path)
    inform(msg)
}

backup(file_name, name, i_folder)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  source := ""
  if (i_folder = "")
    source := name . "/" . file_name . ".i"
  else
    source := i_folder . "/" . file_name . ".i"
  target := "../bu/" . name . "/" . file_name . "_bu.i"

  FileCopy, %source%, %target%, 1
}

confirm_image_search_files_exist()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  image_path := creds["image_path"]
  confirm_file_exists(image_path . "checked.PNG")
  confirm_file_exists(image_path . "design.PNG")
  confirm_file_exists(image_path . "launch_rule.PNG")
  confirm_file_exists(image_path . "options.PNG")
  confirm_file_exists(image_path . "risk_management.PNG")
  confirm_file_exists(image_path . "symbols.PNG")
}

confirm_code_files_exist()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  confirm_file_exists("general_settings.c")
  confirm_file_exists("entry.c")
  confirm_file_exists("target.c")
  confirm_file_exists("stop.c")
  confirm_file_exists("time_options.c")
  confirm_file_exists("position_sizing.c")
  confirm_file_exists("basket.c")
  confirm_file_exists("launch_rules.c")
  confirm_file_exists("risk_management.c")
}

confirm_compiled_files_exist()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  confirm_file_exists("pp/general_settings.i")
  confirm_file_exists("pp/entry.i")
  confirm_file_exists("pp/target.i")
  confirm_file_exists("pp/stop.i")
  confirm_file_exists("pp/time_options.i")
  confirm_file_exists("pp/position_sizing.i")
  confirm_file_exists("pp/basket.i")
  confirm_file_exists("pp/launch_rules.i")
  confirm_file_exists("pp/risk_management.i")
}

confirm_requisite_file_for_update(box_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; ../bu/ . box_name .. /
  prefix := "../bu/" . box_name
  confirm_file_exists(prefix . "/general_settings_bu.i")
  confirm_file_exists(prefix . "/entry_bu.i")
  confirm_file_exists(prefix . "/target_bu.i")
  confirm_file_exists(prefix . "/stop_bu.i")
  confirm_file_exists(prefix . "/time_options_bu.i")
  confirm_file_exists(prefix . "/position_sizing_bu.i")
  confirm_file_exists(prefix . "/basket_bu.i")
  confirm_file_exists(prefix . "/launch_rules_bu.i")
}

confirm_requisite_files()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  confirm_image_search_files_exist()
  confirm_code_files_exist()
}

generic_code_parser(file_name, array)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Loop
  {
    FileReadLine, Line, %file_name%, %A_Index%
    if (ErrorLevel)
      break
    if (line = "")
      continue
    if (SubStr(line, 1, 1) = ";")
      continue
    if (SubStr(line,1,1) = "#")
      continue
    if (line = "}")
    {
      in_bracket_block := false
      ; assign bracket_block_content to a variable

      array[name] := bracket_block_content
      bracket_block_content := ""
    }
    if (line = "{") {
      in_bracket_block := true
      continue
    }
    if (in_bracket_block) {
      ; build block content line by line
      bracket_block_content := bracket_block_content . " " . line
    }
    else
    {
      ; name value pair line, split by equal
      tokens := StrSplit(line, "=")
      name := Trim(tokens[1])
      value := Trim(tokens[2])
      if (value != "")
      {
        array[name] := value
      }
    }
  }
}


create_backup_folder_helper(box_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  bu_md_cmd := "if not exist ..\bu\" . box_name . " md ..\bu\" . box_name
  run_cmd(bu_md_cmd)
}

create_backup_folder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  general_settings := {}
  generic_code_parser("pp/general_settings.i", general_settings)
  create_backup_folder_helper(general_settings["box_name"])
}

backup_compiled_files_helper(box_name, i_folder)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  backup("basket", box_name, i_folder)
  backup("entry", box_name, i_folder)
  backup("general_settings", box_name, i_folder)
  backup("launch_rules", box_name, i_folder)
  backup("position_sizing", box_name, i_folder)
  backup("stop", box_name, i_folder)
  backup("target", box_name, i_folder)
  backup("time_options", box_name, i_folder)
  backup("risk_management", box_name, i_folder)
}

backup_compiled_files()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  gs := {}
  generic_code_parser("pp/general_settings.i", gs)
  backup_compiled_files_helper(gs["box_name"], "pp")
}

backup_compiled_files_if_changed(ustate, box_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  if (ustate["basket_updated"])
    backup("basket", box_name, "pp")
  if (ustate["entry_updated"])
    backup("entry", box_name, "pp")
  if (ustate["launch_rules_updated"])
    backup("launch_rules", box_name, "pp")
  if (ustate["position_sizing_updated"])
    backup("position_sizing", box_name, "pp")
  if (ustate["stop_updated"])
    backup("stop", box_name, "pp")
  if (ustate["target_updated"])
    backup("target", box_name, "pp")
  if (ustate["general_settings_updated"])
    backup("general_settings", box_name, "pp")
  if (ustate["time_options_updated"])
    backup("time_options", box_name, "pp")
  if (ustate["risk_management_updated"])
    backup("risk_management", box_name, "pp")
}

number_of_updated_files(array)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  i := 0
  if (array["basket_updated"])
    i := i + 1
  if (array["entry_updated"])
    i := i + 1
  if (array["target_updated"])
    i := i + 1
  if (array["stop_updated"])
    i := i + 1
  if (array["time_options_updated"])
    i := i + 1
  if (array["general_settings_updated"])
    i := i + 1
  if (array["position_sizing_updated"])
    i := i + 1
  if (array["risk_management_updated"])
    i := i + 1
  if (array["launch_rules_updated"])
    i := i + 1
  return i
}

get_code_files_update_status(box_name, array)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  array["basket_updated"] := file_updated(build_c_path("basket"), build_i_path("basket"))
  array["entry_updated"] := file_updated(build_c_path("entry"), build_i_path("entry"))
  array["target_updated"] := file_updated(build_c_path("target"), build_i_path("target"))
  array["stop_updated"] := file_updated(build_c_path("stop"), build_i_path("stop"))
  array["time_options_updated"] := file_updated(build_c_path("time_options"), build_i_path("time_options"))
  array["general_settings_updated"] := file_updated(build_c_path("general_settings"), build_i_path("general_settings"))
  array["position_sizing_updated"] := file_updated(build_c_path("position_sizing"), build_i_path("position_sizing"))
  array["risk_management_updated"] := file_updated(build_c_path("risk_management"), build_i_path("risk_management"))
  array["launch_rules_updated"] := file_updated(build_c_path("launch_rules"), build_i_path("launch_rules"))
}

read_lines(file_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  FileRead, LoadedText, %file_name%
  oText := StrSplit(LoadedText, "`n")
  ;Loop, % oText.MaxIndex()
  ;  MsgBox, % oText[A_Index]
  return oText
}

list_files(path)
{
    log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
    files =
    Loop % path . "\\*.*"
    {
      files = %files%`n%A_LoopFileName%
    }
    return files
}

get_top_file(path)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Loop % path . "\\*.*"
  {
    return A_LoopFileName
  }
  return
}

load_csv_dictionary(file_path, output_array)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Loop, Read, %file_path%
  {
    Loop, Parse, A_LoopReadLine, CSV
    {
      Field%A_Index% := A_LoopField
      output_array[Field1] := Field2
    }
  }
}

; read the csv into a key value associative array
load_jobs(file_path, output_array)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  Loop, Read, %file_path%
  {
    Loop, Parse, A_LoopReadLine, CSV
    {
      Field%A_Index% := A_LoopField
      output_array[Field1] := Field2
    }
  }
}

move_completed_job_file(file_name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  source_path := "jobs\" . file_name
  dest_path := "done\" . file_name
  FileMove, %source_path%, %dest_path%, 1
}
