#include "launch_rules.h"
#include "utility_functions.h"
#include "symbol_lists.h"
// keywords for atom autofill
// BUY
// CSFB
// LIMIT
// STOP_LIMIT
// OPG
// PERIOD_7
// PERIOD_20
// PlainVanilla
// PRIMUS_AEL
// SECONDS
// SELL
// SHORT
// Tif_OPENING
// CEF_Basket
// half_day
// NYSE

// lower_case
#define and AND
#define or OR
#define not NOT
#define p1 P1
#define p2 P2
#define p3 P3
#define p4 P4
#define p5 P5

// SAFETY
#define server_crash_fail_safe entry_trigs_sec(10) = 0

// INSTRUMENT and EXCHANGE
#define exchange(x) PrimaryExchange(x)
#define etp_prefered_exclude etp_exclude AND NOT IsInstrumentType(PREFERRED_STOCK)
#define etp_exclude NOT IsInstrumentType(EXCHANGE_TRADED_FUND) AND NOT IsInstrumentType(EXCHANGE_TRADED_NOTE)
#define is_ipo IsIPO and not IsInstrumentType(PREFERRED_STOCK) and not IsInstrumentType(WARRANT) and not IsInstrumentType(RIGHT) and not IsInstrumentType(EXCHANGE_TRADED_FUND) and not IsInstrumentType(EXCHANGE_TRADED_NOTE)
#define is_common_stock etp_prefered_exclude
#define ETF EXCHANGE_TRADED_FUND
#define ETN EXCHANGE_TRADED_NOTE
#define PRFRD PREFERRED_STOCK
#define instrument_type(x) IsInstrumentType(x)
#define warrant IsInstrumentType(WARRANT)
#define is_halted IsHalt
#define is_hard_to_borrow IsHardToBorrow
#define minimum_days_from_ipo(x) (DaysFromIPO > x OR DaysFromIPO < 0)
#define maximum_days_from_ipo(x) (DaysFromIPO > -1 AND DaysFromIPO < x)
#define ipo_price IPOPrice
#define ipo_day_2 if(DayOfTheWeek = 1, DaysFromIPO = 3, DaysFromIPO = 1)
#define not_exdiv AdjustedClosePrice(p1) = ClosePrice(PRIMARY, p1, NO)

// EXECUTION
#define change_from_entry PositionDelta(ALL_VENUES, NO)
#define entries EntriesCount(HOURS, 8)
#define entry_time_sec PositionEntryTime
#define entry_trigs_day EntryTriggersCount(HOURS, 8)
#define entry_trigs_sec(x) EntryTriggersCount(SECONDS, x)
#define entry_trigs_min(x) EntryTriggersCount(MINUTES, x)
#define entry_trigs_hr(x) EntryTriggersCount(HOURS, x)
#define execution ExecutionPrice
#define position_count_open PositionCount(OPEN)

// BLACKBOX
// DATE
// TIME
#define time_minute TickTime
#define time_sec TickTimeSeconds
#define time_in_position_sec time_sec - entry_time_sec
#define time_from_open TimeFromStockOpenSeconds // use with MINUTES
#define time_from_open_sec TimeFromStockOpenSeconds
#define time_from_open_minutes (TimeFromStockOpenSeconds/60)
// IMBALANCE
// BID
#define bid Bid(INSIDE, CURRENT, NO)
#define bid_pre_mkt Bid(INSIDE, CURRENT, YES)
// ASK
#define ask Ask(INSIDE, CURRENT, NO)
#define ask_pre_mkt Ask(INSIDE, CURRENT, YES)
// LAST
#define last Last(ALL_VENUES,CURRENT,NO)
#define last_pre_mkt Last(ALL_VENUES,CURRENT,YES)
#define pre_mkt_price DayBar_Close(ALL_VENUES, 1, YES, '04:00-09:27')
#define pre_mkt_last day_bar_close( 1, '04:00-09:27')
#define pre_mkt_NYSE_last day_bar_close( 1, '04:00-09:29')
#define pre_mkt_perc_chg ((day_bar_close(1, '08:00-09:27') - close)/close)
#define price_delta(x) PriceDelta(ALL_VENUES, x, NO)
#define position_delta PositionDelta(ALL_VENUES, NO)
// CLOSE
#define close AdjustedClosePrice(P1)
#define close_prv(x) AdjustedClosePrice(x)
#define unadjusted_close ClosePrice(PRIMARY, P1, NO)
#define unadjusted_close_prv(x) ClosePrice(PRIMARY, x, NO)
#define post_mkt_close DayBar_CloseP(ALL_VENUES, 1, YES, '16:05-20:00', P1)
// OPEN
#define open OpenPrice(PRIMARY, CURRENT, NO)
#define open_prv(x) OpenPrice(PRIMARY, x, NO)
// HIGH
#define day_high DayHigh(ALL_VENUES,1,CURRENT,NO)
#define day_highest_high(x) DayHigh(ALL_VENUES ,x ,CURRENT, NO)
#define day_high_ext DayHigh(ALL_VENUES,1,CURRENT,YES)
#define day_high_prv(x) DayHigh(ALL_VENUES,1,x,NO)
#define day_high_ext_prv(x) DayHigh(ALL_VENUES,1,x,YES)
#define pre_mkt_high DayBar_High(ALL_VENUES, 1, YES, '04:00-09:27')
#define post_mkt_high DayBar_HighP(ALL_VENUES, 1, YES, '16:05-20:00', P1)
#define acbo_high max2(pre_mkt_high, post_mkt_high)
#define minute_high(x) MinuteHigh(ALL_VENUES, x, CURRENT, NO, True)
#define minute_high_prv(x, y) MinuteHigh(ALL_VENUES, x, y, NO, True)
#define minute_high_I_prv(x, y) MinuteHigh_I(ALL_VENUES, x, y, NO, True)
#define minute_high_I_prv_dis(x, y) MinuteHigh_I(ALL_VENUES, x, y, NO, True)
#define minute_high_ext_dv(x) MinuteHigh(ALL_VENUES, x, CURRENT, YES, True)
#define minute_high_ext(x) MinuteHigh(ALL_VENUES, x, CURRENT, YES, False)
#define new_high NewDayHigh(1, NO)
#define new_high_days(x) NewDayHigh(x, NO)
#define new_high_ext NewDayHigh(1, YES)
#define new_high_ext_days(x) NewDayHigh(x, YES)
#define week_high(x) WeekHigh(ALL_VENUES, x, CURRENT, NO)
#define new_week_high(x) NewWeekHigh(x, NO)
// LOW
#define day_low DayLow(ALL_VENUES,1,CURRENT,NO)
#define day_lowest_low(x) DayLow(ALL_VENUES, x, CURRENT, NO)
#define day_low_ext DayLow(ALL_VENUES,1,CURRENT,YES)
#define day_low_prv(x) DayLow(ALL_VENUES,1,x,NO)
#define day_low_ext_prv(x) DayLow(ALL_VENUES,1,x,YES)
#define pre_mkt_low DayBar_Low(ALL_VENUES, 1, YES, '04:00-09:27')
#define post_mkt_low DayBar_LowP(ALL_VENUES, 1, YES, '16:05-20:00', P1)
#define acbo_low min2(pre_mkt_low, post_mkt_low) // must check for volume in both to use this function
#define minute_low(x) MinuteLow(ALL_VENUES, x, CURRENT, NO, True)
#define minute_low_prv(x, y) MinuteLow(ALL_VENUES, x, y, NO, True)
#define minute_low_I_prv(x, y) MinuteLow_I(ALL_VENUES, x, y, NO, True)
#define minute_low_I_prv_dis(x, y) MinuteLow_I(ALL_VENUES, x, y, NO, True)
#define minute_low_ext_dv(x) MinuteLow(ALL_VENUES, x, CURRENT, YES, True)
#define minute_low_ext(x) MinuteLow(ALL_VENUES, x, CURRENT, YES, False)
#define new_low NewDayLow(1, NO)
#define new_low_days(x) NewDayLow(x, NO)
#define new_low_ext NewDayLow(1, YES)
#define new_low_ext_days(x) NewDayLow(x, YES)
#define week_low(x) WeekLow(ALL_VENUES, x, CURRENT, NO)
#define new_week_low(x) NewWeekLow(x, NO)
// RANGE
#define day_range (DayHigh(ALL_VENUES,1,CURRENT,NO) - DayLow(ALL_VENUES,1,CURRENT,NO))
#define day_range_prv(x) (DayHigh(ALL_VENUES,1,x,NO) - DayLow(ALL_VENUES,1,x,NO))
#define day_range_ext_prv(x) (DayHigh(ALL_VENUES,1,x,YES)-DayLow(ALL_VENUES,1,x,YES))
#define day_range_ext (day_high_ext - day_low_ext)
#define pre_mkt_range (pre_mkt_high - pre_mkt_low)
#define post_mkt_range (post_mkt_high - post_mkt_low)
#define spread Spread(INSIDE, NO)
#define minute_range(x) (minute_high(x) - minute_low(x))
#define minute_range_ext_dv(x) (MinuteHigh(ALL_VENUES, x, CURRENT, YES, True) - MinuteLow(ALL_VENUES, x, CURRENT, YES, True))
#define minute_range_ext(x) (MinuteHigh(ALL_VENUES, x, CURRENT, YES, False) - MinuteLow(ALL_VENUES, x, CURRENT, YES, False))
#define min_range_p1_p5(x) day_range_prv(P1) > x and day_range_prv(P2) > x and day_range_prv(P3) > x and day_range_prv(P4) > x and day_range_prv(P5) > x
// BARS
#define adr(x) AvgDailyRange(ALL_VENUES, x, NO)
#define adrs adr(20)
#define atr(x) ATRStock(ALL_VENUES, NO, DAILY, x, CURRENT)
#define atrs atr(20)
#define atr_ext(x) ATRStock(ALL_VENUES, YES, DAILY, x, CURRENT)
#define atr_5(x) ATRStock(ALL_VENUES, NO, MINUTES_5, x, CURRENT)
// VOLUME
#define adv(x) AvgDayVolume(ALL_VENUES, x, NO)
#define advs adv(20)
#define avg_open_size(x) AvgOpenPrintSize(x)
#define avg_opg_vol avg_open_size(10)
#define avg_volume_till_now(x) (adv(x)/390) * (TimeFromStockOpenSeconds/60)
#define day_volume DayVolume(ALL_VENUES,1,CURRENT,NO)
#define day_volume_ext DayVolume(ALL_VENUES, 1, CURRENT, YES)
#define min_vol_p1_p5(x) volume(P1) > x AND volume(P2) > x AND volume(P3) > x AND volume(P4) > x AND volume(P5) > x
#define minute_volume(x) MinuteVolume(ALL_VENUES, x, CURRENT, NO)
#define post_close_volume DayBar_VolumeP(ALL_VENUES, 1, YES, '16:05-19:59', P1)
#define pre_mkt_volume DayBar_Volume(ALL_VENUES, 120, YES, '04:00-09:27')
#define pre_mkt_volume_disbursed(x,y,z) DayBar_VolumeP(ALL_VENUES, 1, YES, '09:00-09:29', CURRENT) > x AND  DayBar_VolumeP(ALL_VENUES, 1, YES, '08:30-08:59', CURRENT) > y AND DayBar_VolumeP(ALL_VENUES, 1, YES, '08:00-08:29', CURRENT) > z
#define pre_mkt_volume_last_30(x) (DayBar_VolumeP(ALL_VENUES, 1, YES, '09:00-09:09', CURRENT) > x AND  DayBar_VolumeP(ALL_VENUES, 1, YES, '09:10-09:19', CURRENT) > x AND DayBar_VolumeP(ALL_VENUES, 1, YES, '9:20-09:27', CURRENT) > x)
#define avg_premkt_disbursed_volume (DayBar_VolumeP(ALL_VENUES, 1, YES, '09:00-09:09', CURRENT) +  DayBar_VolumeP(ALL_VENUES, 1, YES, '09:10-09:19', CURRENT) + DayBar_VolumeP(ALL_VENUES, 1, YES, '9:20-09:27', CURRENT))/3
#define volume(x) DayVolume(ALL_VENUES, 1, x, NO)
#define stock_activity_volume(x) StockActivityVolume(CURRENT, x)
#define relative_volume_avg RelativeVolume(P5, RelativeVolume_Average, ALL_VENUES)
// IMBALANCES
#define imbalance_buy_vol(x) ImbalanceBuyVolume(x)
#define imbalance_sell_vol(x) ImbalanceSellVolume(x)
#define imbalance_paired_vol ImbPair
#define imbalance_at(x) ImbalanceAt(x)
// STUDIES
#define pre_mkt_avg_hlc (DayBar_High(ALL_VENUES, 1, YES, '04:00-09:27')+DayBar_Low(ALL_VENUES, 1, YES, '04:00-09:27')+DayBar_Close(ALL_VENUES, 1, YES, '04:00-09:27'))/3
#define higher_lows_P1_P5(x) MinuteLow_I(ALL_VENUES, x, P4, NO, True) > MinuteLow_I(ALL_VENUES, x, P5, NO, True) AND MinuteLow_I(ALL_VENUES, x, P3, NO, True) > MinuteLow_I(ALL_VENUES, x, P4, NO, True) AND MinuteLow_I(ALL_VENUES, x, P2, NO, True) > MinuteLow_I(ALL_VENUES, x, P3, NO, True) AND MinuteLow_I(ALL_VENUES, x, P1, NO, True) > MinuteLow_I(ALL_VENUES, x, P2, NO, True)
#define lower_highs_P1_P5(x) MinuteHigh_I(ALL_VENUES, x, P4, NO, True) < MinuteHigh_I(ALL_VENUES, x, P5, NO, True) AND MinuteHigh_I(ALL_VENUES, x, P3, NO, True) < MinuteHigh_I(ALL_VENUES, x, P4, NO, True) AND MinuteHigh_I(ALL_VENUES, x, P2, NO, True) < MinuteHigh_I(ALL_VENUES, x, P3, NO, True) AND MinuteHigh_I(ALL_VENUES, x, P1, NO, True) < MinuteHigh_I(ALL_VENUES, x, P2, NO, True)
// takes PERIOD_7 PERIOD_14 PERIOD_20 PERIOD_50 PERIOD_100 PERIOD_200
#define SMA_daily(x) SMAStock(ALL_VENUES, NO, DAILY, x, CURRENT)
#define EMA_5(x) EMAStock(ALL_VENUES, NO, MINUTES_5, x, CURRENT)
#define EMA_1_EH(x) EMAStock(ALL_VENUES, YES, MINUTES_1, x, CURRENT)
#define RSI_1(x) RSIStock(ALL_VENUES, NO, MINUTES_1, x, CURRENT)
#define donchian_long_stop_5 DonchianChannels(CURRENT, MINUTES_5, 20, NO, Donchian_LowerChannel)
#define donchian_long_stop_1 DonchianChannels(CURRENT, MINUTES_1, 20, NO, Donchian_LowerChannel)
// formula, period 0tick else minute, top x, validity margin
#define rank(a,b,c,d) IsInRanking(a,b,c,d)
// DAY BARS
#define day_bar_open(x, y) DayBar_Open(ALL_VENUES, x, NO, y)
#define day_bar_close(x, y) DayBar_Close(ALL_VENUES, x, YES, y)
#define day_bar_low(x, y) DayBar_Low(ALL_VENUES, x, YES, y)
#define day_bar_high(x, y) DayBar_High(ALL_VENUES, x, YES, y)
#define day_bar_volume(x, y) DayBar_Volume(ALL_VENUES, x, YES, y)
#define day_bar_range(x, y) (DayBar_High(ALL_VENUES, x, YES, y) - DayBar_Low(ALL_VENUES, x, YES, y))
#define day_barP_close(x, y, z) DayBar_CloseP(ALL_VENUES, x, YES, y, z)
#define day_barP_low(x, y, z) DayBar_LowP(ALL_VENUES, x, YES, y, z)
#define day_barP_high(x, y, z) DayBar_HighP(ALL_VENUES, x, YES, y, z)
#define day_barP_volume(x, y, z) DayBar_VolumeP(ALL_VENUES, x, YES, y, z)
#define day_barP_range(x, y, z) (DayBar_HighP(ALL_VENUES, x, YES, y, z) - DayBar_LowP(ALL_VENUES, x, YES, y, z))
#define vwap VWAP(CURRENT, NO, VWAP, V1, ALL_VENUES)

// RefStock
#define ref_stock_n(x, y) RefStockNumericValue(x, y)
#define ref_stock_l(x, y) RefStockLogicalValue(x, y)
#define r_adr(x, y) ref_stock_n(x, adr(y))
#define r_briefing_news(x) ref_stock_l(x, briefing_news)
#define r_close(x) ref_stock_n(x, close)
#define r_fly_news(x) ref_stock_l(x, fly_news)
#define r_has_news(x) (r_source3_news(x) or r_fly_news(x) or r_briefing_news(x))
#define r_has_no_news(x) (NOT r_has_news(x))
#define r_is_halted(x) ref_stock_l(x, is_halted)
#define r_is_hard_to_borrow(x) ref_stock_l(x, is_hard_to_borrow)
#define r_last(x) ref_stock_n(x, last)
#define r_open(x) ref_stock_n(x, open)
#define r_pre_mkt_price(x) ref_stock_n(x, pre_mkt_price)
#define r_source3_news(x) ref_stock_l(x, source3_news)
// REF SPY
#define SPY_n(x) RefStockNumericValue('SPY', x)
#define USO_n(x) RefStockNumericValue('USO', x)
#define spy_premkt_perc_chg ((spy_premkt_last - spy_close) / spy_close)
#define spy_adjusted_close (close * (1 + spy_premkt_perc_chg))
#define spy_day_high SPY_n(day_high)
#define spy_day_low SPY_n(day_low)
#define spy_day_range (spy_day_high - spy_day_low )
#define spy_last SPY_n(last)
#define spy_premkt_last SPY_n(pre_mkt_last)
#define spy_close SPY_n(close)


// SIZING // vars to define : shares_per_adr, adr_def, max_shares, dollar_per_position, ref_price_def
#define perc_open_size .1
#define perc_pre_mkt_vol .001
#define perc_volume .25 // used for sweeps
#define adr_shares (shares_per_adr / adrs)
#define opg_size_shares (perc_open_size * avg_opg_vol)
#define pre_mkt_vol_shares (perc_pre_mkt_vol * pre_mkt_volume)

#define ps_opg min3(adr_shares, opg_size_shares, max_shares)
#define position_size_opg min4(max_shares, shares_per_adr / adr_def, dollar_per_position / ref_price_def, max2(opg_size_shares, pre_mkt_vol_shares))
#define position_size_pv min3(max_shares, shares_per_adr / adr_def, dollar_per_position / ref_price_def)
#define position_size_sweep min3(max_shares, dollar_per_position / ref_price_def, perc_volume * advs)


// NEWS

#define mna s3_MNA
#define fda s3_FDA_News
#define spinoff s3_Spinoff_News
#define managment_change s3_Mgmt_Changes
#define ratings (StockNews(News_Current, ACBO, AnySentiment, Recommendations) OR StockNews(News_Current, ACBO, AnySentiment, Upgrade) OR StockNews(News_Current, ACBO, AnySentiment, Downgrade) OR StockNews(News_Current, ACBO, AnySentiment, Initiation) OR Source3(News_Current, ACBO, AnySentiment, Analyst_Research) OR Source3(News_Current, ACBO, AnySentiment, Analyst_EPS_Revision) OR Source3(News_Current, ACBO, AnySentiment, Analyst_EPS_Reiteration) OR Source3(News_Current, ACBO, AnySentiment, Analyst_PT_Change) OR Source3(News_Current, ACBO, AnySentiment, Downgrades) OR Source3(News_Current, ACBO, AnySentiment, Initiations) OR Source3(News_Current, ACBO, AnySentiment, Upgrades) OR Source3(News_Current, ACBO, AnySentiment, Analyst_News))
#define upgrade (StockNews(News_Current, ACBO, AnySentiment, Upgrade) or RatingsAction(News_Current, BeforeOpen, Upgrade, AnyTierFirm, FromAny, ToAny, AnyTargetValue, '') or Source3(News_Current, ACBO, AnySentiment, Upgrades))
#define proper_buyback (ns_press_release('"Share Repurchase"') or ns_press_release('"Stock Repurchase"')) and not ns_press_release('"update*"') and not ns_press_release('"complet*"') and not ns_press_release('"renew*"')
#define earnings (EarningsNewsEvent(News_Current, ACBO, True, Any) or Source3(News_Current, ACBO, AnySentiment, Earnings) or StockNews(News_Current, ACBO, AnySentiment, Earnings))
#define guidance s3_Guidance
#define has_dividend_news (s3_Dividend_Reduction or s3_Dividend_Increase or s3_Dividends or s3_Special_Dividends)
#define initiated (StockNews(News_Current, ACBO, AnySentiment, Initiation) OR Source3(News_Current, ACBO, AnySentiment, Initiations))
#define general_news GeneralNews(News_Current, ACBO, AnySentiment, AnyGeneralNewsType)
// horizon_earnings takes ACBO, AfterClose BeforeOpen and True False
#define horizon_earnings(x, y) EarningsNewsEvent(News_Current,x,y,Any)
#define source3_earnings Source3(News_Current, ACBO, AnySentiment, Earnings)
#define has_earnings (horizon_earnings(ACBO, True) or source3_earnings)
#define has_earnings_prv ( EarningsNewsEvent(News_P1, ACBO, True, Any) or Source3(News_P1, ACBO, AnySentiment, Earnings))
#define has_earnings_AC (EarningsNewsEvent(News_P1, AfterClose, True, Any) or Source3(News_P1, AfterClose, AnySentiment, Earnings))
#define has_earnings_BO (EarningsNewsEvent(News_Current, BeforeOpen, True, Any) or Source3(News_Current, BeforeOpen, AnySentiment, Earnings))
#define option_news Option_News

#define ns(x) NewsSearch(News_Current, ACBO, Source4, AnyGeneralNewsType, AnySentiment, Summary, x)
#define ns_press_release(x) NewsSearch(News_Current, ACBO, Source3, Press_Releases, AnySentiment, Summary, x)
#define is_secondary SyndicateType(News_Current, ACBO, Secondary)
#define is_spot_secondary SyndicateType(News_Current, ACBO, SpotSecondary)
#define syndicate_size SyndicateSize(News_Current, ACBO)
#define has_syndicate_news (is_secondary or is_spot_secondary or StockNews(News_Current, ACBO, AnySentiment, Syndicate))


#define s3(x) Source3(News_Current, ACBO, AnySentiment, x)
#define s3_Form_13_D Source3(News_Current, ACBO, AnySentiment, Form_13_D)
#define s3_Form_13_F Source3(News_Current, ACBO, AnySentiment, Form_13_F)
#define s3_Form_13_G Source3(News_Current, ACBO, AnySentiment, Form_13_G)
#define s3_Analyst_Research Source3(News_Current, ACBO, AnySentiment, Analyst_Research)
#define s3_Analyst_EPS_Revision Source3(News_Current, ACBO, AnySentiment, Analyst_EPS_Revision)
#define s3_Analyst_EPS_Reiteration Source3(News_Current, ACBO, AnySentiment, Analyst_EPS_Reiteration)
#define s3_Analyst_PT_Change Source3(News_Current, ACBO, AnySentiment, Analyst_PT_Change)
#define s3_Commodity_News Source3(News_Current, ACBO, AnySentiment, Commodity_News)
#define s3_Conference_Calls Source3(News_Current, ACBO, AnySentiment, Conference_Calls)
#define s3_Corp_News Source3(News_Current, ACBO, AnySentiment, Corp_News)
#define s3_Credit_Ratings Source3(News_Current, ACBO, AnySentiment, Credit_Ratings)
#define s3_Dividend_Reduction Source3(News_Current, ACBO, AnySentiment, Dividend_Reduction)
#define s3_Dividend_Increase Source3(News_Current, ACBO, AnySentiment, Dividend_Increase)
#define s3_Dividends Source3(News_Current, ACBO, AnySentiment, Dividends)
#define s3_Downgrades Source3(News_Current, ACBO, AnySentiment, Downgrades)
#define s3_Earnings Source3(News_Current, ACBO, AnySentiment, Earnings)
#define s3_Economic_Events Source3(News_Current, ACBO, AnySentiment, Economic_Events)
#define s3_Equity_Offerings Source3(News_Current, ACBO, AnySentiment, Equity_Offerings)
#define s3_ETF_News Source3(News_Current, ACBO, AnySentiment, ETF_News)
#define s3_FDA_News Source3(News_Current, ACBO, AnySentiment, FDA_News)
#define s3_FOMC_News Source3(News_Current, ACBO, AnySentiment, FOMC_News)
#define s3_FX_News Source3(News_Current, ACBO, AnySentiment, FX_News)
#define s3_General_News Source3(News_Current, ACBO, AnySentiment, General_News)
#define s3_Guidance Source3(News_Current, ACBO, AnySentiment, Guidance)
#define s3_Hedge_Fund_News Source3(News_Current, ACBO, AnySentiment, Hedge_Fund_News)
#define s3_Important_Buybacks Source3(News_Current, ACBO, AnySentiment, Important_Buybacks)
#define s3_Important Source3(News_Current, ACBO, AnySentiment, Important)
#define s3_Important_Research Source3(News_Current, ACBO, AnySentiment, Important_Research)
#define s3_Important_Corp_News Source3(News_Current, ACBO, AnySentiment, Important_Corp_News)
#define s3_Important_Dividends Source3(News_Current, ACBO, AnySentiment, Important_Dividends)
#define s3_Important_Downgrades Source3(News_Current, ACBO, AnySentiment, Important_Downgrades)
#define s3_Important_Earnings Source3(News_Current, ACBO, AnySentiment, Important_Earnings)
#define s3_Important_FDA_News Source3(News_Current, ACBO, AnySentiment, Important_FDA_News)
#define s3_Important_Guidance Source3(News_Current, ACBO, AnySentiment, Important_Guidance)
#define s3_Important_Hedge_Fund_News Source3(News_Current, ACBO, AnySentiment, Important_Hedge_Fund_News)
#define s3_Important_Insider_Trades Source3(News_Current, ACBO, AnySentiment, Important_Insider_Trades)
#define s3_Important_IPOs Source3(News_Current, ACBO, AnySentiment, Important_IPOs)
#define s3_Important_MNA Source3(News_Current, ACBO, AnySentiment, Important_MNA)
#define s3_Important_Mgmt_Changes Source3(News_Current, ACBO, AnySentiment, Important_Mgmt_Changes)
#define s3_Important_Initiations Source3(News_Current, ACBO, AnySentiment, Important_Initiations)
#define s3_Important_Upgrades Source3(News_Current, ACBO, AnySentiment, Important_Upgrades)
#define s3_Index_Changes Source3(News_Current, ACBO, AnySentiment, Index_Changes)
#define s3_Insider_Trades Source3(News_Current, ACBO, AnySentiment, Insider_Trades)
#define s3_Foreign_Ratings_Actions Source3(News_Current, ACBO, AnySentiment, Foreign_Ratings_Actions)
#define s3_IPOs Source3(News_Current, ACBO, AnySentiment, IPOs)
#define s3_Legal_News Source3(News_Current, ACBO, AnySentiment, Legal_News)
#define s3_Mgmt_Changes Source3(News_Current, ACBO, AnySentiment, Mgmt_Changes)
#define s3_Mgmt_Comments Source3(News_Current, ACBO, AnySentiment, Mgmt_Comments)
#define s3_MNA Source3(News_Current, ACBO, AnySentiment, MNA)
#define s3_Initiations Source3(News_Current, ACBO, AnySentiment, Initiations)
#define s3_Option_News Source3(News_Current, ACBO, AnySentiment, Option_News)
#define s3_Political_News Source3(News_Current, ACBO, AnySentiment, Political_News)
#define s3_Private_Equity_News Source3(News_Current, ACBO, AnySentiment, Private_Equity_News)
#define s3_Retail_Sales Source3(News_Current, ACBO, AnySentiment, Retail_Sales)
#define s3_Reuters Source3(News_Current, ACBO, AnySentiment, Reuters)
#define s3_Rumors Source3(News_Current, ACBO, AnySentiment, Rumors)
#define s3_Short Source3(News_Current, ACBO, AnySentiment, Short)
#define s3_Special_Dividends Source3(News_Current, ACBO, AnySentiment, Special_Dividends)
#define s3_Spinoff_News Source3(News_Current, ACBO, AnySentiment, Spinoff_News)
#define s3_Buybacks Source3(News_Current, ACBO, AnySentiment, Buybacks)
#define s3_Stock_Splits Source3(News_Current, ACBO, AnySentiment, Stock_Splits)
#define s3_Popular_News Source3(News_Current, ACBO, AnySentiment, Popular_News)
#define s3_Halts Source3(News_Current, ACBO, AnySentiment, Halts)
#define s3_Upgrades Source3(News_Current, ACBO, AnySentiment, Upgrades)
#define s3_SEC_Filings Source3(News_Current, ACBO, AnySentiment, SEC_Filings)
#define s3_Technical_News Source3(News_Current, ACBO, AnySentiment, Technical_News)
#define s3_Uncategorized_News Source3(News_Current, ACBO, AnySentiment, Uncategorized_News)
#define s3_Stock_Moving_News Source3(News_Current, ACBO, AnySentiment, Stock_Moving_News)
#define s3_Analyst_News Source3(News_Current, ACBO, AnySentiment, Analyst_News)
#define s3_Edgar_Filings Source3(News_Current, ACBO, AnySentiment, Edgar_Filings)
#define s3_AnyNewsType Source3(News_Current, ACBO, AnySentiment, AnyNewsType)
// take ACBO
#define conference_call(x) ConferenceCall(News_Current, x, Any)
#define conference_call_mkt_hrs ConferenceCall(News_Current, MarketHours, Any)
#define conference_call_time ConferenceCallTime(News_Current, MarketHours, EarningsCall)

// briefing_news takes True or False
#define briefing_news(x) StockNewsEvent(News_Current, ACBO, x)
#define source3_news Source3(News_Current, ACBO, AnySentiment, AnyNewsType)
// takes ACBO ...
#define fly_news(x) StockNews(News_Current, x, AnySentiment, AnyNewsType)
#define has_news (source3_news or fly_news(ACBO) or briefing_news(True))
#define has_no_news (not general_news and briefing_news(False) and horizon_earnings(ACBO, False) and not trade_news(ACBO) and not fly_news(ACBO) and not conference_call(ACBO))
// trade_news was discontinued OCT 2018, so just use for back testing
#define trade_news(x) TradeNews(News_Current, x, AnySentiment, AnyNewsType)
