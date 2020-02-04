#include header.ahk

secrets := {}
load_csv_dictionary("secret.csv", secrets)
msgbox % secrets["tos_password"]
msgbox % secrets["primus_password"]
msgbox % secrets["redi_password"]
msgbox % secrets["tos_userid"]
