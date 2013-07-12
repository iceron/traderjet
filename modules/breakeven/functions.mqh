void breakevenLoop(string name,double breakeven,int magic=-1,int type=CMD_MARKET,string name="stealth")  {
   bool mod;
   int i,total = OrdersTotal();
   for (i=0;i<total;i++) breakevenOrder(i,SELECT_BY_POS,breakeven,magic,type); 
}

void breakevenOrder(string name,int ticket,int select,double breakeven,int magic,int type=CMD_MARKET,string name="stealth"){
   if (order.select(ticket,select,MODE_TRADES)) breakeven(breakeven);
}

void breakeven(string name,double breakeven,double target=0,string name="stealth")  {   
   if (breakeven<=0) return;
   double open,val = objectGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   if (val==0) return;
	if (orderType==OP_BUY)	{
		open = normalizeDouble(orderOpenPrice+target*tickFractPoints);
		if (ticks(orderClosePrice-orderOpenPrice)>breakeven*tickFractPips) {
			if (!pricesIsEqual(val,open))  {				
				if (val>-1 && val>open) return;
				objectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,open);
			}
		} 
	}
	else if (orderType==OP_SELL)	{
		open = normalizeDouble(orderOpenPrice-target*tickFractPoints);
		if (ticks(orderOpenPrice-orderClosePrice)>breakeven*tickFractPips) {
			if (!pricesIsEqual(val,open))  {				
				if (val>-1 && val<open) return;
				objectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,open);
			}
		} 
	}	
}

