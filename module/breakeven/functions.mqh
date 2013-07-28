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

void breakevenLoop(string name,double breakeven,int magic=-1,int type=CMD_MARKET,string name="stealth")  {
   bool mod;
   int i,total = ordersTotal();
   for (i=0;i<total;i++) breakevenOrder(i,SELECT_BY_POS,breakeven,magic,type); 
}

void breakevenOrder(string name,int ticket,int select,double breakeven,int magic,int type=CMD_MARKET,string name="stealth"){
   if (cOrderSelect(ticket,select,MODE_TRADES)) breakeven(breakeven);
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

