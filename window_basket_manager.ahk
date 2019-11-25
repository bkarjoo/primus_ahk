#include wait_policy.ahk
#include inform.ahk

confirm_basket_manager_is_open()
{
  res := activate_and_wait_only("Basket Manager", 1)
  if (res = 0)
    inform("Cannot find basket manager window.")
}

basket_manager_private_tab_selected()
{
res := activate_and_wait_only("Basket Manager", 5)
if (res = 0)
  inform("basket_manager_private_tab_selected can't activate basket manager")
ImageSearch, ox, oy, 0, 0, 500, 500, images/private.PNG
if (ErrorLevel = 0)
  return 1
return 0
}

click_basket_manager_private_tab()
{
  res := activate_and_wait_only("Basket Manager", 5)
  if (res = 0)
    inform("click_basket_manager_private_tab can't activate basket manager")
  MouseClick, Left, 79, 44
  Loop, 10
  {
    sleep, 100
    if (basket_manager_private_tab_selected() = 1)
      return 1
    send, {Tab}
  }
  return 0
}

basket_manager_sub_folder_selected()
{
res := activate_and_wait_only("Basket Manager", 5)
if (res = 0)
  inform("basket_manager_sub_folder_selected can't activate basket manager")
ImageSearch, ox, oy, 27, 89, 168, 125, images/sub_folder.PNG
if (ErrorLevel = 0)
  return 1
return 0
}

click_basket_manager_sub_folder()
{
  MouseClick, Left, 118, 115
  sleep, 200
}



basket_manager_new_basket()
{
  res := activate_and_wait_only("Basket Manager", 1)
  if (res := 0)
    inform("basket_manager_new_basket can't activate Basket Manager")
  click_basket_manager_sub_folder()
  res := basket_manager_sub_folder_selected()
  if (res := 0)
    inform("basket_manager_new_basket couldn't select subfolder")
  MouseClick, Right, 320, 115
  Loop, 50
  {
    sleep, 100
    ImageSearch, ox, oy, 0, 0, 700, 500, images/new_basket_menu.PNG
    if (ErrorLevel = 0)
      break
  }
  if (ErrorLevel != 0)
    inform("basket_manager_new_basket couldn't activate context menu")
  MouseClick, Left, 405, 127
  Sleep, 1000
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

open_existing_basket(name)
{
  click_basket_manager_private_tab()
  sleep, 200
  click_basket_manager_sub_folder()
  sleep, 200
  ; search for the basket
  click_basket_manager_filter_text_box()
  Clipboard := name
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
  res := activate_and_wait_only("Basket Manager", 5)
  if (res = 0)
    inform("click_basket_manager_ok_button can't activate basket manager")
  MouseClick, Left, 646, 509
  err := wait_only("PRIMU$ - B", 5)
  if (err != 0)
    inform("click_basket_manager_ok_button can't close basket manager")
}
