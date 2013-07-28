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

double candlePrice(int type,int shift,string symbol="",int timeframe=0)   {
   switch(type)   {
      case PRICE_CLOSE: return(candleClose(shift,symbol,timeframe));
      case PRICE_OPEN:  return(candleOpen(shift,symbol,timeframe));
      case PRICE_HIGH:  return(candleHigh(shift,symbol,timeframe));
      case PRICE_LOW:   return(candleLow(shift,symbol,timeframe));
      default: printOut("candlePrice","invalid type for candle price function");
   }
   return(0);
}

double candleClose(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cClose(symbol,timeframe,shift));
}

double candleOpen(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cOpen(symbol,timeframe,shift));
}

double candleHigh(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cHigh(symbol,timeframe,shift));
}

double candleLow(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cLow(symbol,timeframe,shift));
}

datetime candleTime(int shift,string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(cTime(symbol,timeframe,shift));
}