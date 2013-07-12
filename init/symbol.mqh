void symbolSet(string symbol=""){
   if (symbol=="") tickSymbol = Symbol();
   else tickSymbol = symbol;
}

void symbolGet(){
   RefreshRates();
   tickTime              = MarketInfo(tickSymbol, MODE_TIME);
   tickPoint             = MarketInfo(tickSymbol, MODE_POINT);
   tickDigits            = MarketInfo(tickSymbol, MODE_DIGITS);
   tickSpread            = MarketInfo(tickSymbol, MODE_SPREAD);
   tickBid               = NormalizeDouble(MarketInfo(tickSymbol, MODE_BID), tickDigits);
   tickAsk               = NormalizeDouble(MarketInfo(tickSymbol, MODE_ASK), tickDigits);   
   tickStopLevel         = MarketInfo(tickSymbol, MODE_STOPLEVEL);
   tickLotSize           = MarketInfo(tickSymbol, MODE_LOTSIZE);
   tickValue             = MarketInfo(tickSymbol, MODE_TICKVALUE);
   tickSize              = MarketInfo(tickSymbol, MODE_TICKSIZE);
   tickSwapLong          = MarketInfo(tickSymbol, MODE_SWAPLONG);
   tickSwapShort         = MarketInfo(tickSymbol, MODE_SWAPSHORT);
   tickStarting          = MarketInfo(tickSymbol, MODE_STARTING);
   tickTradeAllowed      = MarketInfo(tickSymbol, MODE_TRADEALLOWED);
   tickExpiration        = MarketInfo(tickSymbol, MODE_EXPIRATION);
   tickMinLot            = MarketInfo(tickSymbol, MODE_MINLOT);
   tickLotStep           = MarketInfo(tickSymbol, MODE_LOTSTEP);
   tickMaxLot            = MarketInfo(tickSymbol, MODE_MAXLOT);
   tickSwapType          = MarketInfo(tickSymbol, MODE_SWAPTYPE);
   tickProfitCalcMode    = MarketInfo(tickSymbol, MODE_PROFITCALCMODE);
   tickMarginCalcMode    = MarketInfo(tickSymbol, MODE_MARGINCALCMODE);
   tickMarginMaintenance = MarketInfo(tickSymbol, MODE_MARGINMAINTENANCE);
   tickMarginRequired    = MarketInfo(tickSymbol, MODE_MARGINREQUIRED);
   tickFreezeLevel       = MarketInfo(tickSymbol, MODE_FREEZELEVEL);
   tickSymbolRaw        = symbolRaw(tickSymbol);
   tickSymbolPrefix     = symbolPrefix(tickSymbol,tickSymbolRaw);
   tickSymbolSuffix     = symbolSuffix(tickSymbol,tickSymbolRaw);
   serverECNEnabled = serverIsECN();   
   if (serverIsFractional()) serverFractional();
   else serverNoFractional();    
   tickVolumePrecision = serverPrecision(tickMinLot);
}