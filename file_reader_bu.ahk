#include box_vars_bu.ahk

LoadFileBU(file_name)
{

  global


  in_bracket_block := false
  ; a line with a single { makes in_bracket_block true
  ; a line with a single } makes in_bracket_block false
  bracket_block_content := ""
  name := ""
  Loop
  {
      FileReadLine, line, %file_name%, %A_Index%

      if ErrorLevel
      {
        break
      }

      if (line = "")
        continue

      if (SubStr(line, 1, 1) = ";")
        continue

      if (SubStr(line,1,1) = "#")
        continue


      if (line = "}") {
        in_bracket_block := false
        ; assign bracket_block_content to a variable
        if (name = "position_sizing")
          position_sizing_bu := bracket_block_content
        else if (name = "basket_rules")
          basket_rules_bu := bracket_block_content
        else if (name = "basket_symbols")
          basket_symbols_bu := bracket_block_content
        else if (name = "basket_exclude")
          basket_exclude_bu := bracket_block_content
        else if (name = "basket_htb")
          basket_htb_bu := bracket_block_content
        else if (name = "entry_trigger")
          entry_trigger_bu := bracket_block_content
        else if (name = "entry_order_limit")
          entry_order_limit_bu := bracket_block_content
        else if (name = "entry_order_stop")
          entry_order_stop_bu := bracket_block_content
        else if (name = "target_limit")
          target_limit_bu := bracket_block_content
        else if (name = "ael_trigger")
          ael_trigger_bu := bracket_block_content
        else if (name = "ael_price")
          ael_price_bu := bracket_block_content
        else if (name = "ael_time_increment")
          ael_time_increment_bu := bracket_block_content
        else if (name = "ael_price_increment")
          ael_price_increment_bu := bracket_block_content
        else if (name = "stop_price")
          stop_price_bu := bracket_block_content
        else if (name = "trail_trigger")
          trail_trigger_bu := bracket_block_content
        else if (name = "trail_how")
          trail_how_bu := bracket_block_content
        else if (name = "trail_increment")
          trail_increment_bu := bracket_block_content
        else if (name = "launch_rules")
          launch_rules_bu := bracket_block_content
        ; TODO erase bracket_block_content
        bracket_block_content := ""
        continue
      }

      if (line = "{") {
        in_bracket_block := true
        continue
      }

      if (in_bracket_block) {
        ; build block content line by line
        bracket_block_content := bracket_block_content . " " . line
      }
      else {
        ; name value pair line, split by equal
        tokens := StrSplit(line, "=")
        name := Trim(tokens[1])
        value := Trim(tokens[2])
        ; TODO if value is not nothing assign it to a variable, otherwise it's a () block
        if (value = "")
          continue ; value will be concatenated in_bracket_block

        if (name = "box_name")
          box_name_bu := value
        else if (name = "black_box_description")
          black_box_description_bu := value
        else if (name = "black_box_side")
          black_box_side_bu := value
        else if (name = "black_box_scheme")
          black_box_scheme_bu := value
        else if (name = "enter_on_last")
          enter_on_last_bu := value
        else if (name = "enter_on_bid")
          enter_on_bid_bu := value
        else if (name = "enter_on_ask")
          enter_on_ask_bu := value
        else if (name = "enter_on_pmi")
          enter_on_pmi_bu := value
        else if (name = "enter_on_imbalance")
          enter_on_imbalance_bu := value
        else if (name = "enter_on_snapshot")
          enter_on_snapshot_bu := value
        else if (name = "enter_on_stock_event")
          enter_on_stock_event_bu := value
        else if (name = "enable_stop_trailing_on_new_second")
          enable_stop_trailing_on_new_second_bu := value
        else if (name = "trail_after_entry_complete")
          trail_after_entry_complete_bu := value
        else if (name = "trail_once")
          trail_once_bu := value
        else if (name = "verify_code_during_validate_procedure")
          verify_code_during_validate_procedure_bu := value
        else if (name = "enter_on_new_minute")
          enter_on_new_minute_bu := value
        else if (name = "use_time_options")
          use_time_options_bu := value
        else if (name = "start_subscription")
          start_subscription_bu := value
        else if (name = "start_entering_positions")
          start_entering_positions_bu := value
        else if (name = "stop_entering_positions")
          stop_entering_positions_bu := value
        else if (name = "cancel_all_pending_orders")
          cancel_all_pending_orders_bu := value
        else if (name = "close_all_open_positions")
          close_all_open_positions_bu := value
        else if (name = "place_OPG_orders")
          place_OPG_orders_bu := value
        else if (name = "use_strict_mode")
          use_strict_mode_bu := value
        else if (name = "enable_position_sizing_scheme")
          enable_position_sizing_scheme_bu := value
        else if (name = "enable_black_box_risk_management")
          enable_black_box_risk_management_bu := value
        else if (name = "maximum_order_shares")
          maximum_order_shares_bu := value
        else if (name = "basket_name")
          basket_name_bu := value
        else if (name = "basket_description")
          basket_description_bu := value
        else if (name = "activate_dynamic_basket_rules")
          activate_dynamic_basket_rules_bu := value
        else if (name = "apply_dynamic_basket_rules_to_all_available_symbols")
          apply_dynamic_basket_rules_to_all_available_symbols_bu := value
        else if (name = "entry_order_type")
          entry_order_type_bu := value
        else if (name = "entry_order_side")
          entry_order_side_bu := value
        else if (name = "entry_destination")
          entry_destination_bu := value
        else if (name = "entry_size")
          entry_size_bu := value
        else if (name = "entry_tif")
          entry_tif_bu := value
        else if (name = "entry_tif_seconds")
          entry_tif_seconds_bu := value
        else if (name = "entry_aggregated_TIF")
          entry_aggregated_TIF_bu := value
        else if (name = "entry_calculate_limit_during_placement")
          entry_calculate_limit_during_placement_bu := value
        else if (name = "entry_tif2")
          entry_tif2_bu := value
        else if (name = "entry_tif2_seconds")
          entry_tif2_seconds_bu := value
        else if (name = "target_order_type")
          target_order_type_bu := value
        else if (name = "target_order_side")
          target_order_side_bu := value
        else if (name = "target_destination")
          target_destination_bu := value
        else if (name = "target_size")
          target_size_bu := value
        else if (name = "ael_on_last")
          ael_on_last_bu := value
        else if (name = "ael_on_second")
          ael_on_second_bu := value
        else if (name = "ael_on_bid_ask")
          ael_on_bid_ask_bu := value
        else if (name = "ael_convert_to_stop")
          ael_convert_to_stop_bu := value
        else if (name = "stop_order_type")
          stop_order_type_bu := value
        else if (name = "stop_order_side")
          stop_order_side_bu := value
        else if (name = "stop_size")
          stop_size_bu := value
        else if (name = "enable_trailing")
          enable_trailing_bu := value
        else if (name = "enable_black_box_launch_rule")
          enable_black_box_launch_rule_bu := value
      }

  }
  return
}
