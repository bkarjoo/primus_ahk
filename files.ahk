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
