; takes a point array with x being first item and y the second
IsChecked(checkbox_point)
{
  sleep, 100
  ImageSearch,  LocX, LocY, checkbox_point[1], checkbox_point[2], checkbox_point[1]+41, checkbox_point[2]+30, checked.PNG
  return (ErrorLevel = 0)
}


TriggerCheckBox(checkbox_point)
{
  x := checkbox_point[1]
  y := checkbox_point[2]
  MouseClick, Left, %x%, %y%
}

SetCheckBox(value, check_box, trigger_point)
{
  if (value = "TRUE")
  {
    if (!IsChecked(check_box))
      TriggerCheckBox(trigger_point)
  } else {
    if (IsChecked(check_box))
      TriggerCheckBox(trigger_point)
  }
}
