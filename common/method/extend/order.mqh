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

void orderSelectSet(int magic,int type=CMD_ALL, string symbol="") {
   orderSelectMagic = magic;
   orderSelectType = type;
   orderSelectSymbol = symbol;  
}

void orderSelectReset() {
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


bool cOrderSelect(int index,int select=SELECT_BY_POS,int pool=MODE_TRADES){
   bool res;
   res = orderSelect(index,select,pool);
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
   orderClosePrice = orderClosePrice();
   orderOpenPrice = orderOpenPrice();  
   orderCommission = orderCommission();
   orderVolume = orderLots();
   orderProfit = orderProfit();
   orderStopLoss = orderStopLoss();
   orderTakeProfit = orderTakeProfit();
   orderSwap = orderSwap();
   
   orderSymbol = orderSymbol();
   orderComment = orderComment();
    
   orderExpiration = orderExpiration();
   orderCloseTime = orderCloseTime();
   orderOpenTime = orderOpenTime();
   
   orderMagic = orderMagicNumber();
   orderTicket = orderTicket();
   orderType = orderType();
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

bool orderInGroup(int type,int ordType){
   bool res;   
   switch(type)   {
      case CMD_BUY:      {
         if (ordType==OP_BUY) res = true;
         break;
      }
      case CMD_SELL:      {
         if (ordType==OP_SELL) res = true;
         break;
      }
      case CMD_BUYLIMIT:      {
         if (ordType==OP_BUYLIMIT) res = true;
         break;
      }
      case CMD_SELLLIMIT:      {
         if (ordType==OP_SELLLIMIT) res = true;
         break;
      }
      case CMD_BUYSTOP:      {
         if (ordType==OP_BUYSTOP) res = true;
         break;
      }
      case CMD_SELLSTOP:      {
         if (ordType==OP_SELLSTOP) res = true;
         break;
      }
      case CMD_LONG:      {
         if (ordType==OP_BUY || ordType==OP_BUYSTOP || ordType==OP_BUYLIMIT) res = true;
         break;
      }
      case CMD_SHORT:      {
         if (ordType==OP_SELL || ordType==OP_SELLSTOP || ordType==OP_SELLLIMIT) res = true;
         break;
      }
      case CMD_STOP:      {
         if (ordType==OP_SELLSTOP || ordType==OP_BUYSTOP) res = true;
         break;
      }
      case CMD_LIMIT:      {
         if (ordType==OP_SELLLIMIT || ordType==OP_BUYLIMIT) res = true;
         break;
      }
      case CMD_MARKET:      {
         if (ordType<=1) res = true;
         break;
      }
      case CMD_PENDING:      {
         if (ordType>1) res = true;
         break;
      }
      case CMD_ALL:      {      
         res = true;
         break;
      }
   }
   return(res);
}

int orderCount(int pool=MODE_TRADES){
   int count,total;
   if (pool==MODE_TRADES) total = ordersTotal();
   else total = ordersHistoryTotal();
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