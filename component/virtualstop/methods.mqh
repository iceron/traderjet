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

void vstopInit(int slmode,int tpmode)  {
   vstopStopLossMode = slmode;
   vstopTakeProfitMode = tpmode;
   if (slmode==STEALTH_PURE)    {
      serverStopLossModify = false;      
   }   
   if (tpmode==STEALTH_PURE)    {
      serverTakeProfitModify = false;      
   }      
}

void vstopSetLoop(string name,double stoploss,double takeprofit,int magic=EMPTY_VALUE) {   
   int total = OrdersTotal();
   for (int i=0;i<total;i++) vstopSetOrder(name,stoploss,takeprofit,i,magic,SELECT_BY_POS);
}

void vstopSetOrder(string name,double stoploss,double takeprofit,int ticket=0,int magic=EMPTY_VALUE,int select=SELECT_BY_TICKET)   {
   if (magic==EMPTY_VALUE) magic = serverMagic;   
   if (OrderSelect(ticket,select)) vstopSet(name,stoploss,takeprofit);
}

void vstopSet(string name,double vstopsetStoploss,double vstopsetTakeprofit)   {
   color clr_tp,clr_sl;   
   if (orderIsLong())  {
      vstopsetStoploss = -vstopsetStoploss;
      clr_sl = vstopLongStopLossColor;
      clr_tp = vstopLongTakeProfitColor;
   }   
   if (orderIsShort()) {
      vstopsetTakeprofit = -vstopsetTakeprofit;
      clr_sl = vstopShortStopLossColor;
      clr_tp = vstopShortTakeProfitColor;
   }   
   if (vstopStopLossMode>0 && MathAbs(vstopsetStoploss)>0) vstopSetCreate(name,vstopStopLossName,vstopsetStoploss,MODE_STOPLOSS,clr_sl);
   if (vstopTakeProfitMode>0 && MathAbs(vstopsetTakeprofit)>0) vstopSetCreate(name,vstopTakeProfitName,vstopsetTakeprofit,MODE_TAKEPROFIT,clr_tp);
}

void vstopSetCreate(string& name,string type,double& val,int stoptype,color clr)  {
   double v,stop;
   int temp,mode;  
   if (ObjectFind(name+type+orderTicket)==-1) {    
      if (stoptype==MODE_STOPLOSS)  {                  
         stop = orderStopLoss;
         mode = vstopStopLossMode;
         if (orderType==OP_BUY) temp = -1;
         else if (orderType==OP_SELL) temp = EMPTY_VALUE;   
      }   
      else if (stoptype==MODE_TAKEPROFIT) {
         stop = orderTakeProfit;
         mode = vstopTakeProfitMode;
         if (orderType==OP_BUY) temp = EMPTY_VALUE;
         else if (orderType==OP_SELL) temp = -1;  
      }         
      if (name==vstopStandardName && mode!=STEALTH_PURE) v = stop;
      else  {
         if (!pricesIsEqual(val,0)) v = orderOpenPrice+val*tickFractPoints;
         //else v = stop;
      }
      if (!pricesIsEqual(v,0)) hlineCreate(name+type+orderTicket,v);
      else hlineCreate(name+type+orderTicket,temp);      
      if (ObjectFind(name+type+orderTicket)!=-1) ObjectSet(name+type+orderTicket,OBJPROP_COLOR,clr);         
   }
}

void vstopUpdateLoop(string name,double stoploss,double takeprofit,int magic=EMPTY_VALUE) {   
   int total = OrdersTotal();
   for (int i=0;i<total;i++) vstopUpdateOrder(name,stoploss,takeprofit,i,magic,SELECT_BY_POS);
}

void vstopUpdateOrder(string name,double stoploss,double takeprofit,int ticket,int magic=EMPTY_VALUE,int select=SELECT_BY_TICKET)   {
   if (magic==EMPTY_VALUE) magic = serverMagic;  
   if (OrderSelect(ticket,select)) vstopUpdate(name,stoploss,takeprofit);       
}

void vstopUpdate(string name,double stoploss,double takeprofit)   {
   hlineSet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1,stoploss);
   hlineSet(name+vstopTakeProfitName+orderTicket,OBJPROP_PRICE1,takeprofit); 
}


void vstopAdjustLoop(string name,int magic=EMPTY_VALUE){
   int total = OrdersTotal();
   for (int i=0;i<total;i++) vstopAdjustOrder(name,i,magic,SELECT_BY_POS);
}

void vstopAdjustOrder(string name,int ticket,int magic=EMPTY_VALUE,int select=SELECT_BY_TICKET)   {
   if (magic==EMPTY_VALUE) magic = serverMagic; 
   if (OrderSelect(ticket,select)) vstopAdjust(name); 
}

void vstopAdjust(string name)   {
   double vstopStoploss,vstopTakeprofit,objStoploss,objTakeprofit;
   bool mod1,mod2,mod,sendtobroker = true;
   objStoploss = hlineGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
   objTakeprofit = hlineGet(name+vstopTakeProfitName+orderTicket,OBJPROP_PRICE1);
   vstopStoploss = orderStopLoss;
   vstopTakeprofit = orderTakeProfit;    
   vstopAdjustCompare(mod1,objStoploss,orderStopLoss,vstopStoploss);
   vstopAdjustCompare(mod2,objTakeprofit,orderTakeProfit,vstopTakeprofit);  
   if (mod1 || mod2) mod = true;
   if (!mod) return;
   vstopAdjustSendToBroker(sendtobroker,objStoploss,objTakeprofit);      
   if (sendtobroker) cOrderModify(orderTicket,orderOpenPrice,vstopStoploss,vstopTakeprofit);             
}

void vstopAdjustCompare(bool& ret,double& objval,double& val,double& stop)   {
   if (!pricesIsEqual(objval,val) && objval>0) {
      if (objval>0 && objval<EMPTY_VALUE)  {
         stop = objval;
         ret = true;
      }
   } 
}

void vstopAdjustSendToBroker(bool& sendtobroker,double& stoploss,double& takeprofit) {    
   if (orderType==OP_SELL) {
      if ((stoploss>0 && stoploss<orderClosePrice) && (takeprofit>0 && takeprofit>orderClosePrice)) 
         sendtobroker = false;
   }      
   else if (orderType==OP_BUY)   {
      if ((stoploss>0 && stoploss>orderClosePrice) && (takeprofit>0 && takeprofit<orderClosePrice)) 
         sendtobroker = false; 
   } 
}

void vstopCheckLoop(string name,int magic=EMPTY_VALUE){   
   int total = OrdersTotal();
   for (int i=0;i<total;i++) vstopCheckOrder(name,i,magic,SELECT_BY_POS);
}

void vstopCheckOrder(string name,int ticket,int magic=EMPTY_VALUE,int select=SELECT_BY_TICKET)  {
   if (magic==EMPTY_VALUE) magic = serverMagic; 
   if (OrderSelect(ticket,select)) vstopCheck(name);
}

void vstopCheck(string name,double lots=0) {
   double val;
   if (orderCloseTime>0) return;     
   if (vstopStopLossMode>0) {
      val = hlineGet(name+vstopStopLossName+orderTicket,OBJPROP_PRICE1);
      vstopCheckClose(name,val,vstopStopLossName,lots);
   }   
   if (vstopTakeProfitMode>0)  {
      val = hlineGet(name+vstopTakeProfitName+orderTicket,OBJPROP_PRICE1);
      vstopCheckClose(name,val,vstopTakeProfitName,lots);
   }   
}

bool vstopCheckClose(string& name,double& val,string type,double& lots)   {
   double stop;
   bool close;
   if (objectHidden(name+type+orderTicket)) return(false);
   if (type==vstopStopLossName) stop = orderStopLoss;
   else if (type==vstopTakeProfitName) stop = orderTakeProfit;
   if ((orderType==OP_SELL && type==vstopTakeProfitName) || (orderType==OP_BUY && type==vstopStopLossName))   {
      if (val>0 && val<EMPTY_VALUE && !pricesIsEqual(val,stop))
         if (orderClosePrice<=val) close = true;
   }   
   else if ((orderType==OP_BUY && type==vstopTakeProfitName) || (orderType==OP_SELL && type==vstopStopLossName))   {
      if (val>0 && val<EMPTY_VALUE && !pricesIsEqual(val,stop)) 
         if (orderClosePrice>=val) close = true; 
   }   
   if (close)   {
      if (cOrderClose(orderTicket,lots))  {
         objectHide(name+type+orderTicket);
         Print(StringConcatenate("vstopCheckClose():","exit signal by: ",name,type,orderTicket));
         if (lots>0 || orderVolume>lots)   {
            int newticket = ticketGet();
            vstopInherit(newticket, orderTicket);
         }
      }
   }      
   return(close);
}

void vstopCleanLoop() {
   int total = ObjectsTotal();
   string name;
   int ticket;
   for (int i=0;i<total;i++)   {
      name = ObjectName(i);  
      if (name=="") continue;
      if (ObjectType(name)!=OBJ_HLINE) continue;
      ticket = stringExtractInt(name);   
      if (OrderSelect(ticket,SELECT_BY_TICKET))      {
         if (orderCloseTime>0) 
            if (ObjectDelete(name))
               Print(StringConcatenate("vstopCleanLoop(): ",name," deleted"));
      }
   }
}

void vstopCleanObject(string name)   {
   vstopClean(name);
}

void vstopClean(string name) {
   if (objectExistsDeleted(name+vstopStopLossName+orderTicket)) Print("vstopClean(): ",StringConcatenate(name,vstopStopLossName,orderTicket," deleted"));
   if (objectExistsDeleted(name+vstopTakeProfitName+orderTicket)) Print("vstopClean(): ",StringConcatenate(name,vstopTakeProfitName,orderTicket," deleted"));
}

bool vstopInherit(int newticket, int oldticket)   {
   if (newticket<=0) return(false);
   int total = ObjectsTotal();
   string n = DoubleToStr(newticket,0);
   string o = DoubleToStr(oldticket,0);
   for (int i=0;i<total;i++)   {
      string newname,name = ObjectName(i);
      if (name=="") continue;    
      if (ObjectType(name)!=OBJ_HLINE) continue;
      double val = hlineGet(name,OBJPROP_PRICE1);
      if (StringFind(name,vstopSep+o)>=0)  {
         newname = stringReplace(name,vstopSep+o,vstopSep+n);
         if (objectClone(newname,name)) total++;
      }   
   }   
   return(true);
}

int ticketGet()  {
   int total = OrdersTotal();
   for (int i=0;i<total;i++)  {
      if (!OrderSelect(i,SELECT_BY_POS)) continue;
      if (OrderMagicNumber()==serverMagic) return(OrderTicket());
   }
   return(-1);
}

