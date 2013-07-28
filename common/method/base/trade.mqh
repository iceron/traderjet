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


