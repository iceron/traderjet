void symbolSet(string symbol=""){
   if (symbol=="") tickSymbol = symbol();
   else tickSymbol = symbol;
}

void symbolGet(){
   refreshRates();   
   tickTime              = marketInfo(tickSymbol, MODE_TIME);   
   tickPoint             = marketInfo(tickSymbol, MODE_POINT);
   tickDigits            = marketInfo(tickSymbol, MODE_DIGITS);
   tickSpread            = marketInfo(tickSymbol, MODE_SPREAD);   
   tickBid               = NormalizeDouble(marketInfo(tickSymbol, MODE_BID), tickDigits);
   tickAsk               = NormalizeDouble(marketInfo(tickSymbol, MODE_ASK), tickDigits);   
   tickStopLevel         = marketInfo(tickSymbol, MODE_STOPLEVEL);
   tickLotSize           = marketInfo(tickSymbol, MODE_LOTSIZE);
   tickValue             = marketInfo(tickSymbol, MODE_TICKVALUE);
   tickSize              = marketInfo(tickSymbol, MODE_TICKSIZE);
   tickSwapLong          = marketInfo(tickSymbol, MODE_SWAPLONG);
   tickSwapShort         = marketInfo(tickSymbol, MODE_SWAPSHORT);
   tickStarting          = marketInfo(tickSymbol, MODE_STARTING);
   tickTradeAllowed      = marketInfo(tickSymbol, MODE_TRADEALLOWED);
   tickExpiration        = marketInfo(tickSymbol, MODE_EXPIRATION);
   tickMinLot            = marketInfo(tickSymbol, MODE_MINLOT);
   tickLotStep           = marketInfo(tickSymbol, MODE_LOTSTEP);
   tickMaxLot            = marketInfo(tickSymbol, MODE_MAXLOT);
   tickSwapType          = marketInfo(tickSymbol, MODE_SWAPTYPE);
   tickProfitCalcMode    = marketInfo(tickSymbol, MODE_PROFITCALCMODE);
   tickMarginCalcMode    = marketInfo(tickSymbol, MODE_MARGINCALCMODE);
   tickMarginMaintenance = marketInfo(tickSymbol, MODE_MARGINMAINTENANCE);
   tickMarginRequired    = marketInfo(tickSymbol, MODE_MARGINREQUIRED);
   tickFreezeLevel       = marketInfo(tickSymbol, MODE_FREEZELEVEL);   
   tickSymbolRaw        = symbolRaw(tickSymbol);  
   tickSymbolPrefix     = symbolPrefix(tickSymbol,tickSymbolRaw);
   tickSymbolSuffix     = symbolSuffix(tickSymbol,tickSymbolRaw);
   serverECNEnabled = serverIsECN();   
   if (serverIsFractional()) serverFractional();
   else serverNoFractional();    
   tickVolumePrecision = serverPrecision(tickMinLot);   
}