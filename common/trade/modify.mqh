bool cOrderModify(int ticket,double price,double stoploss,double takeprofit,double expiration=0,color arrowcl=CLR_NONE)   {
   bool mod,res;
   int status;
   if (!orderSelect(ticket,SELECT_BY_TICKET)) return(false);
   if (!pricesIsEqual(takeprofit,orderTakeProfit) && serverTakeProfitModify) mod = true;
   else takeprofit = orderTakeProfit;
   if (!pricesIsEqual(stoploss,orderStopLoss) && serverStopLossModify) mod = true;
   else stoploss = orderStopLoss;   
   Print(StringConcatenate("orderModify: ","order processing (modify) - #",orderTicket," ",cmdToString(orderType)," price: ",priceFormat(price)," old sl: ",priceFormat(orderStopLoss)," new sl: ",priceFormat(stoploss)," old tp: ",priceFormat(orderTakeProfit)," new tp: ",priceFormat(takeprofit)," bid/ask: ",priceFormat(tickBid),"/",priceFormat(tickAsk)," magic: ",serverMagic));
   for (int i=0;i<serverRetryMax;i++)	{
      status = tradeStatus();
      if (status<1)	{
         sleep(serverSleepError);
         if (status==-1) return(false);                  
         continue;
      }      
      if (mod) res = orderModify(ticket,price,stoploss,takeprofit,expiration,arrowcl);
      if (res) {       
         Print(StringConcatenate("orderModify: ","order processed (modify): #",orderTicket));
         sleep(serverSleepSuccess);
         onTradeModify();
         break;
      }   
      if (!res && mod) {
         lastErrorString = StringConcatenate("symbol:",tickSymbol,"magic:",serverMagic,"type:"+cmdToString(orderType)+"lotsize:"+volumeFormat(orderVolume)+"price"+priceFormat(orderOpenPrice)+"sl:"+priceFormat(orderStopLoss)+"tp:"+priceFormat(orderTakeProfit)+"bid/ask:"+priceFormat(tickBid)+"/"+priceFormat(tickAsk));
         errorManager(ERR_MODIFY);
         sleep(serverSleepError);
      }   
   }
   if (!res && mod) Print(StringConcatenate("orderModify: ","trade modification aborted [resend request(s) failed reason ",lastError," ] "));
   return(res);
}