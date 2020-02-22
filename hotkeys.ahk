#include header.ahk

OpenAndSave(x, y)
{
  MouseClick, Left, %x%, %y%
  WinWaitActive, PRIMU$ - Add/Edit Order Form <NATIVE_ORDERS_ONLY>
  sleep 200
  MouseClick, Left, 532, 478
  sleep 200
}

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



$!/::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^c
    send, /
    send, m ; search
  }
  else if (WinActive("ahk_exe mstsc.exe"))
  {
    InputBox, out, q, Enter box name version,,,,,,,,%Clipboard%
    if (out = "q")
      return
    Clipboard := out
    activate_blotter()
    hour_glass_sleep(200)
    MouseClick, Left, 112, 85
    hour_glass_sleep(200)
    select_custom_blotter(out)
  }
  else
    send, !/
  return

$!+/::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !x
    sleep, 100
    send, org-agenda-remove-restriction-lock{Enter}
    sleep, 100
    send, !x
    sleep, 100
    send, org-remove-occur-highlights{Enter}
    sleep, 100
    send, !x
    sleep, 100
    send, widen{Enter}
  }
  else
    send, !+/
  return

$!;:: ; selects all boxes in blotter
  if (WinActive("ahk_exe mstsc.exe"))
  {
    activate_blotter()
    hour_glass_sleep(200)
    MouseClick, Left, 50, 145
    hour_glass_sleep(200)
    MouseClick, Left, 50, 145
  }
  else
    send, !;
  return

$!':: ; creates a custom blotter
  if (WinActive("ahk_exe mstsc.exe"))
  {
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
  }
  else
    send, !'
  return

$!=::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    send, n
    send, s
  }
  else
    send, !=
  return


$!-::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    send, n
    send, w
  }
  else
    send, !-
  return


$!`::
  if(WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe atom.exe"))
    Send, ^{Tab}
  else if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    sleep, 100
    send, b
    sleep, 100
    send, {Enter}
  }
  else
    send, !``
  return


$^Down::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !> ; end of document
  }
  else
    send, ^{Down}
  return

$!Enter::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^e
    sleep, 100
    send, !{Enter}
  }
  else
    send, !{Enter}
  return

$!Escape::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^g ; quit command
  }
  else
    send, !{Esc}
  return


$^Left::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !b  ; backward word by word
  }
  else
    send, ^{Left}
  return

$^Right::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !f ; end
  }
  else
    send, ^{Right}
  return

$!Space::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^{Space} ; pegs the cursor to position for selecting texts
  }
  else
    send, !{Space}
  return


$^Up::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !< ; begining of doc
  }
  else
    send, ^{Up}
  return

$!1:: ;
  WinActivate, ahk_exe atom.exe
  return

$!2:: ; cmd
  WinActivate, cmd
  return

$!3:: ; cmd
  WinActivate, ahk_exe emacs.exe
  return

$!4:: ; workflowy notes
  WinActivate, ahk_exe chrome.exe
  return

$!5:: ; vnc
  WinActivate, DELL (DESKTOP-KNTE5U6) - VNC Viewer
  return

$!6::
  WinActivate, DESKTOP-VBBA1D4 (DESKTOP-VBBA1D4) - VNC Viewer
  return

$!7:: ;
  return

$!8:: ;
  return

$!a::
  send, ^a
  return

$!+a::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !x
    sleep, 10
    send, org-agenda
    sleep, 10
    send, {Enter}
    sleep, 10
    send, a
  }
  else
    send, !+a
  return

$!b:: ; activate blotter and show box stats,
  ;blotter must be active to run its shortcuts, so this will activate it
  WinActivate, \\tsclient
  WinActivate, D:\Users\
  WinActivate, Statistic Report
  sleep, 100
  WinActivate, Multi-Day Analysis
  send, !b
  return

$^b:: ; type branch message
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    sleep, 100
    send, ^b ; show buffer
  }
  else if (WinActive("cmd"))
  {
    InputBox, out, question, enter branch name
    if (out = "q")
      return
    out := "git checkout -b " . out
    send, %out%
  }
  else
    send, ^b
  return

$!c::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !w
  }
  else
    send, ^c
  return

$!d::
  if (WinActive("ahk_exe mstsc.exe"))
  {
    WinActivate, Execution
    sleep, 100
    WinActivate, Trade -
    sleep, 100
    WinActivate, Trade Analysis Charting
  }
  else if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^k ; kill from curser to end of line
  }
  else
    send, !d
  return

$!+d::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^e{Enter}
    sleep, 10
    send, ** TODO{Space}
  }
  else
    send, !+d
  return

$^d:: ; merger dnt (will have to change when you add new boxes)
  if (WinActive("Primu$ MB"))
  {
    strategy_count := 19
    Clipboard := StrReplace(Clipboard, "`r", " ")
    Clipboard := StrReplace(Clipboard, "`n", " ")
    SetTitleMatchMode, 2
    WinActivate,  [Shorts 200123]
    first_row := 135
    last_row := 499
    row_count := strategy_count - 1
    increment := (last_row - first_row) / row_count
    x := 200
    Loop % row_count + 1
    {
      y := first_row + (A_Index - 1) * increment
      MouseClick, Left, x, y
      Sleep, 200
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
  }
  else
    send, ^d
  return

$!e::
  if (WinActive("ahk_exe mstsc.exe"))
  {
    WinActivate, Breakdown
    sleep, 100
    WinActivate, PnL Analysis Charting
  }
  else
    send, !e
  return

$^e::
  if (WinActive("ahk_exe mstsc.exe"))
  {
    ; opens all the boxes in a folder and then saves, include a function if you need more changes to the boxes
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
  }
  else
    send, ^e
  return

$!f::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^s ; forward search
  }
  else
    send, ^f
  return

$^f::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^r ; reverse search
  }
  else
    send, ^f
  return

$!g:: ; github clone
  if (WinActive("cmd"))
  {
    InputBox, out, question, enter box name,,,,,,,,%Clipboard%
    if (out = "q")
      return

    script := "git clone https://github.com/bkarjoo/" . out
    send, %script%

    Clipboard := out ; usually needed for next step
  }
  else
    send, !g
  return

$!h::
  if (WinActive("ahk_exe mstsc.exe"))
  {
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
  }
  else if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^c
    sleep, 100
    send, ^c ; tag
  }
  else
    send, !h
  return

$^h::
  if (WinActive("ahk_exe mstsc.exe"))
  {
    InputBox, box, question, Enter the name of the box to open:
    if (box = "q")
      return
    ; find box don't open?

    f := find_box(box)

    click_validate_and_close()
  }
  else
    send, ^h
  return

$!i:: ; time stamp
  FormatTime, n,, HH:mm
  if (WinActive("ahk_exe atom.exe"))
  {
    send, %n%
  }
  else if (WinActive("ahk_exe mstsc.exe"))
  {
    WinActivate, News Viewer
  }
  else if (WinActive("ahk_exe emacs.exe"))
  {
    send, %n%
  }
  else if (WinActive("cmd"))
  {
    send, %n%
  }
  else
    send, !i
  return

$!j:: ; job name
  if (WinActive("ahk_exe atom.exe"))
  {
    FormatTime, n,, yyMMdHHmm
    Clipboard := "job" . n . ".csv"
    ;send, job%n%.csv
    send, ^v
  }
  else
    send, !j
  return

$^j:: ; csv
  if (WinActive("ahk_exe atom.exe"))
  {
    send, ,2016,1,1,2019,12,2
  }
  else
    send, ^j
  return

$!k::
  if (WinActive("ahk_exe mstsc.exe"))
  {
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
  }
  else
    send, !k
  return

$!l::
  if (WinActive("ahk_exe mstsc.exe"))
  {
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
  }
  else
    send, !l
  return

$!m:: ; basket matrix
  if (WinActive("ahk_exe mstsc.exe"))
  {
    WinActivate, Basket Matrix
  }
  else
    send, !M
  return

$^m:: ;
  if (WinActive("cmd"))
  {
    InputBox, out, question, enter message
    if (out = "q")
      return
    script := "git commit -a -m """ . out . """"
    sleep, 100
    send, %script%
    Clipboard := out
  }
  else
    send, ^m
  return

$!n::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^n ; down
  }
  else
    send, ^n
  return

$!o::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    sleep, 100
    send, ^f ; open file
  }
  else if (WinActive("ahk_exe mstsc.exe"))
  {
    WinActivate, Primu$ 7.
  }
  else
    send, !o
  return

$!+o::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    sleep, 10
    send, o ; open file
  }
  else if (WinActive("ahk_exe mstsc.exe"))
  {
    WinActivate, Primu$ 7.
  }
  else
    send, !+o
  return

$!p::
  if (WinActive("ahk_exe mstsc.exe"))
  {
    FileDelete, run_state.txt
    FileAppend, False, run_state.txt
  }
  else
    send, !p
  return


$+!p::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, !x
  }
  else
    send, +!p
  return

$!q::
  if (WinActive("ahk_exe mstsc.exe"))
  {
    WinActivate, Task Queue Manager
  }
  else
    send, !q
  return

$!+q::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    sleep, 100
    send, ^c
  }
  else
    send, !+q
  return

$!r::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^a
    sleep, 100
    send, !<
    sleep, 100
    send, +{Tab}
  }
  else if (WinActive("ahk_exe mstsc.exe"))
    WinActivate, Black Box Report
  else
    send, !r
  return

$!s::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    sleep, 100
    send, ^s ; save
  }
  else
    send, ^s
  return

$!+s::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^c
    sleep, 100
    send, ^s ; allow adding a schedule
  }
  else
    send, !+s
  return

$!t::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^c
    sleep, 100
    send, ^t
  }
  else if (WinActive("ahk_exe chrome.exe"))
  {
    send, ^t ; this is for a new tab
  }
  else if (WinActive("ahk_exe mstsc.exe"))
    WinActivate, BlackBox Tree
  else
    send, !t
  return

$!u:: ; git upstream
  if (WinActive("cmd"))
  {
    InputBox, out, question, enter version
    if (out = "q")
      return
    out := "git push --set-upstream origin " . out
    send, %out%
  }
  else if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^p
  }
  else
    send, !u
  return

$!v::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^y
  }
  else
    send, ^v
  return

$!w::
  send, ^w
  return

$!x::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^w
  }
  else
    send, ^x
  return

$+!x::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
  }
  else
    send, +!x
  return

$!y::
  if (WinActive("ahk_exe mstsc.exe"))
  {
    InputBox, out, question, Please enter box name to remove
    if (out = "q")
      return
    remove_git_dir(out)
    msgbox done
  }
  else
    send, !y
  return


$!z::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^/
  }
  else
    send, ^z
  return
