void trailingStopLossPriceLoop(string name,double v,int magic=EMPTY_VALUE,int type=CMD_ALL,bool floating=false) {   
   int total = OrdersTotal();
   for (int i=0;i<total;i++) trailingStopLossPriceOrder(i,SELECT_BY_POS,v,magic,type,name,floating); ;
}

void trailingStopLossPriceOrder(string name,int ticket,int select,double v,int magic=EMPTY_VALUE,int type=CMD_ALL,bool floating=false)   {
   if (magic==EMPTY_VALUE) magic = server.magic;  
   if (order.select(ticket,select)) trailingStopLossPrice(v,type,name,floating);       
}

void trailingStopLossPrice(string name,double v,int type=CMD_ALL,bool floating=false)   {   
   if (type!=CMD_ALL)
      if (orderType!=type) return;   
   if (orderType>1) return;
   if (v==0) return;   
   double val = objectGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   if (val==0) return;
   bool update;
   double stop;
   if (orderType==OP_BUY) {
       if (!floating)
         if (orderStopLoss<val || val==-1) update = true;
      else update = true;
   }
   else if (orderType==OP_SELL) {
      if (!floating)
         if (orderStopLoss>val || val==-1) update = true;
      else update = true;
   }   
   if (update) objectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,v);
}