#include wait_policy.ahk

click_choose_basket()
{
  MouseClick, Left, 918, 64
  err := wait_only("Basket Manager", 10)
  if (err != 0)
    inform("Basket didn't open.")
}
