; windows
#include window_launcher.ahk
#include window_blotter.ahk
#include window_black_box_design.ahk
#include window_order_form.ahk
#include window_expression_builder.ahk
#include window_basket_manager.ahk
#include window_edit_basket.ahk
#include window_save_blackbox.ahk
#include window_information.ahk
#include window_btq_action.ahk
; tabs
#include tab_design.ahk
#include tab_symbols.ahk
#include tab_options.ahk
#include tab_risk_management.ahk
#include tab_launch_rule.ahk
; utilities
#include box_name_builder.ahk
#include files.ahk
#include gcc_compile.ahk
#include check_boxes.ahk
#include box_finder.ahk
#include wait_policy.ahk
#include inform.ahk
#include code_parser.ahk
#include box_builder.ahk
#include box_updater.ahk
#include launch_rule_cycle.ahk
#include receiver.ahk
#include logger.ahk
#include dates.ahk

; job name generator for saving job files



!a::
  WinActivate, Statistic Report
  sleep, 100
  WinActivate, Multi-Day Analysis
  return

; breakdown
!b::
  WinActivate, Breakdown
  sleep, 100
  WinActivate, PnL Analysis Charting
  return

^b::


  folderX := 138
  folderY := 243


  boxX := 412
  box_first_row := 81
  boxY := box_first_row

  box_count := 10

  increment := 22

  Loop, %box_count%
  {
    launcher_activate()
    launcher_click_open_box()
    MouseClick, Left, folderX, folderY
    sleep, 200
    MouseClick, Left, boxX, boxY
    sleep, 200
    open_blackbox_click_open()
    sleep, 200
    target_open_existing_order()
    sleep, 200
    set_order_form_destination("SNIPER")
    sleep, 200
    click_order_form_save_button()
    sleep, 200
    click_validate_and_close()
    launcher_click_save_box()
    sleep, 200
    send, {Space}

    boxY := boxY + increment
  }

  msgbox done
  return

!c::
WinActivate, PnL Analysis Charting
return

; workflow for analyzing trades
!d::
WinActivate, Execution
sleep, 100
WinActivate, Trade -
sleep, 100
WinActivate, Trade Analysis Charting
return

; workflow for line by line exclude of dnt which is in clipboard, takes out line feeds
^d::
Clipboard := StrReplace(Clipboard, "`r", " ")
Clipboard := StrReplace(Clipboard, "`n", " ")
SetTitleMatchMode, 2
WinActivate,  [Shorts 200123]
first_row := 135
last_row := 479
row_count := 18 - 1
increment := (last_row - first_row) / row_count
x := 200
Loop % row_count + 1
{
  y := first_row + (A_Index - 1) * increment
  MouseClick, Right, x, y
  Sleep, 200
  MouseClick, Left, 220, y + 95
  WinWaitActive, Kill Symbol(s)
  Sleep, 200
  Send, ^v
  Sleep, 200
  MouseClick, Left, 379, 239
  Sleep, 200
}
Msgbox % Clipboard
return

!e::
WinActivate, Primu$ 7.
return

!f::
WinActivate, D:\Users\
return

; git hub cloner
!g:: ; github
  InputBox, out, question, enter box name
  send, git clone https://github.com/bkarjoo/%out%
  return

!h::
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

!i::
  FormatTime, n,, MM/d/yy HH:mm
  send, %n%:
  return

!j:: ; job
  FormatTime, n,, yyMMdHHmm
  send, job%n%.csv
  return

!k::
  InputBox, sy, q, start year
  InputBox, sm, q, start month
  InputBox, sh, q, start half
  InputBox, ey, q, end year
  InputBox, em, q, end month
  InputBox, eh, q, end half
  run_date_cycle(sy, sm, sh, ey, em, eh)
  return

!l:: ; types a box name filter in primus blotter
InputBox, out, q, Enter box name version
activate_blotter()
;click_refresh()
click_primus_blotter_tab()
hour_glass_sleep(200)
click_name_box()
hour_glass_sleep(200)
send, ^a
hour_glass_sleep(200)
Clipboard := out
send, ^v
hour_glass_sleep(200)
click_refresh()
; double click the check box to select all
hour_glass_sleep(200)

msgbox done
return

!;:: ; selects all
activate_blotter()
hour_glass_sleep(200)
MouseClick, Left, 50, 145
hour_glass_sleep(200)
MouseClick, Left, 50, 145
msgbox done
return


!':: ; creates a custom blotter
InputBox, out, q, Enter box name version,,,,,,,,%Clipboard%
Clipboard := out
activate_blotter()
hour_glass_sleep(200)
MouseClick, Right, 240, 201
hour_glass_sleep(200)
MouseClick, Left, 301, 278
hour_glass_sleep(200)
send, {Tab}{Tab}
hour_glass_sleep(200)
send, ^v
hour_glass_sleep(200)

send, {Tab}{Tab}
hour_glass_sleep(200)
send, {Space}
hour_glass_sleep(200)

WinWaitActive, Operation completed
hour_glass_sleep(200)
send, {Space}
hour_glass_sleep(200)

msgbox done
return


!/:: ;
InputBox, out, q, Enter box name version,,,,,,,,%Clipboard%
Clipboard := out
activate_blotter()
hour_glass_sleep(200)
MouseClick, Left, 112, 85
hour_glass_sleep(200)
select_custom_blotter(out)

msgbox done
return



+#m::
!m::
WinActivate, Basket Matrix
return

+#n::
!n::
WinActivate, News Viewer
return

+#o::
!o::
WinActivate, ahk_exe atom.exe
return

+#p::
!p::
FileDelete, run_state.txt
FileAppend, False, run_state.txt
return

+#w::
!w::
+#q::
!q::
WinActivate, Task Queue Manager
return

+#r::
!r::
WinActivate, Black Box Report
return




+#s::
!s::
InputBox, out, q, Enter box name version
select_custom_blotter(out)
return

+#t::
!t::
WinActivate, BlackBox Tree
return

; git upstream
!u::
  send, git push --set-upstream origin
  return

+#v::
!v::
WinActivate, Google Chrome
return

!x::
WinActivate, Trade Analysis Charting
sleep, 100
send, !{space}n
return

OpenAndSave(x, y)
{
MouseClick, Left, %x%, %y%
WinWaitActive, PRIMU$ - Add/Edit Order Form <NATIVE_ORDERS_ONLY>
sleep 200
MouseClick, Left, 532, 478
sleep 200
}

; open box
^,::
msgbox, control comma
/*
launcher_click_edit_box()
*/
msgbox done
return

; pmo fix
^.::
sleep 200
click_options_tab()
sleep 200
MouseClick, Left, 680, 540
WinWaitActive, PRIMU$ - Add/Edit Order Form <GENERAL>
sleep 200
; change to sell
MouseClick, Left, 191, 93
sleep 200
MouseClick, Left, 191, 122
sleep 200


Loop, 6
{
	OpenAndSave(548, 203 + (A_Index - 1) * 47)
	WinWaitActive, PRIMU$ - Add/Edit Order Form <GENERAL>
}

MouseClick, Left, 529, 479
sleep 200
msgbox, done with pmo
return


; stop fix
^/::
msgbox hello
/*
click_design_tab()
stop_open_existing_order()


MouseClick, Left, 515, 150
sleep 400
MouseClick, Left, 533, 480
sleep 200
click_validate_and_close()
sleep 200
launcher_click_save_box()
*/
msgbox done
return
