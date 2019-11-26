#include files.ahk
#include logger.ahk 

get_jobs()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  source := creds["drive_path"] ; drive_path is path of google drive sync folder on your pc
  dest := "jobs"
  FileMove, %source%, %dest%
}
