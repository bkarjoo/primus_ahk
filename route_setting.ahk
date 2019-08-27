
SetAllRoutes(route_name)
{
  ; precondition: blackbox design is open
  IfWinExist, PRIMU$ - Black Box Design
  {
    WinActivate, PRIMU$ - Black Box Design
    WinWait, PRIMU$ - Black Box Design
  }
  Else
  {
    Msgbox, black box design not open, exiting
    return
  }

  ; select option tab
  Click, Left, 125, 32
  sleep 100

  ; click modify
  Click, Left, 678, 584
  WinWait, PRIMU$ - Add/Edit Order Form

  Click, Left, 311, 62
  sleep, 100
  Send, CSFB
  sleep, 100
  Click, Left, 142, 214
  Send, CSFB
  sleep, 100  
  Click, Left, 524, 477


}

SetAllRoutes("CSFB")
