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

void breakevenLoop(string name,double target,double offset,int magic=-1)  {
   int i,total = OrdersTotal();
   for (i=0;i<total;i++) breakevenOrder(name,i,target,offset,magic,SELECT_BY_POS); 
}

void breakevenOrder(string name,int ticket,double target,double offset,int magic,int select=SELECT_BY_TICKET){
   if (cOrderSelect(ticket,select,MODE_TRADES)) breakeven(name,target,offset);
}

void breakeven(string name,double target,double offset=0)  {   
   if (target<=0) return;   
   double open,val = ObjectGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   if (val==0) return;
	if (orderType==OP_BUY)	{
		open = cNormalizeDouble(orderOpenPrice+offset*tickFractPoints);
		if (ticks(orderClosePrice-orderOpenPrice)>target*tickFractPips) {
			if (!isPriceSame(val,open))  {				
				//if (val>open) return;
				ObjectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,open);
			}
		} 
	}
	else if (orderType==OP_SELL)	{
		open = cNormalizeDouble(orderOpenPrice-offset*tickFractPoints);
		if (ticks(orderOpenPrice-orderClosePrice)>target*tickFractPips) {
			if (!isPriceSame(val,open))  {				
				//if (val<open) return;
				ObjectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,open);
			}
		} 
	}	
	
	Print(target," ",offset," ",OrderOpenPrice()," ",open);
	
}

