bool cOrderModify(int ticket,double price,double stoploss,double takeprofit,double expiration=0,color arrowcl=CLR_NONE)   {
   bool mod,res;
   int status;
   if (!orderSelect(ticket,SELECT_BY_TICKET)) return(false);
   if (!pricesIsEqual(takeprofit,orderTakeProfit) && serverTakeProfitModify) mod = true;
   else takeprofit = orderTakeProfit;
   if (!pricesIsEqual(stoploss,orderStopLoss) && serverStopLossModify) mod = true;
   else stoploss = orderStopLoss;   
   printOut("orderModify",stringConcatenate("order processing (modify) - #",orderTicket," ",cmdToString(orderType)," price: ",priceFormat(price)," old sl: ",priceFormat(orderStopLoss)," new sl: ",priceFormat(stoploss)," old tp: ",priceFormat(orderTakeProfit)," new tp: ",priceFormat(takeprofit)," bid/ask: ",priceFormat(tickBid),"/",priceFormat(tickAsk)," magic: ",serverMagic));
   for (int i=0;i<serverRetryMax;i++)	{
      status = tradeStatus();
      if (status<1)	{
         Sleep(serverSleepError);
         if (status==-1) return(false);                  
         continue;
      }      
      if (mod) res = orderModify(ticket,price,stoploss,takeprofit,expiration,arrowcl);
      if (res) {       
         printOut("orderModify",stringConcatenate("order processed (modify): #",orderTicket));
         Sleep(serverSleepSuccess);
         onTradeModify();
         break;
      }   
      if (!res && mod) {
         lastErrorString = "symbol: "+ tickSymbol + " magic: "+ serverMagic + " type: "+cmdToString(orderType)+" lotsize: "+DoubleToStr(orderVolume,tickVolumePrecision)+" price "+DoubleToStr(orderOpenPrice,tickDigits)+" sl: "+DoubleToStr(orderStopLoss,tickDigits)+" tp: "+DoubleToStr(orderTakeProfit,tickDigits)+" bid: "+DoubleToStr(tickBid,tickDigits)+" ask: "+DoubleToStr(tickAsk,tickDigits);
         errorManager(ERR_MODIFY);
         Sleep(serverSleepError);
      }   
   }
   if (!res && mod) printOut("orderModify",stringConcatenate("trade modification aborted [resend request(s) failed reason ",lastError," ] "));
   return(res);
}