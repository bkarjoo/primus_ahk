#include "../etc/function"
box_name = Any Name
black_box_description = some description
black_box_side = LONG
black_box_scheme = OPG
enter_on_last = TRUE
enter_on_bid = FALSE
enter_on_ask = FALSE
enter_on_snapshot = FALSE
enter_on_new_minute = FALSE
enable_stop_trailing_on_new_second = FALSE

; time options----------------------------------------------------------------------
use_time_options = TRUE
start_subscription = 9:21:00
start_entering_positions = 9:30:00
stop_entering_positions = 3:58:00
cancel_all_pending_orders = 3:58:30
close_all_open_positions = 3:59:00
place_OPG_orders = 9:27:00

; position sizing----------------------------------------------------------------------
use_strict_mode = TRUE
enable_position_sizing_scheme = TRUE
enable_black_box_risk_management = TRUE
maximum_order_shares = 2000
position_sizing =
{
  IF(IF(10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26')<2000 / AvgDailyRange(ALL_VENUES, 20, NO),10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26'),2000 / AvgDailyRange(ALL_VENUES, 20, NO))<IF(AvgDayVolume(ALL_VENUES, 20, NO) / 1000<0.10 * AvgOpenPrintSize(20),AvgDayVolume(ALL_VENUES, 20, NO) / 1000,0.10 * AvgOpenPrintSize(20)),IF(10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26')<2000 / AvgDailyRange(ALL_VENUES, 20, NO),10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26'),2000 / AvgDailyRange(ALL_VENUES, 20, NO)),IF(AvgDayVolume(ALL_VENUES, 20, NO) / 1000<0.10 * AvgOpenPrintSize(20),AvgDayVolume(ALL_VENUES, 20, NO) / 1000,0.10 * AvgOpenPrintSize(20)))
}

; basket----------------------------------------------------------------------
basket_name = some name
basket_description = ''
activate_dynamic_basket_rules = TRUE
apply_dynamic_basket_rules_to_all_available_symbols = TRUE
basket_rules =
{
  AvgDayVolume(ALL_VENUES, 20, NO) > 300000
  AND DayVolume(ALL_VENUES, 1, P1, NO) > 250000 AND DayVolume(ALL_VENUES, 1, P2, NO) > 250000 AND DayVolume(ALL_VENUES, 1, P3, NO) > 250000 AND DayVolume(ALL_VENUES, 1, P4, NO) > 250000 AND DayVolume(ALL_VENUES, 1, P5, NO) > 250000
  AND AvgDailyRange(ALL_VENUES, 20, NO) > 1
  AND (DayHigh(ALL_VENUES,1,P1,NO) - DayLow(ALL_VENUES,1,P1,NO)) > 0.50 AND (DayHigh(ALL_VENUES,1,P2,NO) - DayLow(ALL_VENUES,1,P2,NO)) > 0.50 AND (DayHigh(ALL_VENUES,1,P3,NO) - DayLow(ALL_VENUES,1,P3,NO)) > 0.50 AND (DayHigh(ALL_VENUES,1,P4,NO) - DayLow(ALL_VENUES,1,P4,NO)) > 0.50 AND (DayHigh(ALL_VENUES,1,P5,NO) - DayLow(ALL_VENUES,1,P5,NO)) > 0.50
  AND (EarningsNewsEvent(News_Current,ACBO,True,Any) OR Source3(News_Current, ACBO, AnySentiment, Earnings))
}
basket_symbols =
{

}
basket_exclude =
{

}
basket_htb =
{

}

; entry----------------------------------------------------------------------
entry_trigger =
{
There's no rule here 
}
entry_order_type = LIMIT
entry_order_side = BUY
entry_destination = CSFB
entry_size = 100
entry_tif = TIF_DAY
entry_tif_seconds = ''
entry_order_limit =
{
  IF(
    (EarningsNewsEvent(News_Current,ACBO,True,Any) OR Source3(News_Current, ACBO, AnySentiment, Earnings))
    AND DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26') > 0
    AND DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26') > AdjustedClosePrice(P1) * 1.04
    AND DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26') < AdjustedClosePrice(P1) * 1.08
  ,
    AdjustedClosePrice(P1) * 1.04
  ,
    0
  )
}
entry_order_stop =
{
  IF(
    (EarningsNewsEvent(News_Current,ACBO,True,Any) OR Source3(News_Current, ACBO, AnySentiment, Earnings))
    AND DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26') > 0
    AND DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26') > AdjustedClosePrice(P1) * 1.04
    AND DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26') < AdjustedClosePrice(P1) * 1.08
  ,
    AdjustedClosePrice(P1) * 1.04
  ,
    0
  )
}

; target----------------------------------------------------------------------
target_order_type = PRIMUS_AEL
target_order_side = BUY
target_destination = CSFB
target_size = 100
target_limit =
{
    ExecutionPrice * .8
}
ael_on_last = FALSE
ael_on_second = TRUE
ael_on_bid_ask = FALSE
ael_convert_to_stop = FALSE
ael_trigger =
{

}
ael_price =
{

}
ael_time_increment =
{

}
ael_price_increment =
{

}


; stop----------------------------------------------------------------------
stop_order_type = PRIMUS_STOP
stop_order_side = BUY
stop_size = 100
stop_price =
{
  AdjustedClosePrice(P1) * 1.08
}
enable_trailing = FALSE
trail_trigger =
{
  TickTimeSeconds - PositionEntryTime > 60
}
trail_how =
{
  IF(TickTimeSeconds - PositionEntryTime < 300, DayHigh(ALL_VENUES,1,CURRENT,NO) * 1.03, IF(TickTimeSeconds - PositionEntryTime < 1800, MinuteHigh(ALL_VENUES, 10, CURRENT, NO, False) + (MinuteHigh(ALL_VENUES, 2, CURRENT, NO, False) - MinuteLow(ALL_VENUES, 2, CURRENT, NO, False)), MinuteHigh(ALL_VENUES, 30, CURRENT, NO, False) + (MinuteHigh(ALL_VENUES, 2, CURRENT, NO, False) - MinuteLow(ALL_VENUES, 2, CURRENT, NO, False))))
}
trail_increment =
{
  IF(.01>Last(ALL_VENUES,CURRENT,NO) / 1000,.01,Last(ALL_VENUES,CURRENT,NO) / 1000)
}

; launch rules----------------------------------------------------------------------
launch_rules =
{
  (CurrentDate >= #2012-07-9# AND
  CurrentDate <= #2012-08-16#) OR

  (CurrentDate >= #2012-10-09# AND
  CurrentDate <= #2012-11-15#)
}
