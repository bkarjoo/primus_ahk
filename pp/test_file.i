#include "../etc/function"
box_name = New Name plus
black_box_description = some description more description, and then some more
black_box_side = LONG
black_box_scheme = PlainVanilla
enter_on_last = TRUE
enter_on_bid = TRUE
enter_on_ask = TRUE
enter_on_pmi = TRUE
enter_on_imbalance = TRUE
enter_on_snapshot = TRUE
enter_on_new_minute = TRUE
enter_on_stock_event = TRUE
use_strict_mode = TRUE

; time options----------------------------------------------------------------------
use_time_options = TRUE
start_subscription = 9:21:00 AM
start_entering_positions = 9:30:00 AM
stop_entering_positions = 3:58:00 PM
cancel_all_pending_orders = 3:58:30 PM
close_all_open_positions = 3:59:00 PM
place_OPG_orders = 9:27:00 AM

; position sizing----------------------------------------------------------------------
enable_position_sizing_scheme = TRUE
enable_black_box_risk_management = TRUE
maximum_order_shares = 2000
position_sizing =
{
  IF(IF(10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26')<2000 / AvgDailyRange(ALL_VENUES, 20, NO),10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26'),2000 / AvgDailyRange(ALL_VENUES, 20, NO))<IF(AvgDayVolume(ALL_VENUES, 20, NO) / 1000<0.10 * AvgOpenPrintSize(20),AvgDayVolume(ALL_VENUES, 20, NO) / 1000,0.10 * AvgOpenPrintSize(20)),IF(10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26')<2000 / AvgDailyRange(ALL_VENUES, 20, NO),10000 / DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:26'),2000 / AvgDailyRange(ALL_VENUES, 20, NO)),IF(AvgDayVolume(ALL_VENUES, 20, NO) / 1000<0.10 * AvgOpenPrintSize(20),AvgDayVolume(ALL_VENUES, 20, NO) / 1000,0.10 * AvgOpenPrintSize(20)))
}

; basket----------------------------------------------------------------------
basket_name = some name
basket_description = some description about the baset, has to be all on one line
activate_dynamic_basket_rules = TRUE
apply_dynamic_basket_rules_to_all_available_symbols = FALSE
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
AAME
AAN
AAOI
AAON
AAP
AAPL
AAT
AAU
AAWW
AAXJ
AAXN
AB
ABB
ABBV
ABC
ABCB
}
basket_exclude =
{
AAME
AAN
AAOI
AAON
AAP
AAPL
AAT
AAU
AAWW
AAXJ
AAXN
AB
ABB
ABBV
ABC
ABCB
}
basket_htb =
{
AAME
AAN
AAOI
AAON
AAP
AAPL
AAT
AAU
AAWW
AAXJ
AAXN
AB
ABB
ABBV
ABC
ABCB
}

; entry----------------------------------------------------------------------
entry_trigger =
{
There's no rule here
}
entry_order_type = STOP_LIMIT
entry_order_side = BUY
entry_destination = CSFB
entry_size = 100
entry_tif = SECONDS
entry_tif_seconds = 60
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

entry_aggregated_TIF = FALSE
entry_calculate_limit_during_placement = FALSE
entry_tif2 = SECONDS
entry_tif2_seconds = 30
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
target_order_side = SELL
target_destination = CSFB
target_size = 100
target_limit =
{
    ExecutionPrice * .8
}
ael_on_last = TRUE
ael_on_second = FALSE
ael_on_bid_ask = TRUE
ael_convert_to_stop = TRUE
ael_trigger =
{
  ael trigger
}
ael_price =
{
  ael price
}
ael_time_increment =
{
  ael timee
}
ael_price_increment =
{
  ael price
}


; stop----------------------------------------------------------------------
stop_order_type = PRIMUS_STOP
stop_order_side = SELL
stop_size = 100
stop_price =
{
  AdjustedClosePrice(P1) * 1.08
}
enable_trailing = TRUE
trail_after_entry_complete = TRUE
trail_once = FALSE
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
enable_black_box_launch_rule = TRUE
launch_rules =
{
  (CurrentDate >= #2012-07-9# AND
  CurrentDate <= #2012-08-16#) OR

  (CurrentDate >= #2012-10-09# AND
  CurrentDate <= #2012-11-15#)
}
