
ActivateLauncher()
{
  If WinExist("Primu$ 7")
    and !WinActive("Primu$ 7")
    and !WinExist("PRIMU$ - Black Box Design")
    {
      WinActivate, Primu$ 7
    }
  else
    MsgBox, Cannot Activate Launcher
}

ClickNewBox()
{
    ActivateLauncher()
    Click 32,41
    WinWait PRIMU$ - Black Box Design
}

ClickOpenBox()
{
  ActivateLauncher()
  Click 83, 54
  WinWait Open BlackBox
}


ClickSaveBox()
{
  ActivateLauncher()
  Click 133, 49
}


ClickSaveAs()
{
  ActivateLauncher()
  Click 189, 49
  WinWait Save BlackBox
}


ClickEditBox()
{
  ActivateLauncher()
  Click 243, 49
  WinWait PRIMU$ - Black Box Design
}


ClickPlay()
{
ActivateLauncher()
Click 303, 49
WinWait BTQ Action
}


ClickGear()
{
ActivateLauncher()
Click 462, 49
}


ClickWrench()
{
ActivateLauncher()
Click 515, 49
WinWait PRIMU$ -- Configuration
}


ClickQueueManager()
{
ActivateLauncher()
Click 576, 49
WinWait PRIMU$ -- Backtesting Queue Manage
}


ClickDiagnostics()
{
ActivateLauncher()
Click 634, 49
; diagnostic window isn't detected
;WinWait PRIMU$ -- Diagnostics Window
}
