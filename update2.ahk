

general_settings_vars := {}
entry_vars := {}
target_vars := {}
stop_vars := {}
basket_vars := {}
time_option_vars := {}
position_sizing_vars := {}
risk_management_vars := {}
launch_rule_vars := {}

general_settings_vars := {}
entry_vars := {}
target_vars := {}
stop_vars := {}
basket_vars := {}
time_option_vars := {}
position_sizing_vars := {}
risk_management_vars := {}
launch_rule_vars := {}

initialize_update()
update_general_setting(general_settings_vars, general_settings_bu_vars)
update_entry(entry_vars, entry_bu_vars)
update_target(target_vars, target_bu_vars)
update_stop(stop_vars, stop_bu_vars)
update_basket(basket_vars, basket_bu_vars)
update_time_options(time_option_vars, time_option_bu_vars)
update_position_sizing(position_sizing_vars, position_sizing_bu_vars)
update_risk_management(risk_management_vars, risk_management_bu_vars)
update_launch_rule(launch_rule_vars, launch_rule_bu_vars)
finalize_update()
