
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
  sleep, 500
}

click_basket_manager_ok_button()
{
  MouseClick, Left, 646, 509
  sleep, 200
}
