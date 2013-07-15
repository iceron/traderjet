int tBars(string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iBars(symbol,timeframe));
}

int tBarShift(string symbol,int timeframe,datetime time,bool exact=false)   {
   return(iBarShift(symbol,timeframe,time,exact));
}

double tClose(string symbol,int timeframe,int shift)   {
   return(iClose(symbol,timeframe,shift));
}

double tHigh(string symbol,int timeframe,int shift)   {
   return(iHigh(symbol,timeframe,shift));
}

double tLow(string symbol,int timeframe,int shift)   {
   return(iLow(symbol,timeframe,shift));
}

double tOpen(string symbol,int timeframe,int shift)   {
   return(iOpen(symbol,timeframe,shift));
}

int tHighest(string symbol,int timeframe,int type,int count=WHOLE_ARRAY,int start=0) {
   return(iHighest(symbol,timeframe,type,count));
}

int tLowest(string symbol,int timeframe,int type,int count=WHOLE_ARRAY,int start=0) {
   return(iLowest(symbol,timeframe,type,count));
}

datetime tTime(string symbol,int timeframe,int shift)  {
   return(iTime(symbol,timeframe,shift));
}

double tVolume(string symbol,int timeframe,int shift)  {
   return(iVolume(symbol,timeframe,shift));
}