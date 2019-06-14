
get_backup_file_name(file_name)
{
  return SubStr(file_name, 1, StrLen(file_name) - 2) . "_bu.i"
}


backup(file_name)
{
  target := get_backup_file_name(file_name)
  FileCopy, %file_name%, %target%, 1
}
