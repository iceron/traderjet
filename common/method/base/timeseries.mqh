int cBars(string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iBars(symbol,timeframe));
}

int cBarShift(string symbol,int timeframe,datetime time,bool exact=false)   {
   return(iBarShift(symbol,timeframe,time,exact));
}

double cClose(string symbol,int timeframe,int shift)   {
   return(iClose(symbol,timeframe,shift));
}

double cHigh(string symbol,int timeframe,int shift)   {
   return(iHigh(symbol,timeframe,shift));
}

double cLow(string symbol,int timeframe,int shift)   {
   return(iLow(symbol,timeframe,shift));
}

double cOpen(string symbol,int timeframe,int shift)   {
   return(iOpen(symbol,timeframe,shift));
}

int cHighest(string symbol,int timeframe,int type,int count=WHOLE_ARRAY,int start=0) {
   return(iHighest(symbol,timeframe,type,count));
}

int cLowest(string symbol,int timeframe,int type,int count=WHOLE_ARRAY,int start=0) {
   return(iLowest(symbol,timeframe,type,count));
}

datetime cTime(string symbol,int timeframe,int shift)  {
   return(iTime(symbol,timeframe,shift));
}

double cVolume(string symbol,int timeframe,int shift)  {
   return(iVolume(symbol,timeframe,shift));
}