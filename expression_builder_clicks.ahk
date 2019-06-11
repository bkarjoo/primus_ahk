
ClearExpressionBuilderCode()
{
  ; assumes expression builder is open
  ; clear existing code by pressing the clear button
  MouseClick, Left, 760, 230
  sleep, 10
}


ClickExpressionBuilderOk()
{
  MouseClick, Left, 900, 550 ; press expression builder ok
  sleep, 10
}

SetExpressionBuilderCode(rule)
{
  ; assumes expression builder is open
  ClearExpressionBuilderCode()

  ; click the text area
  MouseClick, Left, 500, 100
  sleep, 100
  ; add the rule
  Clipboard := rule
  Send, ^v
  sleep, 100

  ClickExpressionBuilderOk()
}
