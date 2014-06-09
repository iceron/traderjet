/* Copyright (C) 2013 Enrico Lambino
 *
 *  This file is part of TraderJet Framework
 *
 *  TraderJet is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  TraderJet is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with TraderJet; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  @license GPL-3.0+ <http://spdx.org/licenses/GPL-3.0+>
 */

void trailingStopLossCandleLoop(string name,int begin,int price,int shift,double offset,int magic=EMPTY_VALUE,int type=CMD_ALL,bool floating=false) {   
   int total = OrdersTotal();
   for (int i=0;i<total;i++) trailingStopLossCandleOrder(i,SELECT_BY_POS,begin,price,shift,offset,type,name,floating);
}

void trailingStopLossCandleOrder(string name,int ticket,int select,int begin,int price,int shift,double offset,int magic=EMPTY_VALUE,int type=CMD_ALL,bool floating=false)   {
   if (magic==EMPTY_VALUE) magic = serverMagic;  
   if (cOrderSelect(ticket,select)) trailingStopLossCandle(begin,price,shift,offset,type,name,floating);       
}

void trailingStopLossCandle(string name,int begin,int price,int shift,double offset,int type=CMD_ALL,bool floating=false)   {
   if (type!=CMD_ALL)
      if (orderType!=type) return;   
   if (orderType>1) return;
   datetime candleTime = candleTime(begin);
   if (orderOpenTime>candleTime) return;      
   double val = ObjectGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   if (val==0) return;   
   double candlePrice = candlePrice(price,shift);
   bool update;
   if (orderType==OP_BUY) {
      if (!floating)
         if (orderStopLoss<candlePrice || val==-1) update = true;
      else update = true;
      candlePrice += offset*tickFractPoints;
   }
   else if (orderType==OP_SELL) {
      if (!floating)
         if (orderStopLoss>candlePrice || val==-1) update = true;
      else update = true;
      candlePrice -= offset*tickFractPoints;
   }   
   if (update) ObjectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,candlePrice);
}

