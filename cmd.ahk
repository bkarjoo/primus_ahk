#include logger.ahk
run_cmd(command)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  RunWait, cmd.exe /c %command%,,hide
}
