bool orderModify(int ticket,double price,double stoploss,double takeprofit,double expiration=0,color arrowcl=CLR_NONE)   {
   bool mod,res;
   int status;
   if (!orderSelect(ticket,SELECT_BY_TICKET)) return(false);
   if (!pricesIsEqual(takeprofit,orderTakeProfit) && serverTakeProfitModify) mod = true;
   else takeprofit = orderTakeProfit;
   if (!pricesIsEqual(stoploss,orderStopLoss) && serverStopLossModify) mod = true;
   else stoploss = orderStopLoss;   
   printOut("orderModify",StringConcatenate("order processing (modify): #",orderTicket," ",cmdToString(orderType)," new price: ",price," new stoploss: ",stoploss," new takeprofit: ",takeprofit," bid/ask: ",tickBid,"/",tickAsk," magic: ",serverMagic));
   for (int i=0;i<serverRetryMax;i++)	{
      status = tradeStatus();
      if (status<1)	{
         Sleep(serverSleepError);
         if (status==-1) return(false);                  
         continue;
      }      
      if (mod) res = OrderModify(ticket,price,stoploss,takeprofit,expiration,arrowcl);
      if (res) {       
         printOut("orderModify",StringConcatenate("order processed (modify): #",orderTicket," ",cmdToString(orderType)," new price: ",price," new stoploss: ",stoploss," new takeprofit: ",takeprofit," bid/ask: ",tickBid,"/",tickAsk," magic: ",serverMagic));
         Sleep(serverSleepSuccess);
         break;
      }   
      if (!res && mod) {
         lastErrorString = "symbol: "+ tickSymbol + " magic: "+ serverMagic + " type: "+cmdToString(orderType)+" lotsize: "+DoubleToStr(orderVolume,tickVolumePrecision)+" price "+DoubleToStr(orderOpenPrice,tickDigits)+" sl: "+DoubleToStr(orderStopLoss,tickDigits)+" tp: "+DoubleToStr(orderTakeProfit,tickDigits)+" bid: "+DoubleToStr(tickBid,tickDigits)+" ask: "+DoubleToStr(tickAsk,tickDigits);
         errorManager(ERR_MODIFY);
         Sleep(serverSleepError);
      }   
   }
   if (!res && mod) printOut("orderModify",StringConcatenate("trade modification aborted [resend request(s) failed reason ",lastError," ] "));
   return(res);
}