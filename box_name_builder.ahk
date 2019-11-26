#include logger.ahk

build_box_name(box_name, box_version) {
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  name := box_name . " " . box_version
  return name
}

build_box_description(launch_name, desc, basket) {
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  name := launch_name . " b: " . basket . " d: " . desc
  return name
}
