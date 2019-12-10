; hotkeys for activating primus analysis windows
; Analysis
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

+!f::
WinActivate, D:\Users\
return

+!g::
WinActivate, Primu$ 7.
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

+#t::
+!t::
WinActivate, BlackBox Tree
return

+!x::
WinActivate, Trade Analysis Charting
sleep, 100
send, !{space}n
return
