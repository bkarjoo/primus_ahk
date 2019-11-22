

date_convert_to_ahk(d)
{
  array := StrSplit(d, "/")
  m := array[1]
  d := array[2]
  y := array[3]

  y := "20" . y

  return (y . m . d . "120000")
}

date_convert_from_ahk(ahk_date)
{
  m := SubStr(ahk_date, 5, 2)
  d := SubStr(ahk_date, 7, 2)
  y := SubStr(ahk_date, 3, 2)

  return (m . "/" . d . "/" . y)
}

add_day(d)
{
  ahk_date := date_convert_to_ahk(d)
  ahk_date += 1, Days
  return date_convert_from_ahk(ahk_date)
}

subtract_day(d)
{
  ahk_date := date_convert_to_ahk(d)
  ahk_date += -1, Days
  return date_convert_from_ahk(ahk_date)
}
