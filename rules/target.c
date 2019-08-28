#include "../../etc/functions.h"
target_order_type = PRIMUS_AEL
target_order_side = SELL
target_destination = CSFB
target_size = 100
target_limit =
{

}
ael_on_last = TRUE
ael_on_second = FALSE
ael_on_bid_ask = FALSE
ael_convert_to_stop = FALSE
ael_trigger =
{
  last > execution * 1.1
}
ael_price =
{
  ask + .01
}
ael_time_increment =
{
  30
}
ael_price_increment =
{
  .03
}
