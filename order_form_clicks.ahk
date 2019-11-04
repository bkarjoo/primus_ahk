#include black_box_clicks.ahk
#include wait_policy.ahk
#include inform.ahk

click_order_form_save_button()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 530, 480
  err := wait_only("PRIMU$ - Black", 5)
  if (err != 0)
    inform("Control didn't return to Black Box Design after order save.")
}

set_order_form_order_type(type)
{
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
; TODO implement
; confirms correct order type was selected
; in case dev changes order, or program is interrupted during execution
}

set_order_form_order_side(side)
{
  ; acceptable types: BUY, SELL, SHORT
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 190, 90
  sleep, 200
  if (side = "BUY")
    MouseClick, Left, 138,110
  else if (side = "SELL")
    MouseClick, Left, 138,120
  else if (side = "SHORT")
    MouseClick, Left, 138,130
  else {
    msg := "Error order side " . side . " not supported"
    inform(msg)
  }
}

set_order_form_destination(dest)
{
  ; acceptable types: CSFB
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 374, 63
  sleep, 200
  if (dest = "CSFB")
    MouseClick, Left, 322,252
  else {
    msg := "Error order dest " . dest . " not supported"
    inform(msg)
  }
}

; limit order properties -------------------------------------------------------

open_limit_price_expression_builder()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 540, 150
  WinWaitActive, PRIMU$ - Expression Builder
}

open_stop_price_expression_builder()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 540, 240
  WinWaitActive, PRIMU$ - Expression Builder
}



set_order_form_TIF(tif)
{
  ; acceptable types: SECONDS, TIF_OPENING, TIF_DAY
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 199, 307
  sleep, 200
  if (tif = "SECONDS")
    MouseClick, Left, 138,338
  else if (tif = "TIF_OPENING")
    MouseClick, Left, 138,403
  else if (tif = "TIF_DAY")
    MouseClick, Left, 138,456
  else {
    msg := "Error order tif " . tif . " not supported"
    inform(msg)
  }
}

set_order_form_TIF2(tif)
{
  ; acceptable types: SECONDS, TIF_IOC, TIF_DAY
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 465, 330
  sleep, 200
  if (tif = "SECONDS")
    MouseClick, Left, 440, 360
  else if (tif = "TIF_IOC")
    MouseClick, Left, 440, 350
  else if (tif = "TIF_DAY")
    MouseClick, Left, 440, 480
  else {
    msg := "Error order tif " . tif . " not supported"
    inform(msg)
  }
}

set_order_form_TIF_seconds(seconds)
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 243, 308
  sleep, 200
  Send, ^a
  sleep, 200
  Send, %seconds%
}

set_order_form_TIF2_seconds(seconds)
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 507, 332
  sleep, 200
  Send, ^a
  sleep, 200
  Send, %seconds%
}


aggregated_tif_check_box := [310, 290]
calc_lmt_prc_durng_ord_plcmnt_check_box := [318, 343]
is_proactive_check_box := [12, 344]

aggregated_tif_trigger_point := [330, 308]
calc_lmt_prc_durng_ord_plcmnt_trigger_point := [330,356]
is_proactive_trigger_point := [35,357]



; stop order properties --------------------------------------------------------


open_trail_trigger_expression_builder()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 540, 250
  WinWaitActive, PRIMU$ - Expression Builder
}

open_trail_how_expression_builder()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 540, 330
  WinWaitActive, PRIMU$ - Expression Builder
}

open_trail_increment_expression_builder()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 540, 390
  WinWaitActive, PRIMU$ - Expression Builder
}

enable_trailing_check_box := [27,214]
trail_after_entry_complete_check_box := [128,213]
trail_once_check_box := [280, 214]

enable_trailing_trigger_point := [36,221]
trail_after_entry_complete_trigger_point := [138,221]
trail_once_trigger_point := [288,221]


click_common_order_parameters_tab()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 84, 121
  sleep, 500 ; TODO should be image search tab confirm
}

click_primus_stop_order_tab()
{
  wait_activate_if_error("PRIMU$ - Add/Edit Order Form", 2, 2)
  MouseClick, Left, 241, 121
  sleep, 500 ; TODO should be image search tab confirm
}

; TODO implement image search tab confirm for order form

; ael order properties ---------------------------------------------------------


open_ael_trigger_expression_builder()
{
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 160, 2, 2)
if (res = 0)
  inform("open_ael_trigger_expression_builder failed.")
}

open_ael_how_expression_builder()
{
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 200, 2, 2)
if (res = 0)
  inform("open_ael_how_expression_builder failed.")
}

open_ael_time_increment_expression_builder()
{
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 250, 2, 2)
if (res = 0)
  inform("open_ael_time_increment_expression_builder failed.")
}

open_ael_price_increment_expression_builder()
{
res := click_activate_and_wait("PRIMU$ - Add/Edit Order Form", "PRIMU$ - Expression Builder", 540, 300, 2, 2)
if (res = 0)
  inform("open_ael_price_increment_expression_builder failed.")
}

ael_on_last_check_box := [370,330]
ael_on_second_check_box := [472,332]
ael_on_bid_check_box := [370,351]
ael_convert_to_stop_check_box := [373,384]

ael_on_last_trigger_point := [382,344]
ael_on_second_trigger_point := [482,342]
ael_on_bid_trigger_point := [381,363]
ael_convert_to_stop_trigger_point := [382,392]
