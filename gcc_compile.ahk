#include clipboard_paste.ahk
#include files.ahk
#include cmd.ahk

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



git_clone(box_name, branch_name)
{
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  repo_path := creds["github"] . box_name . ".git"
  run_cmd("git.exe clone --single-branch --branch " . branch_name . " " . repo_path)
}

remove_git_dir(box_name)
{
  run_cmd("del /f /s /q " . box_name . "\.git 1>nul")
  run_cmd("rmdir /s /q " . box_name . "\.git")
  run_cmd("del " . box_name . "/S /Q")
  run_cmd("rmdir " . box_name)
}

compile_code_folder(code_folder)
{
  run_cmd("gcc " . code_folder . "\basket.c -E -o " . code_folder . "\basket.i -P")
  run_cmd("gcc " . code_folder . "\entry.c -E -o " . code_folder . "\entry.i -P")
  run_cmd("gcc " . code_folder . "\general_settings.c -E -o " . code_folder . "\general_settings.i -P")
  run_cmd("gcc " . code_folder . "\launch_rules.c -E -o " . code_folder . "\launch_rules.i -P")
  run_cmd("gcc " . code_folder . "\position_sizing.c -E -o " . code_folder . "\position_sizing.i -P")
  run_cmd("gcc " . code_folder . "\stop.c -E -o " . code_folder . "\stop.i -P")
  run_cmd("gcc " . code_folder . "\target.c -E -o " . code_folder . "\target.i -P")
  run_cmd("gcc " . code_folder . "\time_options.c -E -o " . code_folder . "\time_options.i -P")
  run_cmd("gcc " . code_folder . "\risk_management.c -E -o " . code_folder . "\risk_management.i -P")
}
