; general options --------------------------------------------------------------
box_name = Any Name
box_acronym = xyz
black_box_description = some description
black_box_side = LONG
black_box_scheme = OPG
enter_on_last = TRUE
enter_on_bid = FALSE
enter_on_ask = FALSE
enter_on_pmi = FALSE
enter_on_imbalance = FALSE
enter_on_snapshot = FALSE
enter_on_new_minute = FALSE
enter_on_stock_event = FALSE
enable_stop_trailing_on_new_second = FALSE
verify_code_during_validate_procedure = FALSE

; time options------------------------------------------------------------------
use_time_options = TRUE
start_subscription = 9:21:00
start_entering_positions = 9:30:00
stop_entering_positions = 3:58:00
cancel_all_pending_orders = 3:58:30
close_all_open_positions = 3:59:00
place_OPG_orders = 9:27:00

; position sizing---------------------------------------------------------------
use_strict_mode = TRUE
enable_position_sizing_scheme = TRUE
enable_black_box_risk_management = TRUE
maximum_order_shares = 2000
position_sizing =
(

)

; basket------------------------------------------------------------------------
basket_name = some name
basket_description = ''
activate_dynamic_basket_rules = TRUE
apply_dynamic_basket_rules_to_all_available_symbols = TRUE
basket_rules =
(

)
basket_symbols =
(

)
basket_exclude =
(

)
basket_htb =
(

)

; entry-------------------------------------------------------------------------
entry_trigger =
(

)
entry_order_type = LIMIT
entry_order_side = BUY
entry_destination = CSFB
entry_size = 100
entry_tif = TIF_DAY
entry_tif_seconds = ''
entry_order_limit =
(

)
entry_aggregated_TIF = FALSE
entry_calculate_limit_during_placement = TRUE
entry_tif2 = SECONDS
entry_tif2_seconds = 30
entry_order_stop =
(

)

; target------------------------------------------------------------------------
target_order_type = PRIMUS_AEL
target_order_side = BUY
target_destination = CSFB
target_size = 100
target_limit =
(

)
ael_on_last = FALSE
ael_on_second = TRUE
ael_on_bid_ask = FALSE
ael_convert_to_stop = FALSE
ael_trigger =
(

)
ael_price =
(

)
ael_time_increment =
(

)
ael_price_increment =
(

)


; stop--------------------------------------------------------------------------
stop_order_type = PRIMUS_STOP
stop_order_side = BUY
stop_size = 100
stop_price =
(

)
enable_trailing = FALSE
trail_after_entry_complete = TRUE
trail_once = FALSE
trail_trigger =
(

)
trail_how =
(

)
trail_increment =
(

)

; launch rules------------------------------------------------------------------
enable_black_box_launch_rule = TRUE
launch_rules =
(

)
