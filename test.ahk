#include window_task_queue_manager.ahk

task_queue_manager_select_and_copy_all()
hour_glass_sleep(200)
s := Clipboard
msgbox % online_count(s)
msgbox done
