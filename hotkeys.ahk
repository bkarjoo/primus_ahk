; hotkeys for activating primus analysis windows
; Analysis
#include window_blotter.ahk

+!a::
WinActivate, Multi-Day Analysis
sleep, 100
WinActivate, Statistic Report
return

; breakdown
+!b::
WinActivate, Breakdown
return

+!c::
WinActivate, PnL Analysis Charting
return

+!d::
WinActivate, Execution
sleep, 100
WinActivate, Trade -
sleep, 100
WinActivate, Trade Analysis Charting
return

+!e::
WinActivate, Primu$ 7.
return

+!f::
WinActivate, D:\Users\
return

; git hub cloner
+!g:: ; github
  InputBox, out, question, enter box name
  send, git clone https://github.com/bkarjoo/%out%
  return

; job name generator for saving job files
+!j:: ; job
  random, n, 1000000, 9999999
  send, job%n%.csv
  return

+!l::
InputBox, out, q, Enter box name version
activate_blotter()
click_refresh()
click_primus_blotter_tab()
hour_glass_sleep(200)
click_name_box()
hour_glass_sleep(200)
send, ^a
hour_glass_sleep(200)
Clipboard := out
send, ^v
return

+#n::
+!n::
WinActivate, News Viewer
return

+#o::
+!o::
WinActivate, ahk_exe atom.exe
return

+#p::
+!p::
FileDelete, run_state.txt
FileAppend, False, run_state.txt
return

+#q::
+!q::
WinActivate, Task Queue Manager
return

+#r::
+!r::
WinActivate, Black Box Report
return

+#s::
+!s::
InputBox, out, q, Enter box name version
select_custom_blotter(out)
return

+#t::
+!t::
WinActivate, BlackBox Tree
return

; git upstream
+!u::
  send, git push --set-upstream origin
  return

+#v::
+!v::
return

+!x::
WinActivate, Trade Analysis Charting
sleep, 100
send, !{space}n
return
