#include header.ahk

confirm_basket_manager_is_open()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := activate_and_wait_only("Basket Manager", 1)
  if (res = 0)
    inform("Cannot find basket manager window.")
}

basket_manager_private_tab_selected()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := activate_and_wait_only("Basket Manager", 5)
  if (res = 0)
    inform("basket_manager_private_tab_selected can't activate basket manager")
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  image_path := creds["image_path"] . "private.PNG"
  ImageSearch, ox, oy, 0, 0, 500, 500, %image_path%
  if (ErrorLevel = 0)
    return 1
  return 0
}

click_basket_manager_private_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := activate_and_wait_only("Basket Manager", 5)
  if (res = 0)
    inform("basket_manager_sub_folder_selected can't activate basket manager")
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  image_path := creds["image_path"] . "sub_folder.PNG"
  ImageSearch, ox, oy, 27, 89, 168, 125, %image_path%
  if (ErrorLevel = 0)
    return 1
  return 0
}

click_basket_manager_sub_folder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  MouseClick, Left, 118, 115
  sleep, 200
}



basket_manager_new_basket()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
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
    creds := {}
    load_csv_dictionary("secret.csv", creds)
    image_path := creds["image_path"] . "new_basket_menu.PNG"
    ImageSearch, ox, oy, 0, 0, 700, 500, %image_path%
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  MouseClick, Left, 477, 72
  sleep, 200
}

click_basket_manager_run_filter()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  MouseClick, Left, 545, 70
  sleep, 200
}

open_existing_basket(name)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  click_basket_manager_private_tab()
  sleep, 200
  click_basket_manager_sub_folder()
  sleep, 200
  ; search for the basket
  click_basket_manager_filter_text_box()
  Clipboard := name
  Sleep, 200
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
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := activate_and_wait_only("Basket Manager", 5)
  if (res = 0)
    inform("click_basket_manager_ok_button can't activate basket manager")
  MouseClick, Left, 646, 509
  err := wait_only("PRIMU$ - B", 5)
  if (err != 0)
    inform("click_basket_manager_ok_button can't close basket manager")
}
