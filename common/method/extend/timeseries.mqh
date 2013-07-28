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
      case PRICE_CLOSE: return(cClose(symbol,timeframe,shift));
      case PRICE_OPEN:  return(cOpen(symbol,timeframe,shift));
      case PRICE_HIGH:  return(cHigh(symbol,timeframe,shift));
      case PRICE_LOW:   return(cLow(symbol,timeframe,shift));
      default: {          
         print("invalid price reference");
         return(0);
      }   
   }
}

bool barIsNew(int& timeframe) {
   static datetime last;
   static string symbol;   
   if (symbol!=tickSymbol)   {
      last = 0;
      symbol = tickSymbol;
   }      
   datetime open = cTime(tickSymbol,timeframe,0);
   if (last==0)   {
      last = open;
      return(true);
   }   
   return(false);
}

int barMatch(string symbol1,int timeframe1,int shift1,string symbol2,int timeframe2)   {
   datetime time1 = cTime(symbol1,timeframe1,shift1);
   return(cBarShift(symbol2,timeframe2,time1));  
}

