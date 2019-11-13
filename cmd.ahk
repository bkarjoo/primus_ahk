run_cmd(command)
{
  RunWait, cmd.exe /c %command%,,hide
}
