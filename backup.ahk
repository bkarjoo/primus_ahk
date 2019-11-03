
backup(file_name, acronym)
{
  source := "pp/" . file_name . ".i"
  target := "../bu/" . acronym . "/" . file_name . "_bu.i"
  FileCopy, %source%, %target%, 1
}
