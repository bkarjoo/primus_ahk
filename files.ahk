#include wait_policy.ahk
#include clipboard_paste.ahk

file_updated(c_path, i_path)
{
FileGetTime, p1time, %c_path%
FilegetTime, p2time, %i_path%
return p1time > p2time
}

; code_component = entry, target, stop, etc...
build_c_path(code_component)
{
return code_component . ".c"
}
build_i_path(code_component)
{
return "pp/" code_component . ".i"
}
build_bu_path(code_component, acronym)
{
return "../bu/" . acronym . "/" . code_component . "_bu.i"
}

updated(code_component, acronym) {

  i_file := what . ".c"
  bu_file := "../bu/" . acronym . "/" . what . "_bu.i"
  FileGetTime, i_time, %i_file%
  FileGetTime, bu_time, %bu_file%
  return i_time > bu_time
}

confirm_file_exists(path)
{
  msg := "File " . path . " not found."
  if !FileExist(path)
    inform(msg)
}

backup(file_name, acronym)
{
  source := "pp/" . file_name . ".i"
  target := "../bu/" . acronym . "/" . file_name . "_bu.i"
  FileCopy, %source%, %target%, 1
}

confirm_image_search_files_exist()
{
  confirm_file_exists("images/checked.PNG")
  confirm_file_exists("images/design.PNG")
  confirm_file_exists("images/launch_rule.PNG")
  confirm_file_exists("images/options.PNG")
  confirm_file_exists("images/risk_management.PNG")
  confirm_file_exists("images/symbols.PNG")
}

confirm_code_files_exist()
{
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

confirm_requisite_file_for_update(box_acronym)
{
  ; ../bu/ . box_acronym .. /
  prefix := "../bu/" . box_acronym
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
  confirm_image_search_files_exist()
  confirm_code_files_exist()
}

generic_code_parser(file_name, array)
{
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


make_back_up_directory(box_acronym)
{
  bu_md_cmd := "if not exist ..\bu\" . box_acronym . " md ..\bu\" . box_acronym
  clipboard_paste(bu_md_cmd)
}

create_backup_folder()
{
  general_settings := {}
  generic_code_parser("pp/general_settings.i", general_settings)
  make_back_up_directory(general_settings["box_acronym"])
}

backup_compiled_files()
{
  gs := {}
  generic_code_parser("pp/general_settings.i", gs)

  backup("basket", gs["box_acronym"])
  backup("entry", gs["box_acronym"])
  backup("general_settings", gs["box_acronym"])
  backup("launch_rules", gs["box_acronym"])
  backup("position_sizing", gs["box_acronym"])
  backup("stop", gs["box_acronym"])
  backup("target", gs["box_acronym"])
  backup("time_options", gs["box_acronym"])
  backup("risk_management", gs["box_acronym"])
}

backup_compiled_files_if_changed(ustate, box_acronym)
{
  if (ustate["basket_updated"])
    backup("basket", box_acronym)
  if (ustate["entry_updated"])
    backup("entry", box_acronym)
  if (ustate["launch_rules_updated"])
    backup("launch_rules", box_acronym)
  if (ustate["position_sizing_updated"])
    backup("position_sizing", box_acronym)
  if (ustate["stop_updated"])
    backup("stop", box_acronym)
  if (ustate["target_updated"])
    backup("target", box_acronym)
  if (ustate["general_settings_updated"])
    backup("general_settings", box_acronym)
  if (ustate["time_options_updated"])
    backup("time_options", box_acronym)
  if (ustate["risk_management_updated"])
    backup("risk_management", box_acronym)
}

number_of_updated_files(array)
{
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

get_code_files_update_status(box_acronym, array)
{
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
  FileRead, LoadedText, %file_name%
  oText := StrSplit(LoadedText, "`n")
  ;Loop, % oText.MaxIndex()
  ;  MsgBox, % oText[A_Index]
  return oText
}

list_files(path)
{
    files =
    Loop % path . "\\*.*"
    {
      files = %files%`n%A_LoopFileName%
    }
    return files
}

get_top_file(path)
{
  Loop % path . "\\*.*"
  {
    return A_LoopFileName
  }
  return
}

load_csv_dictionary(file_path, output_array)
{
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
  Loop, Read, %file_path%
  {
    Loop, Parse, A_LoopReadLine, CSV
    {
      Field%A_Index% := A_LoopField
      output_array[Field1] := Field2
    }
  }
}
