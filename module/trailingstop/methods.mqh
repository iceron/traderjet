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

void trailingStopLossLoop(string name,double start,double step,double trailingstop,int magic=EMPTY_VALUE) {   
   int total = OrdersTotal();
   for (int i=0;i<total;i++) trailingStopLossOrder(i,start,step,trailingstop,magic,SELECT_BY_POS,name);
}

void trailingStopLossOrder(string name,int ticket,double start,double step,double trailingstop,int magic=EMPTY_VALUE,int select=SELECT_BY_TICKET)   {
   if (magic==EMPTY_VALUE) magic = serverMagic;  
   if (cOrderSelect(ticket,select)) trailingStopLoss(start,step,trailingstop,name);       
}

void trailingStopLoss(string name,double start,double step,double trailingstop)   {
   if (trailingstop<=0) return;
	bool mod;
	double newPrice,newPrice1,newPrice2;
   start *= tickFractPips;
   step *= tickFractPips;
   trailingstop *= tickFractPips;   
   double objval = ObjectGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   if (objval==0) return;   
   double objvalTicks = ticks(objval);
   int openTicks = ticks(orderOpenPrice);
   int closeTicks = ticks(orderClosePrice);
   if (orderType==OP_BUY) {
      if (orderProfitTicks>=start)	{
         newPrice1 = openTicks+start-trailingstop;
         newPrice2 = closeTicks-trailingstop;
			if ((objvalTicks<newPrice1 && newPrice2<=openTicks+start+step) || (objval==-1))  {
			   newPrice = newPrice1;
				mod = true;
	      }			
			else if (newPrice2>objvalTicks+step) {  
			   newPrice = newPrice2;
				mod = true;				
	      }			
		}
   }
   
   else if (orderType==OP_SELL) {
		if (orderProfitTicks>=start)	{
		   newPrice1 = openTicks-start+trailingstop;
         newPrice2 = closeTicks+trailingstop;
			if ((objvalTicks>newPrice1 && newPrice2>=openTicks-start-step) || (objval==-1))  {
			   newPrice = newPrice1;
				mod = true;
			}	
			else if (newPrice2<objvalTicks-step) {
			   newPrice = newPrice2;    
				mod = true;
			}	
		}
   }      
   if (mod) ObjectSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,cNormalizeDouble(newPrice*tickSize));
}	