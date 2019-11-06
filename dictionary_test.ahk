

generic_code_parser(file_name, array)
{
  Loop
  {
    FileReadLine, Line, %file_name%, %A_Index%
    if (ErrorLevel)
      break
    if (line = "")
      continue
    if (SubStr(line, 1, 1) = ";")
      continue
    if (SubStr(line,1,1) = "#")
      continue
    if (line = "}")
    {
      in_bracket_block := false
      ; assign bracket_block_content to a variable

      a[name] := bracket_block_content
      bracket_block_content := ""
      msgbox % array[name]
    }
    if (line = "{") {
      in_bracket_block := true
      continue
    }
    if (in_bracket_block) {
      ; build block content line by line
      bracket_block_content := bracket_block_content . " " . line
    }
    else
    {
      ; name value pair line, split by equal
      tokens := StrSplit(line, "=")
      name := Trim(tokens[1])
      value := Trim(tokens[2])
      if (value != "")
      {
        array[name] := value
      }
    }
  }
}
