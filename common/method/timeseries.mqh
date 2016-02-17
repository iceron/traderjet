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

double candle(int price,int shift=1,string symbol="",int timeframe=0)   {
   if (symbol=="") symbol = tickSymbol;
   switch(price)  {
      case PRICE_CLOSE: return(iClose(symbol,timeframe,shift));
      case PRICE_OPEN:  return(iOpen(symbol,timeframe,shift));
      case PRICE_HIGH:  return(iHigh(symbol,timeframe,shift));
      case PRICE_LOW:   return(iLow(symbol,timeframe,shift));
      default: {          
         Print("invalid price reference");
         return(0);
      }   
   }
}

bool barIsNew(int timeframe) {
   static datetime last;
   static string symbol;   
   if (symbol!=tickSymbol)   {
      last = 0;
      symbol = tickSymbol;
   }      
   datetime open = iTime(tickSymbol,timeframe,0);
   if (last==0 || open>last)   {
      last = open;
      return(true);
   } 
   return(false);
}

int barMatch(string symbol1,int timeframe1,int shift1,string symbol2,int timeframe2)   {
   datetime time1 = iTime(symbol1,timeframe1,shift1);
   return(iBarShift(symbol2,timeframe2,time1));  
}

double candlePrice(int type,int shift,string symbol="",int timeframe=0)   {
   switch(type)   {
      case PRICE_CLOSE: return(candleClose(shift,symbol,timeframe));
      case PRICE_OPEN:  return(candleOpen(shift,symbol,timeframe));
      case PRICE_HIGH:  return(candleHigh(shift,symbol,timeframe));
      case PRICE_LOW:   return(candleLow(shift,symbol,timeframe));
      default: Print("candlePrice(): invalid type for candle price function");
   }
   return(0);
}

double candleClose(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iClose(symbol,timeframe,shift));
}

double candleOpen(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iOpen(symbol,timeframe,shift));
}

double candleHigh(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iHigh(symbol,timeframe,shift));
}

double candleLow(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iLow(symbol,timeframe,shift));
}

datetime candleTime(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iTime(symbol,timeframe,shift));
}