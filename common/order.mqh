void orderSelectSet(int magic,int type=CMD_ALL, string symbol="")
{
   orderSelectMagic = magic;
   orderSelectType = type;
   orderSelectSymbol = symbol;  
}

void orderSelectReset(){
   orderOpenPrice = 0;
   orderClosePrice = 0;
   orderComment = "";
   orderCommission = 0;
   orderVolume = 0;
   orderProfit = 0;
   orderStopLoss = 0;
   orderTakeProfit = 0;
   orderSwap = 0;
 
   orderExpiration = 0;
   orderCloseTime = 0;
   orderOpenTime = 0;
 
   orderMagic = 0;
   orderTicket = 0;
   orderType = 0;
   
   orderProfitTicks = 0;
}

bool orderIsShort(int ticket=-1) {
   if (ticket>0)
      if (!orderSelect(ticket,SELECT_BY_TICKET)) return(false);
   return (orderType==OP_SELL || orderType==OP_SELLSTOP || orderType==OP_SELLLIMIT);
}

bool orderIsLong(int ticket=-1)  {
   if (ticket>0)
      if (!orderSelect(ticket,SELECT_BY_TICKET)) return(false);
   return (orderType==OP_BUY || orderType==OP_BUYSTOP || orderType==OP_BUYLIMIT);
}


bool orderSelect(int index,int select=SELECT_BY_POS,int pool=MODE_TRADES){
   bool res;
   res = OrderSelect(index,select,pool);
   if (res)   {      
      orderInfo();
      if (orderMagic!=orderSelectMagic) 
         if (orderSelectMagic!=-1) res = false; 
      if (orderSymbol!=orderSelectSymbol) 
         if (orderSelectSymbol!="") res = false;    
      if (!orderInGroup(orderSelectType,orderType)) res =false;   
   }
   if (!res) orderSelectReset();
   return(res);
}

void orderInfo(){
   orderClosePrice = OrderClosePrice();
   orderOpenPrice = OrderOpenPrice();  
   orderCommission = OrderCommission();
   orderVolume = OrderLots();
   orderProfit = OrderProfit();
   orderStopLoss = OrderStopLoss();
   orderTakeProfit = OrderTakeProfit();
   orderSwap = OrderSwap();
   
   orderSymbol = OrderSymbol();
   orderComment = OrderComment();
    
   orderExpiration = OrderExpiration();
   orderCloseTime = OrderCloseTime();
   orderOpenTime = OrderOpenTime();
   
   orderMagic = OrderMagicNumber();
   orderTicket = OrderTicket();
   orderType = OrderType();
   orderProfitTicks = orderProfitTicks();
}
/*
bool orderIsProfit(double ticks=0){
   if (orderType==OP_BUY)
      if (orderClosePrice>orderOpenPrice+ticks*tickSize) return(true);
   else if (orderType==OP_SELL)
      if (orderClosePrice<orderOpenPrice-ticks*tickSize) return(true);
   return(false);   
}

bool orderIsLoss(double ticks=0){
   if (orderType==OP_SELL)
      if (orderClosePrice>orderOpenPrice+ticks*tickSize) return(true);
   else if (orderType==OP_BUY)
      if (orderClosePrice<orderOpenPrice-ticks*tickSize) return(true);
   return(false);  
}
*/

bool orderIsMarket()  {
   if (orderType<=1) return(true);
   return(false);
}

bool orderIsPending()  {
   if (orderType>1) return(true);
   return(false);
}

bool orderIsClosed()   {
   if (orderCloseTime>0) return(true);
   return(false);
}


int ticks(double val){
   if (val==EMPTY_VALUE) return(EMPTY_VALUE);
   return(val/tickSize);
}

bool orderInGroup(int& type,int& orderType){
   switch(type)   {
      case CMD_BUY:      {
         if (orderType==OP_BUY) return(true);
      }
      case CMD_SELL:      {
         if (orderType==OP_SELL) return(true);
      }
      case CMD_BUYLIMIT:      {
         if (orderType==OP_BUYLIMIT) return(true);
      }
      case CMD_SELLLIMIT:      {
         if (orderType==OP_SELLLIMIT) return(true);
      }
      case CMD_BUYSTOP:      {
         if (orderType==OP_BUYSTOP) return(true);
      }
      case CMD_SELLSTOP:      {
         if (orderType==OP_SELLSTOP) return(true);
      }
      case CMD_LONG:      {
         if (orderType==OP_BUY || orderType==OP_BUYSTOP || orderType==OP_BUYLIMIT) return(true);
      }
      case CMD_SHORT:      {
         if (orderType==OP_SELL || orderType==OP_SELLSTOP || orderType==OP_SELLLIMIT) return(true);
      }
      case CMD_STOP:      {
         if (orderType==OP_SELLSTOP || orderType==OP_BUYSTOP) return(true);
      }
      case CMD_LIMIT:      {
         if (orderType==OP_SELLLIMIT || orderType==OP_BUYLIMIT) return(true);
      }
      case CMD_MARKET:      {
         if (orderType<=1) return(true);
      }
      case CMD_PENDING:      {
         if (orderType>1) return(true);
      }
      case CMD_ALL:      {      
         return(true);
      }
   }
   return(false);
}

int orderCount(int pool=MODE_TRADES){
   int count,total;
   if (pool==MODE_TRADES) total = OrdersTotal();
   else total = OrdersHistoryTotal();
   for (int i=0;i<total;i++)   {
      if (!orderSelect(i,SELECT_BY_POS,pool)) continue;
      else count++;
   }
   return(count);
}

double orderProfitTicks(int ticket=-1){
   double val;
   if (ticket>0 && ticket!=-1)
      orderSelect(ticket,SELECT_BY_TICKET);
   if (orderType==OP_BUY)
      val = (orderClosePrice-orderOpenPrice)/tickSize;  
   else if (orderType==OP_SELL)
      val = (orderOpenPrice-orderClosePrice)/tickSize; 
   return(val);   
}