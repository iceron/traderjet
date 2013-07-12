color orderCloseArrowColor = CLR_NONE;

bool orderClose(int ticket, double lots=0, double price=0) {
   if (orderCloseTime>0) return;
   bool result;
   int status;   
   for (int i=0;i<serverRetryMax;i++)	{
      status = tradeStatus();
      if (status<1)	{
         if (status==-1) return(false);         
         Sleep(serverSleepError);
         continue;
      }
      if (!orderSelect(ticket,SELECT_BY_TICKET)) return(false);
      if (orderType<=1)  {
         if (price==0) price = orderClosePrice;
         if (lots==0) lots = orderVolume;
         else lots = normalizeDouble(MathMin(orderVolume,lots),DOUBLE_VOLUME);
         result = OrderClose(orderTicket,lots,price,serverSlippageExit*tickFractPips,orderCloseArrowColor);
      }   
      else if (orderType>1) 
         result = OrderDelete(ticket);   
      if (result) {         
         Sleep(serverSleepSuccess);
         break;
      }
      else {
         lastErrorString = "symbol: "+ tickSymbol + " magic: "+ serverMagic + " type: "+cmdToString(orderType)+" lotsize: "+DoubleToStr(orderVolume,tickVolumePrecision)+" price "+DoubleToStr(orderOpenPrice,tickDigits)+" sl: "+DoubleToStr(orderStopLoss,tickDigits)+" tp: "+DoubleToStr(orderTakeProfit,tickDigits)+" bid/ask: "+DoubleToStr(tickBid,tickDigits)+"/"+DoubleToStr(tickAsk,tickDigits);
         errorManager(ERR_CLOSE);
         Sleep(serverSleepError);
      }
   }   
   if (!result && status>=1) printOut("orderClose",StringConcatenate("trade closing aborted [resend request(s) failed reason ",lastError," ]")); 
   return(result);
}

int orderCloseAll(int type=CMD_ALL)   {
   int i, total = OrdersTotal();
   for (i=total-1; i>=0; i--)   {
      if (!orderSelect(i,SELECT_BY_POS)) continue;
      if (!orderInGroup(type,orderType)) continue;
      orderClose(orderTicket,orderVolume);
   }
}