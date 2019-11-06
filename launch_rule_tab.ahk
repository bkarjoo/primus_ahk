; launch_rules -----------------------------------------------------------------
enable_black_box_launch_rule_check_box := [14,49]
enable_black_box_launch_rule_trigger_point := [21,57]

set_launch_rule(rule)
{
  sleep, 100
  MouseClick, Left, 217, 300
  sleep, 100
  Send, ^a
  sleep, 100
  Clipboard := StrReplace(rule, ".", "#")
  sleep, 100
  Send, ^v
  sleep, 100
}
