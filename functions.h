// Preprocessor function
// keep this open at all times for autocomplete
// Autofill keywords
// BUY
// CSFB
// LIMIT
// OPG
// PERIOD_7
// PERIOD_20
// PlainVanilla
// PRIMUS_AEL
// SECONDS
// SELL
// SHORT
// TIF_OPENING

#define between(x, y, z) y > x AND y < z
#define between_(x, y, z) y >= x AND y <= z
#define and2(a,b) a AND b
#define and3(a,b,c) a AND b AND c
#define and4(a,b,c,d) a AND b AND c AND d
#define and5(a,b,c,d,e) a AND b AND c AND d AND e
#define and6(a,b,c,d,e,f) a AND b AND c AND d AND e AND f
#define max2(x,y) IF(x>y,x,y)
#define max3(x,y,z) max2(max2(x,y),z)
#define max4(a,b,c,d) max2(max2(a,b),max2(c,d))
#define max5(a,b,c,d,e) max2(max4(a,b,c,d),e)
#define max6(a,b,c,d,e,f) max2(max4(a,b,c,d),max2(e,f))
#define min2(x,y) IF(x<y,x,y)
#define min3(x,y,z) min2(min2(x,y),z)
#define min4(a,b,c,d) min2(min2(a,b),min2(c,d))
#define min5(a,b,c,d,e) min2(min4(a,b,c,d),e)
#define min6(a,b,c,d,e,f) min2(min4(a,b,c,d),min2(e,f))
#define or2(a,b) (a OR b)
#define or3(a,b,c) (a OR b OR c)
#define or4(a,b,c,d) (a OR b OR c OR d)
#define or5(a,b,c,d,e) (a OR b OR c OR d OR e)
#define or6(a,b,c,d,e,f) (a OR b OR c OR d OR e OR f)
#define and AND
#define or OR
#define not NOT
#define p1 P1
#define p2 P2
#define p3 P3
#define p4 P4
#define p5 P5
#define close AdjustedClosePrice(P1)
// takes P1 to P5
#define close_prv(x) AdjustedClosePrice(x)
#define ask Ask(INSIDE, CURRENT, NO)
#define ask_pre_mkt Ask(INSIDE, CURRENT, YES)
#define adr(x) AvgDailyRange(ALL_VENUES, x, NO)
#define adv(x) AvgDayVolume(ALL_VENUES, x, NO)
#define atr(x) ATRStock(ALL_VENUES, NO, DAILY, x, CURRENT)
#define atr_ext(x) ATRStock(ALL_VENUES, YES, DAILY, x, CURRENT)
#define atr_5(x) ATRStock(ALL_VENUES, NO, MINUTES_5, x, CURRENT)
#define avg(x,y) ((x+y)/2)
#define avg_open_size(x) AvgOpenPrintSize(x)
#define avg_volume_till_now(x) (AvgDayVolume(ALL_VENUES, x, NO)/390) * (TimeFromStockOpenSeconds/60)
#define bid Bid(INSIDE, CURRENT, NO)
#define bid_pre_mkt Bid(INSIDE, CURRENT, YES)
#define cd CurrentDate
#define change_from_entry PositionDelta(ALL_VENUES, NO)
#define unadjusted_close ClosePrice(PRIMARY, P1, NO)
#define unadjusted_close_prv(x) ClosePrice(PRIMARY, x, NO)
// takes PERIOD_7 14 20 50 100 200
#define SMA_daily(x) SMAStock(ALL_VENUES, NO, DAILY, x, CURRENT)
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
#define day_high DayHigh(ALL_VENUES,1,CURRENT,NO)
#define day_low DayLow(ALL_VENUES,1,CURRENT,NO)
#define day_high_ext DayHigh(ALL_VENUES,1,CURRENT,YES)
#define day_low_ext DayLow(ALL_VENUES,1,CURRENT,YES)
#define day_high_prv(x) DayHigh(ALL_VENUES,1,x,NO)
#define day_low_prv(x) DayLow(ALL_VENUES,1,x,NO)
#define day_high_ext_prv(x) DayHigh(ALL_VENUES,1,x,YES)
#define day_low_ext_prv(x) DayLow(ALL_VENUES,1,x,YES)
#define day_range (DayHigh(ALL_VENUES,1,CURRENT,NO) - DayLow(ALL_VENUES,1,CURRENT,NO))
#define day_range_ext (DayHigh(ALL_VENUES,1,CURRENT,YES)- DayLow(ALL_VENUES,1,CURRENT,YES))
#define day_range_prv(x) (DayHigh(ALL_VENUES,1,x,NO) - DayLow(ALL_VENUES,1,x,NO))
#define day_range_ext_prv(x) (DayHigh(ALL_VENUES,1,x,YES)-DayLow(ALL_VENUES,1,x,YES))
#define day_volume DayVolume(ALL_VENUES,1,CURRENT,NO)
#define entries EntriesCount(HOURS, 8)
#define entry_time_sec PositionEntryTime
#define entry_trigs_day EntryTriggersCount(HOURS, 8)
#define entry_trigs_sec(x) EntryTriggersCount(SECONDS, x)
#define entry_trigs_min(x) EntryTriggersCount(MINUTES, x)
#define entry_trigs_hr(x) EntryTriggersCount(HOURS, x)
#define ETF EXCHANGE_TRADED_FUND
#define ETN EXCHANGE_TRADED_NOTE
#define etp_prefered_exclude  NOT IsInstrumentType(EXCHANGE_TRADED_FUND) AND NOT IsInstrumentType(EXCHANGE_TRADED_NOTE) AND NOT IsInstrumentType(PREFERRED_STOCK)
#define execution ExecutionPrice
#define exchange(x) PrimaryExchange(x)
#define imbalance_buy_vol(x) ImbalanceBuyVolume(x)
#define imbalance_sell_vol(x) ImbalanceSellVolume(x)
#define imbalance_paired_vol ImbPair
#define imbalance_at(x) ImbalanceAt(x)
#define initiated  (StockNews(News_Current, ACBO, AnySentiment, Initiation) OR  Source3(News_Current, ACBO, AnySentiment, Initiations))
#define instrument_type(x) IsInstrumentType(x)
#define is_halted IsHalt
#define is_hard_to_borrow IsHardToBorrow
#define last Last(ALL_VENUES,CURRENT,NO)
#define last_pre_mkt Last(ALL_VENUES,CURRENT,YES)
#define minimum_days_from_ipo(x) (DaysFromIPO > x OR DaysFromIPO < 0)
#define minute_high(x) MinuteHigh(ALL_VENUES, x, CURRENT, NO, True)
#define minute_low(x) MinuteLow(ALL_VENUES, x, CURRENT, NO, True)
// take minute and P1-P5
#define minute_high_prv(x, y) MinuteHigh(ALL_VENUES, x, y, NO, True)
#define minute_low_prv(x, y) MinuteLow(ALL_VENUES, x, y, NO, True)
#define minute_range(x) (minute_high(x) - minute_low(x))
#define minute_high_I_prv(x, y) MinuteHigh_I(ALL_VENUES, x, y, NO, True)
#define minute_low_I_prv(x, y) MinuteLow_I(ALL_VENUES, x, y, NO, True)
#define minute_high_I_prv_dis(x, y) MinuteHigh_I(ALL_VENUES, x, y, NO, True)
#define minute_low_I_prv_dis(x, y) MinuteLow_I(ALL_VENUES, x, y, NO, True)
#define higher_lows_P1_P5(x) MinuteLow_I(ALL_VENUES, x, P4, NO, True) > MinuteLow_I(ALL_VENUES, x, P5, NO, True) AND MinuteLow_I(ALL_VENUES, x, P3, NO, True) > MinuteLow_I(ALL_VENUES, x, P4, NO, True) AND MinuteLow_I(ALL_VENUES, x, P2, NO, True) > MinuteLow_I(ALL_VENUES, x, P3, NO, True) AND MinuteLow_I(ALL_VENUES, x, P1, NO, True) > MinuteLow_I(ALL_VENUES, x, P2, NO, True)
#define lower_highs_P1_P5(x) MinuteHigh_I(ALL_VENUES, x, P4, NO, True) < MinuteHigh_I(ALL_VENUES, x, P5, NO, True) AND MinuteHigh_I(ALL_VENUES, x, P3, NO, True) < MinuteHigh_I(ALL_VENUES, x, P4, NO, True) AND MinuteHigh_I(ALL_VENUES, x, P2, NO, True) < MinuteHigh_I(ALL_VENUES, x, P3, NO, True) AND MinuteHigh_I(ALL_VENUES, x, P1, NO, True) < MinuteHigh_I(ALL_VENUES, x, P2, NO, True)
#define minute_high_ext_dv(x) MinuteHigh(ALL_VENUES, x, CURRENT, YES, True)
#define minute_low_ext_dv(x) MinuteLow(ALL_VENUES, x, CURRENT, YES, True)
#define minute_range_ext_dv(x) (MinuteHigh(ALL_VENUES, x, CURRENT, YES, True) - MinuteLow(ALL_VENUES, x, CURRENT, YES, True))
#define minute_high_ext(x) MinuteHigh(ALL_VENUES, x, CURRENT, YES, False)
#define minute_low_ext(x) MinuteLow(ALL_VENUES, x, CURRENT, YES, False)
#define minute_range_ext(x) (MinuteHigh(ALL_VENUES, x, CURRENT, YES, False) - MinuteLow(ALL_VENUES, x, CURRENT, YES, False))
#define min_range_p1_p5(x) day_range_prv(P1) > x and day_range_prv(P2) > x and day_range_prv(P3) > x and day_range_prv(P4) > x and day_range_prv(P5) > x
#define min_vol_p1_p5(x) volume(P1) > x AND volume(P2) > x AND volume(P3) > x AND volume(P4) > x AND volume(P5) > x
#define new_high NewDayHigh(1, NO)
#define new_low NewDayLow(1, NO)
#define not_exdiv AdjustedClosePrice(p1) = ClosePrice(PRIMARY, p1, NO)
#define open OpenPrice(PRIMARY, CURRENT, NO)
#define open_prv(x) OpenPrice(PRIMARY, x, NO)
#define post_close_volume DayBar_VolumeP(ALL_VENUES, 1, YES, '16:05-19:59', P1)
#define position_count_open PositionCount(OPEN)
#define pre_mkt_perc_chg ((day_bar_close(1, '08:00-09:27') - close)/close)
#define pre_mkt_volume DayBar_Volume(ALL_VENUES, 1, YES, '04:00-09:27')
#define price_delta(x) PriceDelta(ALL_VENUES, x, NO)
// formula, period 0tick else minute, top x, validity margin
#define rank(a,b,c,d) IsInRanking(a,b,c,d)
#define time_minute TickTime
#define time_sec TickTimeSeconds
#define time_in_position_sec time_sec - entry_time_sec
#define time_from_open TimeFromStockOpenSeconds // use with MINUTES
#define time_from_open_sec TimeFromStockOpenSeconds
#define time_from_open_minutes (TimeFromStockOpenSeconds/60)
#define volume(x) DayVolume(ALL_VENUES, 1, x, NO)
// news
#define general_news GeneralNews(News_Current, ACBO, AnySentiment, AnyGeneralNewsType)
// horizon_earnings takes ACBO, AfterClose BeforeOpen and True False
#define horizon_earnings(x, y) EarningsNewsEvent(News_Current,x,y,Any)
#define source3_earnings Source3(News_Current, ACBO, AnySentiment, Earnings)
#define has_earnings (horizon_earnings(ACBO, True) or source3_earnings)
#define has_earnings_prv ( EarningsNewsEvent(News_P1, ACBO, True, Any)  or  Source3(News_P1, ACBO, AnySentiment, Earnings))
#define has_earnings_AC (EarningsNewsEvent(News_P1, AfterClose, True, Any) or Source3(News_P1, AfterClose, AnySentiment, Earnings))
#define has_earnings_BO (EarningsNewsEvent(News_Current, BeforeOpen, True,  Any) or Source3(News_Current, BeforeOpen, AnySentiment, Earnings))
#define option_news Option_News
#define ns(x) NewsSearch(News_Current, ACBO, Source4, AnyGeneralNewsType, AnySentiment, SummaryAndDetails, x)
#define managment_change Mgmt_Changes
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
#define s3_Dividendjncrease Source3(News_Current, ACBO, AnySentiment, Dividendjncrease)
#define s3_Dividends Source3(News_Current, ACBO, AnySentiment, Dividends)
#define s3_Downgrades Source3(News_Current, ACBO, AnySentiment, Downgrades)
#define s3_Earnings Source3(News_Current, ACBO, AnySentiment, Earnings)
#define s3_Economic_Events Source3(News_Current, ACBO, AnySentiment, Economic_Events)
#define s3_Equity _Offerings Source3(News_Current, ACBO, AnySentiment, Equity _Offerings)
#define s3_ETF_News Source3(News_Current, ACBO, AnySentiment, ETF_News)
#define s3_FDA_News Source3(News_Current, ACBO, AnySentiment, FDA_News)
#define s3_FOMC_News Source3(News_Current, ACBO, AnySentiment, FOMC_News)
#define s3_FX_News Source3(News_Current, ACBO, AnySentiment, FX_News)
#define s3_General_News Source3(News_Current, ACBO, AnySentiment, General_News)
#define s3_Guidance Source3(News_Current, ACBO, AnySentiment, Guidance)
#define s3_Hedge_Fund_News Source3(News_Current, ACBO, AnySentiment, Hedge_Fund_News)
#define s3_lmportant_Buybacks Source3(News_Current, ACBO, AnySentiment, lmportant_Buybacks)
#define s3_Important Source3(News_Current, ACBO, AnySentiment, Important)
#define s3_lmportant_Research Source3(News_Current, ACBO, AnySentiment, lmportant_Research)
#define s3_lmportant_Corp_News Source3(News_Current, ACBO, AnySentiment, lmportant_Corp_News)
#define s3_lmportant_Dividends Source3(News_Current, ACBO, AnySentiment, lmportant_Dividends)
#define s3_lmportant_Downgrades Source3(News_Current, ACBO, AnySentiment, lmportant_Downgrades)
#define s3_lmportant_Eamings Source3(News_Current, ACBO, AnySentiment, lmportant_Eamings)
#define s3_lmportant_FDA_News Source3(News_Current, ACBO, AnySentiment, lmportant_FDA_News)
#define s3_lmportant_Guidance Source3(News_Current, ACBO, AnySentiment, lmportant_Guidance)
#define s3_lmpoitant_Hedge_Fund_News Source3(News_Current, ACBO, AnySentiment, lmpoitant_Hedge_Fund_News)
#define s3_lmportant_lnsider_Trades Source3(News_Current, ACBO, AnySentiment, lmportant_lnsider_Trades)
#define s3_Important_IPOs Source3(News_Current, ACBO, AnySentiment, Important _IPOs)
#define s3_lmportant_MNA Source3(News_Current, ACBO, AnySentiment, lmportant_MNA)
#define s3_lmportant_Mgmt_Changes Source3(News_Current, ACBO, AnySentiment, lmportant_Mgmt_Changes)
#define s3_Important_Initiations Source3(News_Current, ACBO, AnySentiment, Important_Initiations)
#define s3_lmportant_Upgrades Source3(News_Current, ACBO, AnySentiment, lmportant_Upgrades)
#define s3_lndex_Changes Source3(News_Current, ACBO, AnySentiment, lndex_Changes)
#define s3_lnsider_Trades Source3(News_Current, ACBO, AnySentiment, lnsider_Trades)
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

// briefing_news takes True or False
#define briefing_news(x) StockNewsEvent(News_Current, ACBO, x)
#define source3_news Source3(News_Current, ACBO, AnySentiment, AnyNewsType)
// takes ACBO ...
#define fly_news(x) StockNews(News_Current, x, AnySentiment, AnyNewsType)
#define has_news (source3_news or fly_news or briefing_news)
#define has_no_news (not general_news and briefing_news(False) and horizon_earnings(ACBO, False) and not trade_news(ACBO) and not fly_news(ACBO) and not conference_call(ACBO))
// trade_news was discontinued OCT 2018, so just use for back testing
#define trade_news(x) TradeNews(News_Current, x, AnySentiment, AnyNewsType)

// functions of functions
#define ref_stock_n(x, y) RefStockNumericValue(x, y)
#define ref_stock_l(x, y)  RefStockLogicalValue(x, y)
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
#define SPY_n(x) RefStockNumericValue('SPY', x)
#define USO_n(x) RefStockNumericValue('USO', x)

#define pre_mkt_high DayBar_High(ALL_VENUES, 1, YES, '08:00-09:27')
#define pre_mkt_low DayBar_Low(ALL_VENUES, 1, YES, '08:00-09:27')
#define pre_mkt_range pre_mkt_high - pre_mkt_low
#define pre_mkt_price DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:27')
#define pre_mkt_last day_bar_close( 1, '08:00-09:27')
#define pre_mkt_avg_hlc (DayBar_High(ALL_VENUES, 1, YES, '08:00-09:27')+DayBar_Low(ALL_VENUES, 1, YES, '08:00-09:27')+DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:27'))/3
#define post_mkt_high DayBar_HighP(ALL_VENUES, 1, YES, '16:00-20:00', P1)
#define post_mkt_low DayBar_LowP(ALL_VENUES, 1, YES, '16:00-20:00', P1)
#define post_mkt_range (post_mkt_high - post_mkt_low)
#define post_mkt_close DayBar_CloseP(ALL_VENUES, 1, YES, '16:00-20:00', P1)
#define spy_premkt_perc_chg ((SPY_n(DayBar_Close(ALL_VENUES, 1, YES, '08:00-09:27'))-SPY_n(close))/SPY_n(close))
#define spy_adjusted_close (close * (1 + spy_premkt_perc_chg))
#define spread ask - bid
// nested ifs
#define if IF
#define if2(x, y, x2, y2, z) IF(x, y, IF(x2, y2, z))
#define if3(x, y, x2, y2, x3, y3, z) IF(x, y, IF(x2, y2, IF(x3, y3, z)))
#define if4(x, y, x2, y2, x3, y3, x4, y4, z) IF(x, y, IF(x2, y2, IF(x3, y3, IF(x4, y4, z))))
#define if5(x, y, x2, y2, x3, y3, x4, y4, x5, y5, z) IF(x, y, IF(x2, y2, IF(x3, y3, IF(x4, y4, IF(x5, y5, z)))))
#define if6(x, y, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, z) IF(x, y, IF(x2, y2, IF(x3, y3, IF(x4, y4, IF(x5, y5, IF(x6, y6, z))))))
#define if7(x, y, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, z) IF(x, y, IF(x2, y2, IF(x3, y3, IF(x4, y4, IF(x5, y5, IF(x6, y6, IF(x7, y7, z)))))))
#define if8(x, y, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, z) IF(x, y, IF(x2, y2, IF(x3, y3, IF(x4, y4, IF(x5, y5, IF(x6, y6, IF(x7, y7, IF(x8, y8, z))))))))
// Launch Rules
#define y11 (cd >= .2011-01-01. and cd <= .2011-12-31.)
#define y12 (cd >= .2012-01-01. and cd <= .2012-12-31.)
#define y13 (cd >= .2013-01-01. and cd <= .2013-12-31.)
#define y14 (cd >= .2014-01-01. and cd <= .2014-12-31.)
#define y15 (cd >= .2015-01-01. and cd <= .2015-12-31.)
#define y16 (cd >= .2016-01-01. and cd <= .2016-12-31.)
#define y17 (cd >= .2017-01-01. and cd <= .2017-12-31.)
#define y18 (cd >= .2018-01-01. and cd <= .2018-12-31.)

#define m1201 (cd >= .2012-01-01. and cd <= .2012-01-31.)
#define m1202 (cd >= .2012-02-01. and cd <= .2012-02-28.)
#define m1203 (cd >= .2012-03-01. and cd <= .2012-03-31.)
#define m1204 (cd >= .2012-04-01. and cd <= .2012-04-30.)
#define m1205 (cd >= .2012-05-01. and cd <= .2012-05-31.)
#define m1206 (cd >= .2012-06-01. and cd <= .2012-06-30.)
#define m1207 (cd >= .2012-07-01. and cd <= .2012-07-31.)
#define m1208 (cd >= .2012-08-01. and cd <= .2012-08-31.)
#define m1209 (cd >= .2012-09-01. and cd <= .2012-09-30.)
#define m1210 (cd >= .2012-10-01. and cd <= .2012-10-31.)
#define m1211 (cd >= .2012-11-01. and cd <= .2012-11-30.)
#define m1212 (cd >= .2012-12-01. and cd <= .2012-12-31.)

#define m1301 (cd >= .2013-01-01. and cd <= .2013-01-31.)
#define m1302 (cd >= .2013-02-01. and cd <= .2013-02-28.)
#define m1303 (cd >= .2013-03-01. and cd <= .2013-03-31.)
#define m1304 (cd >= .2013-04-01. and cd <= .2013-04-30.)
#define m1305 (cd >= .2013-05-01. and cd <= .2013-05-31.)
#define m1306 (cd >= .2013-06-01. and cd <= .2013-06-30.)
#define m1307 (cd >= .2013-07-01. and cd <= .2013-07-31.)
#define m1308 (cd >= .2013-08-01. and cd <= .2013-08-31.)
#define m1309 (cd >= .2013-09-01. and cd <= .2013-09-30.)
#define m1310 (cd >= .2013-10-01. and cd <= .2013-10-31.)
#define m1311 (cd >= .2013-11-01. and cd <= .2013-11-30.)
#define m1312 (cd >= .2013-12-01. and cd <= .2013-12-31.)

#define m1401 (cd >= .2014-01-01. and cd <= .2014-01-31.)
#define m1402 (cd >= .2014-02-01. and cd <= .2014-02-28.)
#define m1403 (cd >= .2014-03-01. and cd <= .2014-03-31.)
#define m1404 (cd >= .2014-04-01. and cd <= .2014-04-30.)
#define m1405 (cd >= .2014-05-01. and cd <= .2014-05-31.)
#define m1406 (cd >= .2014-06-01. and cd <= .2014-06-30.)
#define m1407 (cd >= .2014-07-01. and cd <= .2014-07-31.)
#define m1408 (cd >= .2014-08-01. and cd <= .2014-08-31.)
#define m1409 (cd >= .2014-09-01. and cd <= .2014-09-30.)
#define m1410 (cd >= .2014-10-01. and cd <= .2014-10-31.)
#define m1411 (cd >= .2014-11-01. and cd <= .2014-11-30.)
#define m1412 (cd >= .2014-12-01. and cd <= .2014-12-31.)

#define m1501 (cd >= .2015-01-01. and cd <= .2015-01-31.)
#define m1502 (cd >= .2015-02-01. and cd <= .2015-02-28.)
#define m1503 (cd >= .2015-03-01. and cd <= .2015-03-31.)
#define m1504 (cd >= .2015-04-01. and cd <= .2015-04-30.)
#define m1505 (cd >= .2015-05-01. and cd <= .2015-05-31.)
#define m1506 (cd >= .2015-06-01. and cd <= .2015-06-30.)
#define m1507 (cd >= .2015-07-01. and cd <= .2015-07-31.)
#define m1508 (cd >= .2015-08-01. and cd <= .2015-08-31.)
#define m1509 (cd >= .2015-09-01. and cd <= .2015-09-30.)
#define m1510 (cd >= .2015-10-01. and cd <= .2015-10-31.)
#define m1511 (cd >= .2015-11-01. and cd <= .2015-11-30.)
#define m1512 (cd >= .2015-12-01. and cd <= .2015-12-31.)

#define m1601 (cd >= .2016-01-01. and cd <= .2016-01-31.)
#define m1602 (cd >= .2016-02-01. and cd <= .2016-02-28.)
#define m1603 (cd >= .2016-03-01. and cd <= .2016-03-31.)
#define m1604 (cd >= .2016-04-01. and cd <= .2016-04-30.)
#define m1605 (cd >= .2016-05-01. and cd <= .2016-05-31.)
#define m1606 (cd >= .2016-06-01. and cd <= .2016-06-30.)
#define m1607 (cd >= .2016-07-01. and cd <= .2016-07-31.)
#define m1608 (cd >= .2016-08-01. and cd <= .2016-08-31.)
#define m1609 (cd >= .2016-09-01. and cd <= .2016-09-30.)
#define m1610 (cd >= .2016-10-01. and cd <= .2016-10-31.)
#define m1611 (cd >= .2016-11-01. and cd <= .2016-11-30.)
#define m1612 (cd >= .2016-12-01. and cd <= .2016-12-31.)

#define m1701 (cd >= .2017-01-01. and cd <= .2017-01-31.)
#define m1702 (cd >= .2017-02-01. and cd <= .2017-02-28.)
#define m1703 (cd >= .2017-03-01. and cd <= .2017-03-31.)
#define m1704 (cd >= .2017-04-01. and cd <= .2017-04-30.)
#define m1705 (cd >= .2017-05-01. and cd <= .2017-05-31.)
#define m1706 (cd >= .2017-06-01. and cd <= .2017-06-30.)
#define m1707 (cd >= .2017-07-01. and cd <= .2017-07-31.)
#define m1708 (cd >= .2017-08-01. and cd <= .2017-08-31.)
#define m1709 (cd >= .2017-09-01. and cd <= .2017-09-30.)
#define m1710 (cd >= .2017-10-01. and cd <= .2017-10-31.)
#define m1711 (cd >= .2017-11-01. and cd <= .2017-11-30.)
#define m1712 (cd >= .2017-12-01. and cd <= .2017-12-31.)

#define m1801 (cd >= .2018-01-01. and cd <= .2018-01-31.)
#define m1802 (cd >= .2018-02-01. and cd <= .2018-02-28.)
#define m1803 (cd >= .2018-03-01. and cd <= .2018-03-31.)
#define m1804 (cd >= .2018-04-01. and cd <= .2018-04-30.)
#define m1805 (cd >= .2018-05-01. and cd <= .2018-05-31.)
#define m1806 (cd >= .2018-06-01. and cd <= .2018-06-30.)
#define m1807 (cd >= .2018-07-01. and cd <= .2018-07-31.)
#define m1808 (cd >= .2018-08-01. and cd <= .2018-08-31.)
#define m1809 (cd >= .2018-09-01. and cd <= .2018-09-30.)
#define m1810 (cd >= .2018-10-01. and cd <= .2018-10-31.)
#define m1811 (cd >= .2018-11-01. and cd <= .2018-11-30.)
#define m1812 (cd >= .2018-12-01. and cd <= .2018-12-31.)

#define m1901 (cd >= .2019-01-01. and cd <= .2019-01-31.)
#define m1902 (cd >= .2019-02-01. and cd <= .2019-02-28.)
#define m1903 (cd >= .2019-03-01. and cd <= .2019-03-31.)
#define m1904 (cd >= .2019-04-01. and cd <= .2019-04-30.)
#define m1905 (cd >= .2019-05-01. and cd <= .2019-05-31.)
#define m1906 (cd >= .2019-06-01. and cd <= .2019-06-30.)
#define m1907 (cd >= .2019-07-01. and cd <= .2019-07-31.)
#define m1908 (cd >= .2019-08-01. and cd <= .2019-08-31.)
#define m1909 (cd >= .2019-09-01. and cd <= .2019-09-30.)
#define m1910 (cd >= .2019-10-01. and cd <= .2019-10-31.)
#define m1911 (cd >= .2019-11-01. and cd <= .2019-11-30.)
#define m1912 (cd >= .2019-12-01. and cd <= .2019-12-31.)

#define is111 (cd >= .2011-01-15. and cd <= .2011-03-01.)
#define os111 (cd >= .2011-03-02. and cd <= .2011-04-14.)
#define is112 (cd >= .2011-04-15. and cd <= .2011-05-15.)
#define os112 (cd >= .2011-05-16. and cd <= .2011-07-14.)
#define is113 (cd >= .2011-07-15. and cd <= .2011-08-15.)
#define os113 (cd >= .2011-08-16. and cd <= .2011-10-14.)
#define is114 (cd >= .2011-10-15. and cd <= .2011-11-15.)
#define os114 (cd >= .2011-11-16. and cd <= .2012-01-14.)

#define is121 (cd >= .2012-01-15. and cd <= .2012-03-01.)
#define os121 (cd >= .2012-03-02. and cd <= .2012-04-14.)
#define is122 (cd >= .2012-04-15. and cd <= .2012-05-15.)
#define os122 (cd >= .2012-05-16. and cd <= .2012-07-14.)
#define is123 (cd >= .2012-07-15. and cd <= .2012-08-15.)
#define os123 (cd >= .2012-08-16. and cd <= .2012-10-14.)
#define is124 (cd >= .2012-10-15. and cd <= .2012-11-15.)
#define os124 (cd >= .2012-11-16. and cd <= .2013-01-14.)

#define is131 (cd >= .2013-01-15. and cd <= .2013-03-01.)
#define os131 (cd >= .2013-03-02. and cd <= .2013-04-14.)
#define is132 (cd >= .2013-04-15. and cd <= .2013-05-15.)
#define os132 (cd >= .2013-05-16. and cd <= .2013-07-14.)
#define is133 (cd >= .2013-07-15. and cd <= .2013-08-15.)
#define os133 (cd >= .2013-08-16. and cd <= .2013-10-14.)
#define is134 (cd >= .2013-10-15. and cd <= .2013-11-15.)
#define os134 (cd >= .2013-11-16. and cd <= .2014-01-14.)

#define is141 (cd >= .2014-01-15. and cd <= .2014-03-01.)
#define os141 (cd >= .2014-03-02. and cd <= .2014-04-14.)
#define is142 (cd >= .2014-04-15. and cd <= .2014-05-15.)
#define os142 (cd >= .2014-05-16. and cd <= .2014-07-14.)
#define is143 (cd >= .2014-07-15. and cd <= .2014-08-15.)
#define os143 (cd >= .2014-08-16. and cd <= .2014-10-14.)
#define is144 (cd >= .2014-10-15. and cd <= .2014-11-15.)
#define os144 (cd >= .2014-11-16. and cd <= .2015-01-14.)

#define is151 (cd >= .2015-01-15. and cd <= .2015-03-01.)
#define os151 (cd >= .2015-03-02. and cd <= .2015-04-14.)
#define is152 (cd >= .2015-04-15. and cd <= .2015-05-15.)
#define os152 (cd >= .2015-05-16. and cd <= .2015-07-14.)
#define is153 (cd >= .2015-07-15. and cd <= .2015-08-15.)
#define os153 (cd >= .2015-08-16. and cd <= .2015-10-14.)
#define is154 (cd >= .2015-10-15. and cd <= .2015-11-15.)
#define os154 (cd >= .2015-11-16. and cd <= .2016-01-14.)

#define is161 (cd >= .2016-01-15. and cd <= .2016-03-01.)
#define os161 (cd >= .2016-03-02. and cd <= .2016-04-14.)
#define is162 (cd >= .2016-04-15. and cd <= .2016-05-15.)
#define os162 (cd >= .2016-05-16. and cd <= .2016-07-14.)
#define is163 (cd >= .2016-07-15. and cd <= .2016-08-15.)
#define os163 (cd >= .2016-08-16. and cd <= .2016-10-14.)
#define is164 (cd >= .2016-10-15. and cd <= .2016-11-15.)
#define os164 (cd >= .2016-11-16. and cd <= .2017-01-14.)

#define is171 (cd >= .2017-01-15. and cd <= .2017-03-01.)
#define os171 (cd >= .2017-03-02. and cd <= .2017-04-14.)
#define is172 (cd >= .2017-04-15. and cd <= .2017-05-15.)
#define os172 (cd >= .2017-05-16. and cd <= .2017-07-14.)
#define is173 (cd >= .2017-07-15. and cd <= .2017-08-15.)
#define os173 (cd >= .2017-08-16. and cd <= .2017-10-14.)
#define is174 (cd >= .2017-10-15. and cd <= .2017-11-15.)
#define os174 (cd >= .2017-11-16. and cd <= .2018-01-14.)

#define is181 (cd >= .2018-01-15. and cd <= .2018-03-01.)
#define os181 (cd >= .2018-03-02. and cd <= .2018-04-14.)
#define is182 (cd >= .2018-04-15. and cd <= .2018-05-15.)
#define os182 (cd >= .2018-05-16. and cd <= .2018-07-14.)
#define is183 (cd >= .2018-07-15. and cd <= .2018-08-15.)
#define os183 (cd >= .2018-08-16. and cd <= .2018-10-14.)
#define is184 (cd >= .2018-10-15. and cd <= .2018-11-15.)
#define os184 (cd >= .2018-11-16. and cd <= .2019-01-14.)

#define is191 (cd >= .2019-01-15. and cd <= .2019-03-01.)
#define os191 (cd >= .2019-03-02. and cd <= .2019-04-14.)
#define is192 (cd >= .2019-04-15. and cd <= .2019-05-15.)
#define os192 (cd >= .2019-05-16. and cd <= .2019-07-14.)
#define is193 (cd >= .2019-07-15. and cd <= .2019-08-15.)
#define os193 (cd >= .2019-08-16. and cd <= .2019-10-14.)
#define is194 (cd >= .2019-10-15. and cd <= .2019-11-15.)
#define os194 (cd >= .2019-11-16. and cd <= .2020-01-14.)


#define is2011 is111 or is112 or is113 or is114
#define os2011 os111 or os112 or os113 or os114
#define is2012 is121 or is122 or is123 or is124
#define os2012 os121 or os122 or os123 or os124
#define is2013 is131 or is132 or is133 or is134
#define os2013 os131 or os132 or os133 or os134
#define is2014 is141 or is142 or is143 or is144
#define os2014 os141 or os142 or os143 or os144
#define is2015 is151 or is152 or is153 or is154
#define os2015 os151 or os152 or os153 or os154
#define is2016 is161 or is162 or is163 or is164
#define os2016 os161 or os162 or os163 or os164
#define is2017 is171 or is172 or is173 or is174
#define os2017 os171 or os172 or os173 or os174
#define is2018 is181 or is182 or is183 or is184
#define os2018 os181 or os182 or os183 or os184
#define is2019 is191 or is192 or is193 or is194
#define os2019 os191 or os192 or os193 or os194
