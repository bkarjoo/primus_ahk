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

+!f::
WinActivate, D:\Users\
return

+!g::
WinActivate, Primu$ 7.
return

+!l::
InputBox, out, q, Enter box name version
create_custom_blotter(out)
; click primus blotter tab

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
select_custom_blotter()
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
