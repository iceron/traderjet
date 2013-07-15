double candle(int price,int shift=1,string symbol="",int timeframe=0)   {
   if (symbol=="") symbol = tickSymbol;
   switch(price)  {
      case PRICE_CLOSE: return(cClose(symbol,timeframe,shift));
      case PRICE_OPEN:  return(cOpen(symbol,timeframe,shift));
      case PRICE_HIGH:  return(cHigh(symbol,timeframe,shift));
      case PRICE_LOW:   return(cLow(symbol,timeframe,shift));
      default: {          
         print("invalid price reference");
         return(0);
      }   
   }
}

bool barIsNew(int& timeframe) {
   static datetime last;
   static string symbol;   
   if (symbol!=tickSymbol)   {
      last = 0;
      symbol = tickSymbol;
   }      
   datetime open = cTime(tickSymbol,timeframe,0);
   if (last==0)   {
      last = open;
      return(true);
   }   
   return(false);
}

int barMatch(string symbol1,int timeframe1,int shift1,string symbol2,int timeframe2)   {
   datetime time1 = cTime(symbol1,timeframe1,shift1);
   return(cBarShift(symbol2,timeframe2,time1));  
}

