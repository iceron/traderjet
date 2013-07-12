double candle(int price,int shift=1,string symbol="",int timeframe=0)   {
   if (symbol=="") symbol = tickSymbol;
   switch(price)  {
      case PRICE_CLOSE: return(iClose(symbol,timeframe,shift));
      case PRICE_OPEN:  return(iOpen(symbol,timeframe,shift));
      case PRICE_HIGH:  return(iHigh(symbol,timeframe,shift));
      case PRICE_LOW:   return(iLow(symbol,timeframe,shift));
      default: {          
         Print("invalid price reference");
         return(0);
      }   
   }
}

bool barIsNew(int& timeframe) {
   static datetime last;
   static string symbol;
   datetime open = iTime(tickSymbol,timeframe,0);
   if (symbol!=tickSymbol)   {
      last = 0;
      symbol = tickSymbol;
   }      
   if (last==0)   {
      last = open;
      return(true);
   }   
   return(false);
}