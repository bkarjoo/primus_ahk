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
sleep, 100
WinActivate, PnL Analysis Charting
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

+!h::
  InputBox, box, q, box name
  InputBox, ver, q, version
  git_clone(box, ver)
  msgbox, verify clone of %box% %ver%
  compile_code_folder(box)
  msgbox, verify compile of %box%
  f := find_box(box)
  if (f)
    update_box_dynamic_version(box, ver)
  else
    build_local_box_version(box, ver)
  msgbox, backing up %box%
  backup_compiled_files_helper(box, "")
  git_commit_bu()
  git_push_bu()
  msgbox, removing %box%
  remove_git_dir(box)
  msgbox, done
  return

+!i::
  FormatTime, n,, MM/d/yy HH:mm
  send, %n%:
  return

+!j:: ; job
  FormatTime, n,, yyMMdHHmm
  send, job%n%.csv
  return

+!k::
  InputBox, sy, q, start year
  InputBox, sm, q, start month
  InputBox, sh, q, start half
  InputBox, ey, q, end year
  InputBox, em, q, end month
  InputBox, eh, q, end half
  run_date_cycle(sy, sm, sh, ey, em, eh)
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

+#m::
+!m::
WinActivate, Basket Matrix
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

+#w::
+!w::
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
WinActivate, Google Chrome
return

+!x::
WinActivate, Trade Analysis Charting
sleep, 100
send, !{space}n
return
