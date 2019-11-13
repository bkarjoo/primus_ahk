#include files.ahk

local_compiled_path(box_name, component)
{
  p := box_name "\" . component . ".i"
  return p
}

backup_compiled_path(box_name, component)
{
  p := "..\bu\" . box_name "\" . component . "_bu.i"
  return p
}

get_local_compiled(box_name, component)
{
  a := {}
  generic_code_parser(local_compiled_path(box_name, component), a)
  return a
}

get_backup_compiled(box_name, component)
{
  a := {}
  generic_code_parser(backup_compiled_path(box_name, component), a)
  return a
}
