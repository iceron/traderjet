bool tradingCounter()  {
   static string msg="";
   if (TradingCounterMinutes<=0 || !tradingcounterStart) return(true);
   if (!serverEntryEnabled)   {
      if (msg=="")   {  
         msg = "trading countdown is up";
         print(msg);
      }
      if (TradingCounterShow) dashAdd(tradingcounterName,msg);  
      return(false);
   }    
   datetime timeCurrent = timeCurrent();   
   int duration = (timeCurrent - tradingcounterStart)/60;
   int val = TradingCounterMinutes-duration;
   if (duration>TradingCounterMinutes)
      serverEntryEnabled = false;
   if (TradingCounterShow) 
      dashAdd(tradingcounterName,"trading countdown",val+" minutes left");  
   return(true);
}

void tradingcounterInit()   {
   tradingcounterStart = 0;
}

void tradingcounterStart()   {
   tradingcounterStart = timeCurrent();
}