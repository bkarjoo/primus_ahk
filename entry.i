entry_order_type = LIMIT
entry_order_side = SHORT
entry_destination = CSFB
entry_size = 100
entry_tif = TIF_OPENING
entry_tif_seconds =
entry_order_limit =
{
  IF(
    DayBar_Volume(ALL_VENUES, 1, YES, '04:00-09:27') > .01 * AvgDayVolume(ALL_VENUES, 20, NO)
    AND
    DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:27') < AdjustedClosePrice(P1) * .93
  ,
    DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:27') * .97
  ,
    0
  )
}
entry_aggregated_TIF = FALSE
entry_calculate_limit_during_placement = FALSE
entry_tif2 =
entry_tif2_seconds =
entry_order_stop =
{
}
