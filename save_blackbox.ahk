#include wait_policy.ahk
#include inform.ahk

save_blackbox_click_save()
{
  if (!activate_and_wait("Save BlackBox", 60, 2))
    inform("click_save unable to activate save blackbox window")
  Click 73, 59
  Sleep, 200
  Click 235, 414
  wait_only("Information", 10)
}
