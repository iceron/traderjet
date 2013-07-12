void trailingStopLossLoop(string name,double start,double step,double trailingstop,int magic=EMPTY_VALUE) {   
   int total = OrdersTotal();
   for (int i=0;i<total;i++) trailingStopLossOrder(i,start,step,trailingstop,magic,SELECT_BY_POS,name);
}

void trailingStopLossOrder(string name,int ticket,double start,double step,double trailingstop,int magic=EMPTY_VALUE,int select=SELECT_BY_TICKET)   {
   if (magic==EMPTY_VALUE) magic = serverMagic;  
   if (orderSelect(ticket,select)) trailingStopLoss(start,step,trailingstop,name);       
}

void trailingStopLoss(string name,double start,double step,double trailingstop)   {
   if (trailingstop<=0) return;
	bool mod;
   start *= tickFractPips;
   step *= tickFractPips;
   trailingstop *= tickFractPips;   
   double objval = objectGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   if (objval==0) return;   
   double objvalTicks = ticks(objval);
   int openTicks = ticks(orderOpenPrice);
   int closeTicks = ticks(orderClosePrice);
   if (orderType==OP_BUY) {
      if (orderProfitTicks>=start)	{
			if ((objval<openTicks+start-trailingstop && closeTicks-trailingstop<=openTicks+start+step) || (objval==-1))
				mod = true;
			else if (closeTicks-trailingstop>objvalTicks+step)  
				mod = true;				
		}
		if (mod) objectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,(closeTicks-trailingstop)*tickSize);
   }
   
   else if (orderType==OP_SELL) {
		if (orderProfitTicks>=start)	{
			if ((objvalTicks>openTicks-start+trailingstop && closeTicks+trailingstop>=openTicks-start-step) || (objval==-1))
				mod = true;
			else if (closeTicks+trailingstop<objvalTicks-step)       
				mod = true;
		}
		if (mod) objectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,(closeTicks+trailingstop)*tickSize);
   }      
}	