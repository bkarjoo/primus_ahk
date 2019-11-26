#include logger.ahk

date_convert_to_ahk(d)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  array := StrSplit(d, "/")
  m := array[1]
  d := array[2]
  y := array[3]

  y := "20" . y

  return (y . m . d . "120000")
}

date_convert_from_ahk(ahk_date)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  m := SubStr(ahk_date, 5, 2)
  d := SubStr(ahk_date, 7, 2)
  y := SubStr(ahk_date, 3, 2)

  return (m . "/" . d . "/" . y)
}

add_day(d)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ahk_date := date_convert_to_ahk(d)
  ahk_date += 1, Days
  return date_convert_from_ahk(ahk_date)
}

subtract_day(d)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  ahk_date := date_convert_to_ahk(d)
  ahk_date += -1, Days
  return date_convert_from_ahk(ahk_date)
}
