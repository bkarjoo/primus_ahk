#include clipboard_paste.ahk
#include files.ahk

gcc_initial_compile()
{
  clipboard_paste("if not exist pp mkdir pp")
  clipboard_paste("gcc basket.c -E -o pp/basket.i -P")
  clipboard_paste("gcc entry.c -E -o pp/entry.i -P")
  clipboard_paste("gcc launch_rules.c -E -o pp/launch_rules.i -P")
  clipboard_paste("gcc position_sizing.c -E -o pp/position_sizing.i -P")
  clipboard_paste("gcc stop.c -E -o pp/stop.i -P")
  clipboard_paste("gcc target.c -E -o pp/target.i -P")
  clipboard_paste("gcc general_settings.c -E -o pp/general_settings.i -P")
  clipboard_paste("gcc time_options.c -E -o pp/time_options.i -P ")
  clipboard_paste("gcc risk_management.c -E -o pp/risk_management.i -P ")
}

remove_git_dir()
{
  clipboard_paste("del /f /s /q .git 1>nul")
  clipboard_paste("rmdir /s /q .git")
}


compile_code_files()
{
  gcc_initial_compile()
  confirm_compiled_files_exist()
}

compile_code_files_if_changed(ustate)
{
  if (ustate["basket_updated"])
    clipboard_paste("gcc basket.c -E -o pp/basket.i -P")
  if (ustate["entry_updated"])
    clipboard_paste("gcc entry.c -E -o pp/entry.i -P")
  if (ustate["launch_rules_updated"])
    clipboard_paste("gcc launch_rules.c -E -o pp/launch_rules.i -P")
  if (ustate["position_sizing_updated"])
    clipboard_paste("gcc position_sizing.c -E -o pp/position_sizing.i -P")
  if (ustate["stop_updated"])
    clipboard_paste("gcc stop.c -E -o pp/stop.i -P")
  if (ustate["target_updated"])
    clipboard_paste("gcc target.c -E -o pp/target.i -P")
  if (ustate["general_settings_updated"])
    clipboard_paste("gcc general_settings.c -E -o pp/general_settings.i -P")
  if (ustate["time_options_updated"])
    clipboard_paste("gcc time_options.c -E -o pp/time_options.i -P ")
  if (ustate["risk_management_updated"])
    clipboard_paste("gcc risk_management.c -E -o pp/risk_management.i -P ")
}
