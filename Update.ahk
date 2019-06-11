; take the filename to update as command line argument
; expects there to be a back up for that file
; back up is created by Build.ahk and this module
#include file_reader.ahk
#include file_reader_bu.ahk

file_name = %1%

backup_file := SubStr(file_name, 1, StrLen(file_name) - 2) . "_bu.i"
MsgBox %backup_file%
