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

int arrayBSearch(double& arr[],double value,int count=WHOLE_ARRAY,int start=0,int mode=MODE_ASCEND) {
   return(ArrayBsearch(arr,value,count,start,mode));
}

int arrayCopyRates(double& arr[],string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(ArrayCopyRates(arr,symbol,timeframe));
}

int arrayCopySeries(double& arr[],int index,string symbol="",int timeframe=0)   {
   if (symbol=="") symbol = tickSymbol;
   return(ArrayCopySeries(arr,index,symbol,timeframe));
}

int arrayInitialize(double& arr[],double value)   {
   return(ArrayInitialize(arr,value));
}

int arrayMax(double& arr[],int count=WHOLE_ARRAY,int start=0)   {
   return(ArrayMaximum(arr,count,start));
}

int arrayMin(double& arr[],int count=WHOLE_ARRAY,int start=0)   {
   return(ArrayMinimum(arr,count,start));
}

bool arraySetAsSeries(double& arr[],bool set) {
   return(ArraySetAsSeries(arr,set));
}

int arraySort(double& arr[],int count=WHOLE_ARRAY,int start=0,int dir=MODE_ASCEND)   {
   return(ArraySort(arr,count,start,dir));
}


