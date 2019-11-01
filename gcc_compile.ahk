#include clipboard_paste.ahk

gcc_initial_compile()
{
Clipboard_paste("if not exist pp mkdir pp")
clipboard_paste("gcc basket.c -E -o pp/basket.i -P")
clipboard_paste("gcc entry.c -E -o pp/entry.i -P")
clipboard_paste("gcc launch_rules.c -E -o pp/launch_rules.i -P")
clipboard_paste("gcc position_sizing.c -E -o pp/position_sizing.i -P")
clipboard_paste("gcc stop.c -E -o pp/stop.i -P")
clipboard_paste("gcc target.c -E -o pp/target.i -P")
clipboard_paste("gcc general_settings.c -E -o pp/general_settings.i -P")
clipboard_paste("gcc time_options.c -E -o pp/time_options.i -P ")
}

make_back_up_directory(box_acronym)
{
bu_md_cmd := "if not exist ..\bu\" . box_acronym . " md ..\bu\" . box_acronym
Clipboard_paste(bu_md_cmd)
}
