#include "../../etc/functions.h"
entry_trigger =
{
  open > 0
}
entry_order_type = LIMIT
entry_order_side = BUY
entry_destination = CSFB
entry_size = 100
entry_tif = SECONDS
entry_tif_seconds = 60
entry_order_limit =
{
  open * 1.2
}

entry_aggregated_TIF = FALSE
entry_calculate_limit_during_placement = FALSE
entry_tif2 =
entry_tif2_seconds =
entry_order_stop =
{

}
