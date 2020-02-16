#include header.ahk
#a::
!a::
  send, ^a
  return
#c::
!c::
  send, ^c
  return
#f::
!f::
  send, ^f
  return
#n::
!n::
  send, ^n
  return
#s::
!s::
  send, ^s
  return
#v::
!v::
  send, ^v
  return
#w::
!w::
  send, ^w
  return
#x::
!x::
  send, ^x
  return
#z::
!z::
  send, ^z
  return
#b::
!b:: ; activate blotter and show box stats
  WinActivate, \\tsclient
  WinActivate, D:\Users\
  WinActivate, Statistic Report
  sleep, 100
  WinActivate, Multi-Day Analysis
  return


^b:: ; type branch message
  InputBox, out, question, enter branch name
  if (out = "q")
    return
  Clipboard := "git checkout -b " . out
  send, ^v
  return

convert_to_sniper()
{
  ; assumes box is open
  target_open_existing_order()
  sleep, 200
  set_order_form_destination("SNIPER")
  sleep, 200
  click_order_form_save_button()
  sleep, 200
}

^e:: ; opens all the boxes in a folder and then saves, include a function if you need more changes to the boxes
  InputBox, out, question, this will alter live folders (q to quit)
  if (out = "q")
    return
  folderY := 243 ; set this
  box_count := 10 ; set this

  ; don't touch the following vars
  folderX := 138
  boxX := 412
  box_first_row := 81
  boxY := box_first_row
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

    ; set this to what you need to a function that would make box changes desired
    convert_to_sniper()

    click_validate_and_close()
    launcher_click_save_box()
    sleep, 200
    send, {Space}

    boxY := boxY + increment
  }

  msgbox done
  return

#d::
!d:: ; trades and charting
  WinActivate, Execution
  sleep, 100
  WinActivate, Trade -
  sleep, 100
  WinActivate, Trade Analysis Charting
  return

#e::
!e:: ; breakdown and equity curve
  WinActivate, Breakdown
  sleep, 100
  WinActivate, PnL Analysis Charting
  return
#g::
!g:: ; github clone
  InputBox, out, question, enter box name,,,,,,,,%Clipboard%
  if (out = "q")
    return

  Clipboard := "git clone https://github.com/bkarjoo/" . out
  send, ^v

  Clipboard := out
  return
#h::
!h:: ; build or update box
  InputBox, box, q, box name
  if (box = "q")
    return
  InputBox, ver, q, version
  if (ver = "q")
    return
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
  remove_git_dir(box)
  email_message("Boxed box " . box . " " . ver . ".", box . " " . ver)
  return

^h:: ; just open a box, no version check
  InputBox, box, question, Enter the name of the box to open:
  if (box = "q")
    return
  ; find box don't open?

  f := find_box(box)

  click_validate_and_close()
  return

/*
!i:: ; time stamp
  FormatTime, n,, MM/d/yy HH:mm
  send, %n%:
  return
*/
#i::
!i:: ; news viewer
  WinActivate, News Viewer
  return
#j::
!j:: ; job name
  FormatTime, n,, yyMMdHHmm
  send, job%n%.csv
  return

^j:: ; csv
  send, ,2016,1,1,2019,12,2
  return
#k::
!k:: ; run tests on a box
  InputBox, sy, q, start year
  if (sy = "q")
    return
  InputBox, sm, q, start month
  if (sm = "q")
    return
  InputBox, sh, q, start half
  if (sh = "q")
    return
  InputBox, ey, q, end year
  if (ey = "q")
    return
  InputBox, em, q, end month
  if (em = "q")
    return
  InputBox, eh, q, end half
  if (eh = "q")
    return
  run_date_cycle(sy, sm, sh, ey, em, eh)
  return
#l::
!l:: ; filter primus blotter with box name
  InputBox, out, q, Enter box name version
  if (out = "q")
    return
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
  MouseMove, 0, 0
  return
#;::
!;:: ; selects all boxes in blotter
  activate_blotter()
  hour_glass_sleep(200)
  MouseClick, Left, 50, 145
  hour_glass_sleep(200)
  MouseClick, Left, 50, 145
  return
#'::
!':: ; creates a custom blotter
  InputBox, out, q, Enter box name version,,,,,,,,%Clipboard%
  if (out = "q")
    return
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
  return
#/::
!/:: ; filter custom blotters
  InputBox, out, q, Enter box name version,,,,,,,,%Clipboard%
  if (out = "q")
    return
  Clipboard := out
  activate_blotter()
  hour_glass_sleep(200)
  MouseClick, Left, 112, 85
  hour_glass_sleep(200)
  select_custom_blotter(out)
  return
#m::
!m:: ; basket matrix
  WinActivate, Basket Matrix
  return

^m:: ;
  InputBox, out, question, enter message
  if (out = "q")
    return
  Clipboard := "git commit -a -m """ . out . """"
  send, ^v
  return
#o::
!o:: ; launcher
  WinActivate, Primu$ 7.
  return
#p::
!p:: ; pause mechanism
  FileDelete, run_state.txt
  FileAppend, False, run_state.txt
  return

#q::
!q:: ; task queue manager
  WinActivate, Task Queue Manager
  return
#r::
!r:: ; Black Box Report
  WinActivate, Black Box Report
  return


#t::
!t:: ; BlackBox Tree
  WinActivate, BlackBox Tree
  return


#u::
!u:: ; git upstream
  send, git push --set-upstream origin
  return

; w:: ; close window

#y::
!y:: ; remove dir from primus ahk
  InputBox, out, question, Please enter box name to remove
  if (out = "q")
    return
  remove_git_dir(out)
  msgbox done
  return

OpenAndSave(x, y)
{
  MouseClick, Left, %x%, %y%
  WinWaitActive, PRIMU$ - Add/Edit Order Form <NATIVE_ORDERS_ONLY>
  sleep 200
  MouseClick, Left, 532, 478
  sleep 200
}
#,::
^,:: ; open box TODO build
  msgbox, control comma
  /*
  launcher_click_edit_box()
  */
  msgbox done
  return
#.::
^.:: ; pmo fix
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

^/:: ; stop fix
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
