#include wait_policy.ahk

activate_blotter()
{
   WinActivate, D:\Users\
   WinWaitActive, D:\Users\
}

click_custom_blotter_tab()
{
   activate_blotter()
   MouseClick, Left, 114, 85 
}

click_primus_blotter_tab()
{
   activate_blotter()
   MouseClick, Left, 190, 85
}




msgbox, done