#include header.ahk

OpenAndSaveOrder(x, y)
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

convert_to_sniper_stop()
{
  ; check the pmo stop tab opetions tab
  MouseClick, Left, 121, 27
  sleep, 200
  MouseClick, Left, 694, 537
  WinWaitActive, PRIMU$ - Add/Edit Order Form <GENERAL>

  MouseClick, Left, 541, 201 ; first order
  WinWaitActive, PRIMU$ - Add/Edit Order Form <NATIVE_ORDERS_ONLY>
  MouseClick, Left, 372, 62
  sleep, 500
  MouseClick, Left, 306, 134
  sleep, 500
  MouseClick, Left, 237, 274
  send, ^a
  sleep, 200
  send, 10
  MouseClick, Left, 131, 387
  sleep, 200
  MouseClick, Left, 224, 388
  send, ^a
  sleep, 200
  send, 20
  MouseClick, Left, 238, 411
  sleep, 200
  MouseClick, Left, 178, 470 ; execution style normal
  sleep, 200
  MouseClick, Left, 532, 481
  sleep, 500

  MouseClick, Left, 541, 249 ; second order
  WinWaitActive, PRIMU$ - Add/Edit Order Form <NATIVE_ORDERS_ONLY>
  MouseClick, Left, 372, 62
  sleep, 500
  MouseClick, Left, 306, 134
  sleep, 500
  MouseClick, Left, 237, 274
  send, ^a
  sleep, 200
  send, 10
  MouseClick, Left, 131, 387
  sleep, 200
  MouseClick, Left, 224, 388
  send, ^a
  sleep, 200
  send, 20
  MouseClick, Left, 238, 411
  sleep, 200
  MouseClick, Left, 178, 483 ; execution style aggressive
  sleep, 200
  MouseClick, Left, 532, 481
  sleep, 500

  MouseClick, Left, 541, 298 ; third order
  WinWaitActive, PRIMU$ - Add/Edit Order Form <NATIVE_ORDERS_ONLY>
  MouseClick, Left, 372, 62
  sleep, 500
  MouseClick, Left, 306, 134
  sleep, 500
  MouseClick, Left, 237, 274
  send, ^a
  sleep, 200
  send, 10
  MouseClick, Left, 131, 387
  sleep, 200
  MouseClick, Left, 224, 388
  send, ^a
  sleep, 200
  send, 20
  MouseClick, Left, 238, 411
  sleep, 200
  MouseClick, Left, 178, 495 ; execution style very aggressive
  sleep, 200
  MouseClick, Left, 532, 481
  sleep, 500

  WinWaitActive, PRIMU$ - Add/Edit Order Form <GENERAL>
  MouseClick, Left, 530, 480
}

just_click_option_button_and_wait()
{
  MouseClick, Left, 121, 27
  sleep, 200
  inputbox, out, change?
  if (out = "y")
  {
    convert_to_moc()
  }
}

convert_to_moc()
{
  PixelGetColor, OutputVar, 482, 74
  if (OutputVar != "0x000000")
  {
    MouseClick, Left, 482, 74
    sleep, 200
  }
  MouseClick, Left, 175, 164
  sleep, 200
  send, 15:48:30
  sleep, 200
  MouseClick, Left, 175, 185
  sleep, 200
  send, 15:49:00
  sleep, 200
  MouseClick, Left, 175, 236
  sleep, 200
  send, 16:15:00
  sleep, 200

}

copy_pmo_order_in_stop()
{
  MouseClick, Left, 656, 722
  MouseClick, Left, 898, 728
  WinWaitActive, PRIMU$ - Add/Edit Order Form <EXIT_STOP_ORDER>
  MouseClick, Left, 546, 160
  WinWaitActive, PRIMU$ - Add/Edit Order Form <FINAL_STOP_ORDER>
  MouseClick, Left, 514, 151
  sleep, 1000
  MouseClick, Left, 535, 476
  WinWaitActive, PRIMU$ - Add/Edit Order Form <EXIT_STOP_ORDER>
  MouseClick, Left, 522, 479
  sleep, 1000




}

^k::
  copy_pmo_order_in_stop()
  return

check_mark_cancel_replace()
{
  ; open target order
  target_open_existing_order()
  ; click if not clicked function
  cb := [371,426]
  tp := [380,434]
  set_check_box("TRUE", cp, tp)

  msgbox, continue
  ; close order form
  click_order_form_save_button()
}


$RAlt::LButton
return

$RWin::RButton
return

$F1::LButton
return

$F2::RButton
return



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
    send, ^=
  }
  else
    send, !=
  return


$!-::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x
    send, ^-
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

$+Enter::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^e
    sleep, 100
    send, !+{Enter}
    sleep, 100
  }
  else
    send, +{Enter}
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
    send, ^x ; unfocus
    sleep, 200
    send, n
    sleep, 200
    send, w
  }
  else
    send, ^{Left}
  return

$^Right::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^x ; focus
    sleep, 200
    send, n
    sleep, 200
    send, s
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

$!1::
  WinActivate, ahk_exe atom.exe
  return

$^1::
  SetTitleMatchMode, 2
  WinActivate, ahk_exe mstsc.exe,, primus
  return

$!2::
  WinActivate, cmd
  return

$!3:: ; Nirvana Gmail Personal Gmail QS
  SetTitleMatchMode, 2
  WinActivate, Nirvana
  WinActivate, Evernote
  WinActivate, Inbox
  WinActivate, "research"
  WinActivate, [research]
  WinActivate, Mint
  return

$!4:: ; Slack and Whatsapp
  WinActivate, Slack
  WinActivate, WhatsApp
  return

$!5:: ; QSG Hub and Portfolio
  WinActivate, QSG Hub
  WinActivate, BKarjoo Portfolio
  WinActivate, Team Leaders
  return

$!6:: ; multiboxes
  SetTitleMatchMode, 2
  WinActivate, [Longs
  WinActivate, [Shorts
  WinActivate, [double long
  WinActivate, [double short
  return

$!7:: ; think or swim
  WinActivate, ahk_exe thinkorswim.exe
  WinWaitActive, ahk_exe thinkorswim.exe
  MouseClick, Left, 80,94
  send, ^a{Backspace}
  return

$!8:: ; redi
  WinActivate, ahk_class Redi_Message Monitor
  WinActivate, Position-5
  WinActivate, Position-2
  WinActivate, ahk_class Redi_Price Ticker
  WinActivate, ahk_class Redi_Montage Monitor
  return

$!9:: ; excel
  WinActivate, ahk_exe notepad.exe
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

$!0::
$^b:: ; activate blotter and show box stats,
  ;blotter must be active to run its shortcuts, so this will activate it

  WinActivate, Statistic Report
  sleep, 100
  WinActivate, Multi-Day Analysis
  WinActivate, \\tsclient
  WinActivate, D:\Users\
  return

$!b:: ; type branch message
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

$!+c::
  if (WinActive("ahk_exe emacs.exe"))
  {
    send, ^c
    send, ^c
  }
  else
    send, !+c
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
  else if (WinActive("ahk_exe atom.exe"))
  {
    send, ^+k
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
    increment := 20
    x := 200
    r := first_row
    Loop % strategy_count
    {
      MouseClick, Left, %x%, %r%
      Sleep, 200
      MouseClick, Right, %x%, %r%
      Sleep, 1000
      ;kill_pixel := r + 95
      ;MouseClick, Left, 250, %kill_pixel%
      send, {Down 4}{Enter}
      WinWaitActive, Kill Symbol(s)
      Sleep, 200
      Send, ^v
      Sleep, 200
      MouseClick, Left, 379, 239
      Sleep, 200
      r := r + increment
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
    folderY := 225 ; set this
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
      copy_pmo_order_in_stop()

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
  if (WinActive("App - GTDNext!"))
  {
    return
  }
  else if (WinActive("ahk_exe mstsc.exe"))
  {
    quick_inform("debug mode")

    InputBox, box, q, box name
    if (box = "q")
      return
    InputBox, ver, q, version
    if (ver = "q")
      return
    /*
    git_clone(box, ver)
    msgbox, verify clone of %box% %ver%
    compile_code_folder(box)
    msgbox, verify compile of %box%
    */
    f := find_box(box)
    if (f)
      update_box_dynamic_version(box, ver)
    else
      build_local_box_version(box, ver)
    msgbox, backing up %box%
    backup_compiled_files_helper(box, "")
    ;git_commit_bu()
    ;git_push_bu()
    remove_git_dir(box)
    ; email_message("Boxed box " . box . " " . ver . ".", box . " " . ver)
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
  else if (WinActive("cmd"))
  {
    InputBox, out, q, enter message,,,,,,,,%Clipboard%
    if (out = "q")
      return
    script := "git commit -a -m """ . out . """"
    sleep, 100
    send, %script%
    Clipboard := out
  }
  else
    send, !m
  return

$^m:: ;
  if (WinActive("cmd"))
  {
    InputBox, out, q, enter message,,,,,,,,%Clipboard%
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
  else if (WinActive("cmd"))
  {
    send, !n
    WinWaitActive, Create new console
    send, {Enter}
  }
  else if (WinActive("ahk_exe chrome.exe"))
  {
    send, ^t ; this is for a new tab
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
    WinWaitActive, Primu$ 7.
    MouseClick, Left, 82, 51
    WinWaitActive, Open BlackBox
    MouseClick, Left, 108, 277
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
  else if (WinActive("ahk_exe Redi.exe"))
  {
    WinActivate, Message ; assumes only one message monitor is open
    WinWaitActive, Message
    ; click order tab
    MouseClick, Left, 95, 59
    sleep, 200
    ; make sure symbol is clear
    MouseClick, Left, 282, 30
    sleep, 200
    Send, {Backspace 6}
    sleep, 200
    ; click export
    MouseClick, Left, 436, 30
    WinWaitActive, ahk_exe EXCEL.EXE
    sleep, 2000
    ; excel saves as csv
    MouseClick, Left, 28, 38
    sleep, 500
    ; click save as
    MouseClick, Left, 64, 99
    WinWaitActive, Save As
    sleep, 200
    ; chose correct folder
    MouseClick, Left, 75, 258
    sleep, 200
    ; chose csv
    MouseClick, Left, 345, 756
    sleep, 200
    send, {Down 14}
    send, {Enter}
    sleep, 200
    MouseClick, Left, 320, 731
    sleep, 200
    ; name the save as file
    FormatTime, n,, yyMMd
    save_as := "redi_orders_" . n
    send, %save_as%
    ; click save button
    MouseClick, Left, 625, 838
    WinWaitActive, Microsoft Excel
    sleep, 200
    send, {Space}
    ; close excel
    ; click file tab
    MouseClick, Left, 30, 36
    sleep, 200
    MouseClick, Left, 56, 438
    sleep, 200
    Send, {Tab}
    sleep, 200
    Send, {Space}
  }
  else if (WinActive("ahk_exe mstsc.exe"))
  {
    WinWaitActive, PRIMU$ - Positions / Orders / Executions (Primus)
    MouseClick, Left, 241, 112
    sleep, 200
    send, ^a
    sleep, 200
    send, ^c
    ; open excel
    Send, {LWin}
    sleep, 200
    Send, excel
    sleep, 200
    Send, {Enter}
    WinWaitActive, Microsoft Excel
    Sleep, 200
    send, ^v
    Sleep, 200
    ; save sheet
    ; excel saves as csv
    MouseClick, Left, 28, 38
    sleep, 500
    ; click save as
    MouseClick, Left, 64, 99
    WinWaitActive, Save As
    sleep, 200
    ; chose correct folder
    MouseClick, Left, 75, 281
    sleep, 200
    ; chose csv
    MouseClick, Left, 345, 756
    sleep, 200
    send, {Down 14}
    send, {Enter}
    sleep, 200
    MouseClick, Left, 320, 731
    sleep, 200
    ; name the save as file
    InputBox, out, question, "Short side? (y/n/q)"
    if (out = "q")
      return
    side := "shorts_"

    if (out != "y")
      side := "longs_"
    FormatTime, n,, yyMMd
    save_as := "primus_orders_" . side . n
    WinWaitActive, Save As
    Sleep, 200
    send, %save_as%
    ; click save button
    MouseClick, Left, 625, 838
    WinWaitActive, Microsoft Excel
    sleep, 200
    send, {Space}
    sleep, 200
    send, {Space}
    ; close excel
    ; click file tab
    MouseClick, Left, 30, 36
    sleep, 200
    MouseClick, Left, 56, 438
    sleep, 200
    Send, {Tab}
    sleep, 200
    Send, {Space}
    Msgbox, done
  }
  else if (WinActive("ahk_exe atom.exe"))
  {
    send, ^s
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

:*:ttt::
  FormatTime, Time, , hh:mm:ss
  SendInput, %Time%
  Return

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

$^v::
  keywait Control
  MouseClick, Left
  sleep, 100

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

$!+z::
  if (WinActive("ahk_exe atom.exe"))
  {
    send, ^y
  }
  else
    send, !+z
  return
