#include "functions.h"
#include "utility_functions.h"
#include "launch_rules.h"
#include "symbol_lists.h"

#define ref_price min_low_pm_30
#define gap_req_perc .03
#define gap_req_absolute .30
#define perc_aggressive .97
#define pre_mkt_volume_perc .01
#define close_reference spy_volatility_adjusted_close

#define gap_req max2(close * gap_req_perc, gap_req_absolute)

close_reference

entry_trigger =
{
  ref_price > 0
  and ref_price <

  close_reference

  and pre_mkt_last < close_reference - gap_req
  and pre_mkt_last < avg2(pre_mkt_high, pre_mkt_low)
  and pre_mkt_volume > pre_mkt_volume_perc * advs
}
