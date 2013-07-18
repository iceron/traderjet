void trailingTakeProfitLoop(string name,double start,double step,double trailingtake,int magic=EMPTY_VALUE) {   
   int total = ordersTotal();
   for (int i=0;i<total;i++) trailingTakeProfitOrder(i,start,step,trailingtake,magic,SELECT_BY_POS,name);
}

void trailingTakeProfitOrder(string name, int ticket,double start,double step,double trailingtake,int magic=EMPTY_VALUE,int select=SELECT_BY_TICKET)   {
   if (magic==EMPTY_VALUE) magic = serverMagic;  
   if (cOrderSelect(ticket,select)) trailingTakeProfit(start,step,trailingtake,name);       
}

void trailingTakeProfit(string name, double start,double step,double trailingtake)   {
   if (trailingtake<=0) return;
   start *= tickFractPips;
   step *= tickFractPips;
   double val = objectGet(name+vstopTakeProfitName+orderTicket,OBJPROP_PRICE1);
   if (val==0) return;
	bool mod;
	if (orderType==OP_BUY) {
      if (ticks(orderClosePrice-orderOpenPrice)>=start)	{
			if (ticks(val)<ticks(orderOpenPrice)+start+trailingtake*tickFractPips || val==-1) mod = true;
			else if (ticks(orderClosePrice+trailingtake*tickFractPoints)>ticks(val)+step)  mod = true;
			if (mod) objectSet(name+vstopTakeProfitName+orderTicket,OBJPROP_PRICE1,orderClosePrice+trailingtake*tickFractPoints);
		}
   }
	else if (orderType==OP_SELL) {
      if (ticks(orderOpenPrice-orderClosePrice)>=start)	{
			if (ticks(val)>ticks(orderOpenprice)-start-trailingtake*tickFractPips || val==-1) mod = true;
			else if (ticks(orderClosePrice-trailingtake*tickFractPoints)<ticks(val)-step)  mod = true;			
			if (mod) objectSet(name+vstopTakeProfitName+orderTicket,OBJPROP_PRICE1,orderClosePrice-trailingtake*tickFractPoints);
		}
   }
}