#include <traderjet\modules\candle\functions.mqh>

void trailingStopLossCandleLoop(string name,int start,int price,int shift,double offset,int magic=EMPTY_VALUE,int type=CMD_ALL,bool floating=false) {   
   int total = ordersTotal();
   for (int i=0;i<total;i++) trailingStopLossCandleOrder(i,SELECT_BY_POS,start,price,shift,offset,type,name,floating);
}

void trailingStopLossCandleOrder(string name,int ticket,int select,int start,int price,int shift,double offset,int magic=EMPTY_VALUE,int type=CMD_ALL,bool floating=false)   {
   if (magic==EMPTY_VALUE) magic = server.magic;  
   if (cOrderSelect(ticket,select)) trailingStopLossCandle(start,price,shift,offset,type,name,floating);       
}


void trailingStopLossCandle(string name,int start,int price,int shift,double offset,int type=CMD_ALL,bool floating=false)   {
   if (type!=CMD_ALL)
      if (order.type!=type) return;   
   if (orderType>1) return;
   datetime candleTime = candleTime(start);
   if (orderOpenTime>candleTime) return;      
   double val = objectGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   if (val==0) return;   
   double candlePrice = candlePrice(price,shift);
   bool update;
   if (orderType==OP_BUY) {
      if (!floating)
         if (orderStoploss<candlePrice || val==-1) update = true;
      else update = true;
   }
   else if (orderType==OP_SELL) {
      if (!floating)
         if (orderStoploss>candlePrice || val==-1) update = true;
      else update = true;
   }   
   if (update) objectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,candlePrice);
}

