#include wait_policy.ahk

updated(what, acronym) {
  i_file := "rules/" . what . ".c"
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
