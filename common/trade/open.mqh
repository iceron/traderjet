#define TICKS 0
#define PRICE 1

int stoploss_mode = TICKS;
int takeprofit_mode = TICKS;
int price_mode = TICKS;

int orderBuy(double volume,double price,double stoploss,double takeprofit,string comment="")
{
   orderSend(OP_BUY,volume,price,stoploss,takeprofit,comment,0);
}

int orderSell(double volume,double price,double stoploss,double takeprofit,string comment="")
{
   orderSend(OP_SELL,volume,price,stoploss,takeprofit,comment,0);
}

int orderBuyStop(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   orderSend(OP_BUYSTOP,volume,price,stoploss,takeprofit,comment,expiration);
}

int orderBuyLimit(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   orderSend(OP_BUYLIMIT,volume,price,stoploss,takeprofit,comment,expiration);
}

int orderSellStop(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   orderSend(OP_SELLSTOP,volume,price,stoploss,takeprofit,comment,expiration);
}

int orderSellLimit(double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)
{
   orderSend(OP_SELLLIMIT,volume,price,stoploss,takeprofit,comment,expiration);
}

int orderSend(int cmd,double volume,double price,double stoploss,double takeprofit,string comment="",datetime expiration=0)   {
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
      if (!tradeVolumePass(volume))   {
         printOut("orderSend","order procesing aborted - invalid lotsize");
         return(-1);
      }
      if (!tradeMarginCallPass(cmd,volume)) {
         printOut("orderSend","order procesing aborted - trade execution will trigger margin call");
         return(-1);
      }   
      if (status<1)	{
         if (status==-1) return(0);
         Sleep(serverSleepError);
      }
      else	{
         ticket = sendOrder(cmd,vo,pr,sl,tp,comment,expiration);            
      }   	   
      if (ticket>0) break;
   }
	if (ticket<=0) printOut("orderSend","trade operation aborted [resend request(s) failed]");
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
      stoploss = normalizeDouble(stoploss);
   else if (stoploss_mode==TICKS && stoploss>0)  {
      if (isShort(cmd))
         stoploss = normalizeDouble(price+stoploss*tickFractPoints);
      else stoploss = normalizeDouble(price-stoploss*tickFractPoints);      
   }   
   if (takeprofit_mode==PRICE)
      takeprofit = normalizeDouble(takeprofit);
   else if (takeprofit_mode==TICKS && takeprofit>0)   {
      if (isShort(cmd))
         takeprofit = normalizeDouble(price-takeprofit*tickFractPoints);
      else takeprofit = normalizeDouble(price+takeprofit*tickFractPoints);
   }
}

double priceCalc(int& cmd,double& p)	{
   if (price_mode==PRICE) return(p);	
   if (cmd<=1) p = 0;	
	else if (cmd==OP_BUYLIMIT || cmd==OP_SELLSTOP)	
	  p *= -tickSize;
	else p *=tickSize;  
	if (isLong(cmd))	
	  p += tickAsk;
	else p += tickBid;  
	return(normalizeDouble(p));
}

double lotCalc(double& volume)   {
   return(normalizeDouble(volume,DOUBLE_VOLUME));
}

bool isShort(int& cmd) {
   return (cmd==OP_SELL || cmd==OP_SELLSTOP || cmd==OP_SELLLIMIT);

}
bool isLong(int& cmd)  {
   return (cmd==OP_BUY || cmd==OP_BUYSTOP || cmd==OP_BUYLIMIT);
}


int tradeStatus()   {
   if (IsStopped())
      return(-1);
   if (IsTradeContextBusy())  {
      returnCode = "trade context is busy.";
      return(0);  
   }   
   if (!IsConnected())  {
      returnCode = "disconnected from server.";
      return(0); 
   }   
   return(1);      
}


int sendOrder(int& cmd,double& volume,double& price,double& stoploss,double& takeprofit,string& comment,datetime& expiration) { 
   bool res;
   int ticket;
   color arrowcolor = arrowColor(cmd);   
   datetime exp;   
   if (serverStopLossModify)   {
      if (stoploss>0 && ticks(MathAbs(price-stoploss))<tickStopLevel) {
         printOut("orderSend","hard sl ignored [invalid sl]");
         stoploss = 0;
      }   
   }   
   else  stoploss = 0;
   if (serverTakeProfitModify)   {    
      if (takeprofit>0 && ticks(MathAbs(price-takeprofit))<tickStopLevel) {
         printOut("orderSend","hard tp ignored [invalid tp]");
         takeprofit = 0;
      }   
   }   
   else takeprofit = 0;      
   printOut("orderSend",StringConcatenate("order processing (entry) - ",cmdToString(cmd)," price: ",price," stoploss: ",stoploss," takeprofit: ",takeprofit," bid/ask: ",tickBid,"/",tickAsk," magic: ",serverMagic));
   if (cmd>1 && expiration>0) exp=expiration*1000+TimeCurrent();
   if (serverECNEnabled && cmd<=1)   {
      ticket = OrderSend(tickSymbol,cmd,volume,price,serverSlippageEntry*tickFractPips,0,0,comment,serverMagic,exp,arrowcolor);
      Sleep(serverSleepSuccess);
      if (ticket>0)  {
         if (stoploss>0 || takeprofit>0)  {
            res = OrderModify(ticket,OrderOpenPrice(),stoploss,takeprofit,OrderExpiration());
            if (!res)   {
               lastErrorString = "symbol: "+ tickSymbol + " magic: "+ serverMagic + " type: "+cmdToString(cmd)+" lotsize: "+DoubleToStr(volume,tickVolumePrecision)+" price "+DoubleToStr(price,tickDigits)+" sl: "+DoubleToStr(stoploss,tickDigits)+" tp: "+DoubleToStr(takeprofit,tickDigits)+" bid/ask: "+DoubleToStr(tickBid,tickDigits)+"/"+DoubleToStr(tickAsk,tickDigits);
               errorManager(ERR_MODIFY);
            }
         }   
      }
   }
   else  {      
      ticket = OrderSend(tickSymbol,cmd,volume,price,serverSlippageEntry*tickFractPips,stoploss,takeprofit,comment,serverMagic,exp,arrowcolor);      
   }         
   if (ticket>0) {
      printOut("orderSend",StringConcatenate("order processed (entry) - #",ticket," magic: ",serverMagic));
      Sleep(serverSleepSuccess);
      return(ticket); 
   }   
   else  {
      Sleep(serverSleepError);
      lastErrorString = "symbol: "+ tickSymbol + " magic: "+ serverMagic + " type: "+cmdToString(cmd)+" lotsize: "+DoubleToStr(volume,tickVolumePrecision)+" price "+DoubleToStr(price,tickDigits)+" sl: "+DoubleToStr(stoploss,tickDigits)+" tp: "+DoubleToStr(takeprofit,tickDigits)+" bid/ask: "+DoubleToStr(tickBid,tickDigits)+"/"+DoubleToStr(tickAsk,tickDigits);
      errorManager(ERR_OPEN);
   } 
   return(-1);   
}

bool tradeMarginCallPass(int cmd,double vol,string s="") {
   if (cmd>1) return(true);
   if (accountFreeMarginCheck(cmd,vol,s)<=0) return(false);
   return(true); 
}

bool tradeVolumePass(double vol) {
   if (vol<=0) return(false);
   return(true); 
}