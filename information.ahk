#include wait_policy.ahk
#include inform.ahk

information_click_ok()
{
  if (!activate_and_wait_only("Information", 60))
    inform("information_click_ok unable to activate save Information window")
  Click 130, 120
  wait_only("Primu$ 7.", 10)
}
