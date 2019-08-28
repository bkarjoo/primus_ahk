stop_order_type = PRIMUS_STOP
stop_order_side = SELL
stop_size = 100
stop_price =
{
  ExecutionPrice * .99
}
enable_trailing = TRUE
trail_after_entry_complete = TRUE
trail_once = FALSE
trail_trigger =
{
  TimeFromStockOpenSeconds > 60
}
trail_how =
{
  MinuteLow(ALL_VENUES, 1, CURRENT, NO, False) - (MinuteHigh(ALL_VENUES, 1, CURRENT, NO, False) - MinuteLow(ALL_VENUES, 1, CURRENT, NO, False))
}
trail_increment =
{
 .03
}
