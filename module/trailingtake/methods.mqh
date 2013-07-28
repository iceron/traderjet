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