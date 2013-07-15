bool orderClose(int ticket,double lots,double price,int slippage,color clr=CLR_NONE) {
   return(OrderClose(ticket,lots,price,slippage,clr));
}

bool orderCloseBy(int ticket,int opposite,color clr=CLR_NONE)  {
   return(OrderCloseBy(ticket,opposite,clr));
}

double orderClosePrice()   {
   return(OrderClosePrice());
}

datetime orderCloseTime()   {
   return(OrderCloseTime());
}

string orderComment()   {
   return(OrderComment());
}

double orderCommission()   {
   return(OrderCommission());
}

bool orderDelete(int ticket,int clr=CLR_NONE)   {
   return(OrderDelete(ticket,clr));
}

datetime orderExpiration()   {
   return(OrderExpiration());
}

double orderLots()   {
   return(OrderLots());
}

double orderMagicNumber()   {
   return(OrderMagicNumber());
}

bool orderModify(int ticket,double price,double stoploss,double takeprofit,datetime expiration=0,color clr=CLR_NONE)   {
   return(OrderModify(ticket,price,stoploss,takeprofit,expiration,clr));
}

double orderOpenPrice()   {
   return(OrderOpenPrice());
}

datetime orderOpenTime()   {
   return(OrderOpenTime());
}

void orderPrint() {
   OrderPrint();
}

double orderProfit() {
   return(OrderProfit());
}

bool orderSelect(int index,int select,int pool=MODE_TRADES) {
   return(OrderSelect(index,select,pool));
}

int orderSend(string symbol,int cmd,double volume,double price,int slippage,double stoploss,double takeprofit,string comment="",int magic=0,datetime expiration=0,color clr=CLR_NONE)   {
   return(OrderSend(symbol,cmd,volume,price,slippage,stoploss,takeprofit,comment,magic,expiration,clr));
}

int ordersHistoryTotal()   {
   return(OrdersHistoryTotal());
}

double orderStopLoss()   {
   return(OrderStopLoss());
}

int ordersTotal()   {
   return(OrdersTotal());
}

double orderSwap()   {
   return(OrderSwap());
}

string orderSymbol() {
   return(OrderSymbol());
}

double orderTakeProfit()   {
   return(OrderTakeProfit());
}

int orderTicket() {
   return(OrderTicket());
}

int orderType()   {
   return(OrderType());
}


