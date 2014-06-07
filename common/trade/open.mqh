#define TICKS 0
#define PRICE 1

int stoploss_mode = TICKS;
int takeprofit_mode = TICKS;
int price_mode = TICKS;

int orderBuy(double volume,double price,double stoploss,double takeprofit,string comment="")
{
   return(cOrderSend(OP_BUY,volume,price,stoploss,takeprofit,comment,0));
}

int orderSell(double volume,double price,double stoploss,double takeprofit,string comment="")
{
   return(cOrderSend(OP_SELL,volume,price,stoploss,takeprofit,comment,0));
}

int orderBuyStop(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   return(cOrderSend(OP_BUYSTOP,volume,price,stoploss,takeprofit,comment,expiration));
}

int orderBuyLimit(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   return(cOrderSend(OP_BUYLIMIT,volume,price,stoploss,takeprofit,comment,expiration));
}

int orderSellStop(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   return(cOrderSend(OP_SELLSTOP,volume,price,stoploss,takeprofit,comment,expiration));
}

int orderSellLimit(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   return(cOrderSend(OP_SELLLIMIT,volume,price,stoploss,takeprofit,comment,expiration));
}

int cOrderSend(int cmd,double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)   {
   int ticket,status;   
   double vo,pr,sl,tp;
   
   for (int i=0;i<=serverRetryMax;i++)	{
      symbolGet();
      pr = price;
      vo = volume;
      sl = stoploss;
      tp = takeprofit;
      orderCalc(cmd,vo,pr,sl,tp);
      status = tradeStatus();
      if (!tradeVolumePass(vo))   {
         Print("log ",mathMax(-mathLog(tickMinLot)/mathLog(10),0)," vo: ",vo," volume: ",volume," tick: ",tickVolumePrecision);
         Print("orderSend(): order procesing aborted - invalid lotsize ","lotsize: ",vo," minlot: ",tickMinLot," maxlot: ",tickMaxLot);
         lastError = 131;
         return(-1);
      }
      if (!tradeMarginCallPass(cmd,vo)) {         
         Print("orderSend(): order procesing aborted - trade execution will trigger margin call");
         lastError = 134;
         return(-1);
      }   
      if (status<1)	{
         if (status==-1) return(0);
         sleep(serverSleepError);
      }
      else	{
         ticket = sendOrder(cmd,vo,pr,sl,tp,comment,expiration);            
      }   	   
      if (ticket>0) 
      {
         onTrade();
         break;      
      }   
   }   
	if (ticket<=0) Print("orderSend(): trade operation aborted [resend request(s) failed]");	
   return(ticket); 
}

void stopSet(int mode_sl=TICKS,int mode_tp=TICKS,int mode_price=TICKS)   {
   stoploss_mode = mode_sl;
   takeprofit_mode = mode_tp;
   price_mode = mode_price;
}

void orderCalc(int& cmd,double& volume,double& price,double& stoploss,double& takeprofit)  {
   price = priceCalc(cmd,price);  
   volume = lotCalc(volume);
   if (stoploss_mode==PRICE)
      stoploss = cNormalizeDouble(stoploss);
   else if (stoploss_mode==TICKS && stoploss>0)  {
      if (isShort(cmd))
         stoploss = cNormalizeDouble(price+stoploss*tickFractPoints);
      else stoploss = cNormalizeDouble(price-stoploss*tickFractPoints);      
   }   
   if (takeprofit_mode==PRICE)
      takeprofit = cNormalizeDouble(takeprofit);
   else if (takeprofit_mode==TICKS && takeprofit>0)   {
      if (isShort(cmd))
         takeprofit = cNormalizeDouble(price-takeprofit*tickFractPoints);
      else takeprofit = cNormalizeDouble(price+takeprofit*tickFractPoints);
   }
}

double priceCalc(int& cmd,double p)	{
   if (price_mode==PRICE) return(cNormalizeDouble(p));	
   if (cmd<=1) p = 0;	
	else if (cmd==OP_BUYLIMIT || cmd==OP_SELLSTOP)	
	  p *= -tickSize;
	else p *=tickSize;  
	if (isLong(cmd))	
	  p += tickAsk;
	else p += tickBid;  
	return(cNormalizeDouble(p));
}

double lotCalc(double volume)   {
   return(cNormalizeDouble(volume,DOUBLE_VOLUME));
}

bool isShort(int& cmd) {
   return (cmd==OP_SELL || cmd==OP_SELLSTOP || cmd==OP_SELLLIMIT);

}
bool isLong(int& cmd)  {
   return (cmd==OP_BUY || cmd==OP_BUYSTOP || cmd==OP_BUYLIMIT);
}


int tradeStatus()   {
   if (isStopped())
      return(-1);
   if (isTradeContextBusy())  {
      returnCode = "trade context is busy.";
      return(0);  
   }   
   if (!isConnected())  {
      returnCode = "disconnected from server.";
      return(0); 
   }   
   return(1);      
}


int sendOrder(int& cmd,double& volume,double& price,double& stoploss,double& takeprofit,string& comment,datetime& expiration) { 
   bool res;
   int ticket;
   color arrowcolor = tradeArrowColor(cmd);   
   datetime exp;   
   if (serverStopLossModify)   {
      if (stoploss>0 && ticks(mathAbs(price-stoploss))<tickStopLevel) {
         Print("orderSend(): hard sl ignored [invalid sl]");
         stoploss = 0;
      }   
   }   
   else  stoploss = 0;
   if (serverTakeProfitModify)   {    
      if (takeprofit>0 && ticks(mathAbs(price-takeprofit))<tickStopLevel) {
         Print("orderSend(): hard tp ignored [invalid tp]");
         takeprofit = 0;
      }   
   }   
   else takeprofit = 0;    
   Print(StringConcatenate("orderSend(): ","order processing (entry) - ",cmdToString(cmd)," volume: ",volumeFormat(volume)," price: ",priceFormat(price)," sl: ",priceFormat(stoploss)," tp: ",priceFormat(takeprofit)," bid/ask: ",priceFormat(tickBid),"/",priceFormat(tickAsk)," magic: ",serverMagic));
   if (cmd>1 && expiration>0) exp=expiration*1000+timeCurrent();
   if (serverECNEnabled && cmd<=1)   {
      ticket = orderSend(tickSymbol,cmd,volume,price,serverSlippageEntry*tickFractPips,0,0,comment,serverMagic,exp,arrowcolor);
      sleep(serverSleepSuccess);
      if (ticket>0)  {
         if (stoploss>0 || takeprofit>0)  {
            res = orderModify(ticket,orderOpenPrice(),stoploss,takeprofit,orderExpiration());
            if (!res)   {
               lastErrorString = StringConcatenate("symbol: ",tickSymbol,"magic: ",serverMagic,"type: "+cmdToString(orderType)+"lotsize: "+volumeFormat(orderVolume)+"price: "+priceFormat(orderOpenPrice)+"sl: "+priceFormat(orderStopLoss)+"tp: "+priceFormat(orderTakeProfit)+"bid/ask: "+priceFormat(tickBid)+"/"+priceFormat(tickAsk));
               errorManager(ERR_MODIFY);
            }
         }   
      }
   }
   else  {      
      ticket = orderSend(tickSymbol,cmd,volume,price,serverSlippageEntry*tickFractPips,stoploss,takeprofit,comment,serverMagic,exp,arrowcolor);      
   }         
   if (ticket>0) {
      Print(StringConcatenate("orderSend(): ","order processed (entry) - #",ticket," magic: ",serverMagic));
      sleep(serverSleepSuccess);
      return(ticket); 
   }   
   else  {
      sleep(serverSleepError);
      lastErrorString = StringConcatenate("symbol: ",tickSymbol,"magic: ",serverMagic,"type: "+cmdToString(orderType)+"lotsize: "+volumeFormat(orderVolume)+"price: "+priceFormat(orderOpenPrice)+"sl: "+priceFormat(orderStopLoss)+"tp: "+priceFormat(orderTakeProfit)+"bid/ask: "+priceFormat(tickBid)+"/"+priceFormat(tickAsk));
      errorManager(ERR_OPEN);
   } 
   return(-1);   
}

bool tradeMarginCallPass(int cmd,double vol,string s="") {
   if (cmd>1) return(true);
   if (accountFreeMarginCheck(s,cmd,vol)<=0) return(false);
   return(true); 
}

bool tradeVolumePass(double vol) {
   if (vol<=0) return(false);
   return(true); 
}

color tradeArrowColor(int cmd){
   if (isLong(cmd)) return(serverArrowColorLong);
   return(serverArrowColorShort);
}