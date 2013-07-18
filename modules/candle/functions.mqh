double candlePrice(int type,int shift,string symbol="",int timeframe=0)   {
   switch(type)   {
      case PRICE_CLOSE: return(candleClose(shift,symbol,timeframe));
      case PRICE_OPEN:  return(candleOpen(shift,symbol,timeframe));
      case PRICE_HIGH:  return(candleHigh(shift,symbol,timeframe));
      case PRICE_LOW:   return(candleLow(shift,symbol,timeframe));
      default: printOut("candlePrice","invalid type for candle price function");
   }
   return(0);
}

double candleClose(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cClose(symbol,timeframe,shift));
}

double candleOpen(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cOpen(symbol,timeframe,shift));
}

double candleHigh(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cHigh(symbol,timeframe,shift));
}

double candleLow(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cLow(symbol,timeframe,shift));
}

datetime candleTime(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cTime(symbol,timeframe,shift));
}