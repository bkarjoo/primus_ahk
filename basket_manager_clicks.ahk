
click_basket_manager_private_tab()
{
  MouseClick, Left, 79, 44
  sleep, 200
}

click_basket_manager_sub_folder()
{
  MouseClick, Left, 118, 115
  sleep, 200
}

create_new_basket()
{
  click_basket_manager_private_tab()
  sleep, 200
  click_basket_manager_sub_folder()
  MouseClick, Right, 320, 115
  sleep, 200
  MouseClick, Left, 405, 127
  sleep, 1000
}

click_basket_manager_filter_text_box()
{
  MouseClick, Left, 477, 72
  sleep, 200
}

click_basket_manager_run_filter()
{
  MouseClick, Left, 545, 70
  sleep, 200
}

open_existing_basket(acronym)
{
  click_basket_manager_private_tab()
  sleep, 200
  click_basket_manager_sub_folder()
  sleep, 200
  ; search for the basket
  click_basket_manager_filter_text_box()
  Clipboard := acronym
  Send, ^v
  Sleep, 200
  click_basket_manager_run_filter()
  Sleep, 200
  ; --------------------
  MouseClick, Right, 320, 115
  sleep, 200
  MouseClick, Left, 405, 147
  sleep, 1000
}

click_basket_manager_ok_button()
{
  WinActivate, Basket Manager
  WinWait, Basket Manager
  MouseClick, Left, 646, 509
  sleep, 200
}
