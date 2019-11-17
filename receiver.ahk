#include files.ahk

get_jobs()
{
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  source := creds["drive_path"] ; drive_path is path of google drive sync folder on your pc
  dest := "jobs"
  FileMove, %source%, %dest%
}
