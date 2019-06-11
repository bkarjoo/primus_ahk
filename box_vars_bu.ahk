; general options --------------------------------------------------------------
box_name_bu = Any Name
black_box_description_bu = some description
black_box_side_bu = LONG
black_box_scheme_bu = OPG
enter_on_last_bu = TRUE
enter_on_bid_bu = FALSE
enter_on_ask_bu = FALSE
enter_on_pmi_bu = FALSE
enter_on_imbalance_bu = FALSE
enter_on_snapshot_bu = FALSE
enter_on_new_minute_bu = FALSE
enter_on_stock_event_bu = FALSE
enable_stop_trailing_on_new_second_bu = FALSE
verify_code_during_validate_procedure_bu = FALSE

; time options------------------------------------------------------------------
use_time_options_bu = TRUE
start_subscription_bu = 9:21:00
start_entering_positions_bu = 9:30:00
stop_entering_positions_bu = 3:58:00
cancel_all_pending_orders_bu = 3:58:30
close_all_open_positions_bu = 3:59:00
place_OPG_orders_bu = 9:27:00

; position sizing---------------------------------------------------------------
use_strict_mode_bu = TRUE
enable_position_sizing_scheme_bu = TRUE
enable_black_box_risk_management_bu = TRUE
maximum_order_shares_bu = 2000
position_sizing_bu =
(

)

; basket------------------------------------------------------------------------
basket_name_bu = some name
basket_description_bu = ''
activate_dynamic_basket_rules_bu = TRUE
apply_dynamic_basket_rules_to_all_available_symbols_bu = TRUE
basket_rules_bu =
(

)
basket_symbols_bu =
(

)
basket_exclude_bu =
(

)
basket_htb_bu =
(

)

; entry-------------------------------------------------------------------------
entry_trigger_bu =
(

)
entry_order_type_bu = LIMIT
entry_order_side_bu = BUY
entry_destination_bu = CSFB
entry_size_bu = 100
entry_tif_bu = TIF_DAY
entry_tif_seconds_bu = ''
entry_order_limit_bu =
(

)
entry_aggregated_TIF_bu = FALSE
entry_calculate_limit_during_placement_bu = TRUE
entry_tif2_bu = SECONDS
entry_tif2_seconds_bu = 30
entry_order_stop_bu =
(

)

; target------------------------------------------------------------------------
target_order_type_bu = PRIMUS_AEL
target_order_side_bu = BUY
target_destination_bu = CSFB
target_size_bu = 100
target_limit_bu =
(

)
ael_on_last_bu = FALSE
ael_on_second_bu = TRUE
ael_on_bid_ask_bu = FALSE
ael_convert_to_stop_bu = FALSE
ael_trigger_bu =
(

)
ael_price_bu =
(

)
ael_time_increment_bu =
(

)
ael_price_increment_bu =
(

)


; stop--------------------------------------------------------------------------
stop_order_type_bu = PRIMUS_STOP
stop_order_side_bu = BUY
stop_size_bu = 100
stop_price_bu =
(

)
enable_trailing_bu = FALSE
trail_after_entry_complete_bu = TRUE
trail_once_bu = FALSE
trail_trigger_bu =
(

)
trail_how_bu =
(

)
trail_increment_bu =
(

)

; launch rules------------------------------------------------------------------
launch_rules_bu =
(

)
