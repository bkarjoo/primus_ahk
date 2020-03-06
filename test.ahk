#include header.ahk

res := activate_and_wait_only("PRIMU$ - B", 5)
if (res != 1)
  inform("Cannot activate black box design.")


is_checkino(x, y)
{
p := x + 15
q := y + 15
PixelSearch, out1, out2, %x%, %y%, %p%, %q%, 000

return out1 > 0
}


if (is_checkino(618,99))
  msgbox, checked
else
  msgbox, not checked
