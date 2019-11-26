

log(msg)
{
  msg := msg . "`n"
  FileAppend, %msg%, log.txt
}

log_trace(msg, file, function, line)
{
  txt := msg . " | file: " . file . " | function: " . function . " | line: " . line
  log(txt)
}
