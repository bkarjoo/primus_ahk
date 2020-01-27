#include wait_policy.ahk
#include inform.ahk
#include logger.ahk

click_order_form_save_button()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Black", 530, 480, 2, 1)
  if (res = 0)
    inform("click_order_form_save_button failed.")
}

set_order_form_order_type(type)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; acceptable types: LIMIT, STOP_LIMIT, PRIMUS_STOP, PRIMUS_AEL
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 190, 64
  sleep, 200
  if (type = "LIMIT")
    MouseClick, Left, 138,83
  else if (type = "STOP_LIMIT")
    MouseClick, Left, 138,108
  else if (type = "PRIMUS_STOP")
    MouseClick, Left, 138,145
  else if (type = "PRIMUS_AEL")
    MouseClick, Left, 138,156
  else {
    msg := type . " not supported order type."
    inform(msg)
  }
}

confirm_order_type(type)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
; TODO implement
; confirms correct order type was selected
; in case dev changes order, or program is interrupted during execution
}

set_order_form_order_side(side)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; acceptable types: BUY, SELL, SHORT
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 190, 90
  sleep, 200
  if (side = "BUY")
    MouseClick, Left, 138,110
  else if (side = "SELL")
    MouseClick, Left, 138,120
  else if (side = "SHORT")
    MouseClick, Left, 138,135
  else {
    msg := "Error order side " . side . " not supported"
    inform(msg)
  }
}

set_order_form_destination(dest)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; acceptable types: CSFB
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 374, 63
  sleep, 200
  if (dest = "CSFB" or dest = "PATHFINDER")
    MouseClick, Left, 322,121
  else if (dest = "BLAST")
    MouseClick, Left, 322,94
  else if (dest = "CROSSFINDER")
    MouseClick, Left, 322,107
  else if (dest = "SNIPER")
    MouseClick, Left, 322,133
  else if (dest = "CUSTOM4")
    MouseClick, Left, 322,146
  else {
    msg := "Error order dest " . dest . " not supported"
    inform(msg)
  }
}

; limit order properties -------------------------------------------------------

open_limit_price_expression_builder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 150, 2, 2)
  if (res = 0)
    inform("open_limit_price_expression_builder failed.")
}

open_stop_price_expression_builder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 220, 2, 2)
  if (res = 0)
    inform("open_stop_price_expression_builder failed.")
}

set_order_form_TIF(tif)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; acceptable types: SECONDS, TIF_OPENING, TIF_DAY
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 199, 275
  sleep, 200
  if (tif = "SECONDS")
    MouseClick, Left, 138,310
  else if (tif = "TIF_OPENING")
    MouseClick, Left, 138,321
  else if (tif = "TIF_DAY")
    MouseClick, Left, 138,347
  else if (tif = "TIF_IOC")
    MouseClick, Left, 138,296
  else if (tif = "TIF_ON_CLOSE")
    MouseClick, Left, 138,333
  else {
    msg := "Error order tif " . tif . " not supported"
    inform(msg)
  }
}

set_order_form_TIF2(tif)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ; acceptable types: SECONDS, TIF_IOC, TIF_DAY
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 465, 300
  sleep, 200
  if (tif = "SECONDS")
    MouseClick, Left, 440, 333
  else if (tif = "TIF_IOC")
    MouseClick, Left, 440, 320
  else if (tif = "TIF_DAY")
    MouseClick, Left, 440, 373
  else if (tif = "TIF_ON_CLOSE")
    MouseClick, Left, 138,359
  else if (tif = "TIF_OPENING")
    MouseClick, Left, 138,347
  else {
    msg := "Error order tif " . tif . " not supported"
    inform(msg)
  }
}

set_order_form_TIF_seconds(seconds)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 243, 276
  sleep, 200
  Send, ^a
  sleep, 200
  Send, %seconds%
}

set_order_form_TIF2_seconds(seconds)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 507, 300
  sleep, 200
  Send, ^a
  sleep, 200
  Send, %seconds%
}




; stop order properties --------------------------------------------------------

open_trail_trigger_expression_builder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 250, 2, 2)
  if (res = 0)
    inform("open_trail_trigger_expression_builder failed.")
}

open_trail_how_expression_builder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 330, 2, 2)
  if (res = 0)
    inform("open_trail_how_expression_builder failed.")
}

open_trail_increment_expression_builder()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 390, 2, 2)
  if (res = 0)
    inform("open_trail_increment_expression_builder failed.")
}




click_common_order_parameters_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 84, 121
  sleep, 500 ; TODO should be image search tab confirm
}

click_primus_stop_order_tab()
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 241, 121
  sleep, 500 ; TODO should be image search tab confirm
}

; TODO implement image search tab confirm for order form

; ael order properties ---------------------------------------------------------


open_ael_trigger_expression_builder()
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 160, 2, 2)
if (res = 0)
  inform("open_ael_trigger_expression_builder failed.")
}

open_ael_how_expression_builder()
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 200, 2, 2)
if (res = 0)
  inform("open_ael_how_expression_builder failed.")
}

open_ael_time_increment_expression_builder()
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 250, 2, 2)
if (res = 0)
  inform("open_ael_time_increment_expression_builder failed.")
}

open_ael_price_increment_expression_builder()
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 300, 2, 2)
if (res = 0)
  inform("open_ael_price_increment_expression_builder failed.")
}

get_order_form_check_boxes(checkboxes)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  checkboxes["aggregated_tif_check_box"] := [310, 359]
  checkboxes["calc_lmt_prc_durng_ord_plcmnt_check_box"] := [12, 288]
  checkboxes["is_proactive_check_box"] := [12, 311]

  checkboxes["aggregated_tif_trigger_point"] := [330, 277]
  checkboxes["calc_lmt_prc_durng_ord_plcmnt_trigger_point"] := [35,301]
  checkboxes["is_proactive_trigger_point"] := [35,324]

  checkboxes["enable_trailing_check_box"] := [27,214]
  checkboxes["trail_after_entry_complete_check_box"] := [128,213]
  checkboxes["trail_once_check_box"] := [280, 214]
  checkboxes["enable_trailing_trigger_point"] := [36,221]
  checkboxes["trail_after_entry_complete_trigger_point"] := [138,221]
  checkboxes["trail_once_trigger_point"] := [288,221]

  checkboxes["ael_on_last_check_box"] := [370,330]
  checkboxes["ael_on_second_check_box"] := [472,332]
  checkboxes["ael_on_bid_check_box"] := [370,351]
  checkboxes["ael_convert_to_stop_check_box"] := [373,384]
  checkboxes["ael_on_last_trigger_point"] := [382,344]
  checkboxes["ael_on_second_trigger_point"] := [482,342]
  checkboxes["ael_on_bid_trigger_point"] := [381,363]
  checkboxes["ael_convert_to_stop_trigger_point"] := [382,392]
}
