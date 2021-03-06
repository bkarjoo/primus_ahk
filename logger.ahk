#include timestamp.ahk

log(msg)
{
  msg := msg . "`n"
  FileAppend, %msg%, log.txt
}

log_trace(msg, file, function, line)
{
  return ; turn logging off
  txt := get_timestamp() . " | " . msg . " | file: " . file . " | function: " . function . " | line: " . line
  log(txt)
}
