
; test if it can detect last is checked
#include black_box_clicks.ahk
#include file_reader.ahk

/*
my_dict := { "k1" : "v1", "k2" : "v2"}

my_dict["k1"] := "vupdate"
x := my_dict["k1"]

file := FileOpen("record.bin", "w", "cp0")
file.RawWrite(&my_dict, 10000)
file.Close()

msgbox %x%
*/

/*
file := FileOpen("record.bin", "r")

file.RawRead(&md, file.Length)
x := md["k1"]

msgbox %x%
*/

FileCopy, record.bin, backup.bin
