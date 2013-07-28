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

int cBars(string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(iBars(symbol,timeframe));
}

int cBarShift(string symbol,int timeframe,datetime time,bool exact=false)   {
   return(iBarShift(symbol,timeframe,time,exact));
}

double cClose(string symbol,int timeframe,int shift)   {
   return(iClose(symbol,timeframe,shift));
}

double cHigh(string symbol,int timeframe,int shift)   {
   return(iHigh(symbol,timeframe,shift));
}

double cLow(string symbol,int timeframe,int shift)   {
   return(iLow(symbol,timeframe,shift));
}

double cOpen(string symbol,int timeframe,int shift)   {
   return(iOpen(symbol,timeframe,shift));
}

int cHighest(string symbol,int timeframe,int type,int count=WHOLE_ARRAY,int start=0) {
   return(iHighest(symbol,timeframe,type,count));
}

int cLowest(string symbol,int timeframe,int type,int count=WHOLE_ARRAY,int start=0) {
   return(iLowest(symbol,timeframe,type,count));
}

datetime cTime(string symbol,int timeframe,int shift)  {
   return(iTime(symbol,timeframe,shift));
}

double cVolume(string symbol,int timeframe,int shift)  {
   return(iVolume(symbol,timeframe,shift));
}