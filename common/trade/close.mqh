color orderCloseArrowColor = CLR_NONE;

bool cOrderClose(int ticket, double lots=0, double price=0) {
   if (orderCloseTime>0) return;
   bool result;
   int status;   
   for (int i=0;i<serverRetryMax;i++)	{
      status = tradeStatus();
      if (status<1)	{
         if (status==-1) return(false);         
         sleep(serverSleepError);
         continue;
      }
      if (!orderSelect(ticket,SELECT_BY_TICKET)) return(false);
      if (orderType<=1)  {
         if (price==0) price = orderClosePrice;
         if (lots==0) lots = orderVolume;
         else lots = cNormalizeDouble(mathMin(orderVolume,lots),DOUBLE_VOLUME);
         result = orderClose(orderTicket,lots,price,serverSlippageExit*tickFractPips,orderCloseArrowColor);
      }   
      else if (orderType>1) 
         result = orderDelete(ticket);   
      if (result) {         
         sleep(serverSleepSuccess);
         break;
      }
      else {
         lastErrorString = StringConcatenate("symbol: ",tickSymbol," magic: ",serverMagic," type: "+cmdToString(orderType)+" lotsize: "+volumeFormat(orderVolume)+" price "+priceFormat(orderOpenPrice)+" sl: "+priceFormat(orderStopLoss)+" tp: "+priceFormat(orderTakeProfit)+" bid/ask: "+priceFormat(tickBid)+"/"+priceFormat(tickAsk));
         errorManager(ERR_CLOSE);
         sleep(serverSleepError);
      }
   }   
   if (!result && status>=1) Print(StringConcatenate("orderClose: ","trade closing aborted [resend request(s) failed reason ",lastError," ]")); 
   if (result) Print(StringConcatenate("orderClose: ","order processing (exit) - ",cmdToString(orderType)," volume: ",volumeFormat(lots)," price: ",priceFormat(price)," bid/ask: ",priceFormat(tickBid),"/",priceFormat(tickAsk)," magic: ",serverMagic));
   return(result);
}

int orderCloseAll(int type=CMD_ALL)   {
   int i, total = ordersTotal();
   for (i=total-1; i>=0; i--)   {
      if (!cOrderSelect(i,SELECT_BY_POS)) continue;
      if (!orderInGroup(type,orderType)) continue;
      cOrderClose(orderTicket,orderVolume);
   }
}