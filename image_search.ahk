#include wait_policy.ahk
#include logger.ahk

image_search(window_title, start_x, start_y, end_x, end_y, image_path)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  activate_and_wait_only(window_title, 5)
  ImageSearch, ox, oy, %start_x%, %start_y%, %end_x%, %end_y%, %image_path%
  return (ErrorLevel = 0)
}

image_search_from_0(window_title, end_x, end_y, image_path)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  return image_search(window_title, 0, 0, end_x, end_y, image_path)
}

image_search_simple(x,y,path)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ImageSearch, ox, oy, 0, 0, %x%, %y%, %path%
  return (ErrorLevel = 0)
}
