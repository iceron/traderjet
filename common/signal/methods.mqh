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

int signalFilter(int& arr[]){
   int a,b,i,s;
   if (arr[ArrayMinimum(arr)]==CMD_VOID) return(CMD_VOID);
   if (arr[ArrayMaximum(arr)]==CMD_ALL) return(CMD_ALL);  
   int size = arraySizeInt(arr);
   while (i<size-2)   {
      a = arr[i];
      b = arr[i+1];      
      if (a==CMD_NEUTRAL)  {
         i++;
         continue;  
      }  else s = a;
      while(b==CMD_NEUTRAL && i<size-1){
         i++;
         b = arr[i];
      }
      if (a!=b && b!=CMD_NEUTRAL){
         s = CMD_VOID;
         break;
      } 
      i++;      
   }
   return(s);
}

string signalText(int signal,bool reverse=false){
   switch(signal) {
      case CMD_VOID:{
         if (reverse) return("ALL");
         return("VOID");
      }
      case CMD_NEUTRAL:{
         return("NEUTRAL");
      }
      case CMD_LONG:{
         if (reverse) return("SHORT");
         return("LONG");
      }
      case CMD_SHORT:{
         if (reverse) return("LONG");
         return("SHORT");
      }
      case CMD_ALL:{
         if (reverse) return("VOID");
         return("ALL");
      }
   }
   return(NULL);  
}

void signalManage(int& open,int& close,int timeframe=0)  {
   signalManageReset();
   static int last;
   bool newbar = barIsNew(timeframe);
   signalNewBar = newbar;
   string out = SIGNAL_OPEN;
   if (SignalModeReverse)   {
      if (open==CMD_LONG) open = CMD_SHORT;
      else if (open==CMD_SHORT) open = CMD_LONG;   
   }
   if (!serverEntryEnabled)
      open = CMD_VOID;  
   if (!SignalModeEveryTick && !newbar)
      open = CMD_VOID;     
   if (!serverExitEnabled)
      close = CMD_NEUTRAL;    
   signalOpen = signalText(open);
   signalClose = signalText(close,true);
   if (open==signalReverse(close) || close==CMD_ALL) {      
      open = CMD_VOID;
      out = SIGNAL_CLOSE;
   }   
   else if (open==CMD_VOID) out = SIGNAL_VOID;
   signalOut = out;
   if (SignalModeTradeOncePerBar && open>CMD_VOID) {
      if (newbar) last = CMD_VOID;
      if (last!=open)   {
         last = open;
         signalDone = SIGNAL_NOT_DONE;
      }   
      else  {
         last = open;  
         open = CMD_VOID;       
         signalDone = SIGNAL_DONE;         
      }        
   }      
}

void signalManageReset()   {
   signalNewBar = false;
   signalOut = "";
   signalDone = "";
   signalOpen = "";
   signalClose = "";
}



void signalInit(int open=0,int close=0)   {
   arrayResizeInt(signalEntryArray,open);
   arrayResizeInt(signalExitArray,close); 
   ArrayInitialize(signalEntryArray,0);
   ArrayInitialize(signalExitArray,0); 
}

bool signalIsEnabled(int signal) {
   if ((signal==CMD_LONG && serverLongEnabled) || (signal==CMD_SHORT && serverShortEnabled)) return(true);
   return(false);
}
void filterInit(int& num) {
   num = 0;       
}

void filterAdd(int filter,int& arr[],int& num) {
   arr[num] = filter; 
   num++;
}

bool filterInclude(bool toggle,bool entry=true) {
   if (toggle)   {
      if (entry) filterEntryNum++;
      else filterExitNum++;
      return(true);
   }
   return(false);
}

int signalReverse(int signal) {
   switch(signal) {
      case CMD_VOID:{
         return(CMD_ALL);
      }
      case CMD_NEUTRAL:{
         return(signal);
      }
      case CMD_BUY:{
         return(CMD_SELL);
      }
      case CMD_SELL:{
         return(CMD_BUY);
      }
      case CMD_BUYLIMIT:{
         return(CMD_SELLLIMIT);
      }
      case CMD_SELLLIMIT:{
         return(CMD_BUYLIMIT);
      }
      case CMD_BUYSTOP:{
         return(CMD_SELLSTOP);
      }
      case CMD_SELLSTOP:{
         return(CMD_BUYSTOP);
      }
      case CMD_LONG:{
         return(CMD_SHORT);
      }
      case CMD_SHORT:{
         return(CMD_LONG);
      }
      case CMD_LIMIT:{
         return(CMD_STOP);
      }
      case CMD_STOP:{
         return(CMD_LIMIT);
      }
      case CMD_MARKET:{
         return(CMD_PENDING);
      }
      case CMD_PENDING:{
         return(CMD_MARKET);
      }
      case CMD_ALL:{
         return(CMD_VOID);
      }
   }
   return(CMD_VOID);
}