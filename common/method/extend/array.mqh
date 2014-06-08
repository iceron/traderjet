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
 
int arrayCopyInt(int& des[],int& source[],int start_des=0,int start_source=0,int count=0)   {
   return(ArrayCopy(des,source,start_des,start_source,count));
}

int arrayCopyDouble(double& des[],double& source[],int start_des=0,int start_source=0,int count=0)   {
   return(ArrayCopy(des,source,start_des,start_source,count));
}

int arrayCopyString(string& des[],string& source[],int start_des=0,int start_source=0,int count=0)   {
   return(ArrayCopy(des,source,start_des,start_source,count));
}

int arrayCopyBool(bool& des[],bool& source[],int start_des=0,int start_source=0,int count=0)   {
   return(ArrayCopy(des,source,start_des,start_source,count));
}

int arrayCopyDateTime(datetime& des[],datetime& source[],int start_des=0,int start_source=0,int count=0)   {
   return(ArrayCopy(des,source,start_des,start_source,count));
}

int arrayCopyColor(color& des[],color& source[],int start_des=0,int start_source=0,int count=0)   {
   return(ArrayCopy(des,source,start_des,start_source,count));
}

int arrayDimensionString(string& arr[]) {
   return(ArrayDimension(arr));
}

int arrayDimensionDouble(double& arr[]) {
   return(ArrayDimension(arr));
}

int arrayDimensionInt(int& arr[]) {
   return(ArrayDimension(arr));
}

int arrayDimensionDateTime(datetime& arr[]) {
   return(ArrayDimension(arr));
}

int arrayDimensionColor(color& arr[]) {
   return(ArrayDimension(arr));
}

int arrayDimensionBool(bool& arr[]) {
   return(ArrayDimension(arr));
}

bool arrayGetAsSeriesString(string& arr[]) {
   return(ArrayGetAsSeries(arr));
}

bool arrayGetAsSeriesDouble(double& arr[]) {
   return(ArrayGetAsSeries(arr));
}

bool arrayGetAsSeriesInt(int& arr[]) {
   return(ArrayGetAsSeries(arr));
}

bool arrayGetAsSeriesDateTime(datetime& arr[]) {
   return(ArrayGetAsSeries(arr));
}

bool arrayGetAsSeriesColor(color& arr[]) {
   return(ArrayGetAsSeries(arr));
}

bool arrayGetAsSeriesBool(bool& arr[]) {
   return(ArrayGetAsSeries(arr));
}

bool arrayIsSeriesString(string& arr[]) {
   return(ArrayIsSeries(arr));
}

bool arrayIsSeriesDouble(double& arr[]) {
   return(ArrayIsSeries(arr));
}

bool arrayIsSeriesInt(int& arr[]) {
   return(ArrayIsSeries(arr));
}

bool arrayIsSeriesDateTime(datetime& arr[]) {
   return(ArrayIsSeries(arr));
}

bool arrayIsSeriesColor(color& arr[]) {
   return(ArrayIsSeries(arr));
}

bool arrayIsSeriesBool(bool& arr[]) {
   return(ArrayIsSeries(arr));
}

int arrayRangeString(string& arr[],int index)   {
   return(ArrayRange(arr,index));
}

int arrayRangeDouble(double& arr[],int index)   {
   return(ArrayRange(arr,index));
}

int arrayRangeInt(int& arr[],int index)   {
   return(ArrayRange(arr,index));
}

int arrayRangeDateTime(datetime& arr[],int index)   {
   return(ArrayRange(arr,index));
}

int arrayRangeColor(color& arr[],int index)   {
   return(ArrayRange(arr,index));
}

int arrayRangeBool(bool& arr[],int index)   {
   return(ArrayRange(arr,index));
}

int arrayResizeString(string& arr[],int newsize) {
   return(ArrayResize(arr,newsize));
}

int arrayResizeDouble(double& arr[],int newsize) {
   return(ArrayResize(arr,newsize));
}

int arrayResizeInt(int& arr[],int newsize) {
   return(ArrayResize(arr,newsize));
}

int arrayResizeDateTime(datetime& arr[],int newsize) {
   return(ArrayResize(arr,newsize));
}

int arrayResizeColor(color& arr[],int newsize) {
   return(ArrayResize(arr,newsize));
}

int arraySizeString(string& arr[])   {
   return(ArraySize(arr));
}

int arraySizeDouble(double& arr[])   {
   return(ArraySize(arr));
}

int arraySizeInt(int& arr[])   {
   return(ArraySize(arr));
}

int arraySizeDateTime(datetime& arr[])   {
   return(ArraySize(arr));
}

int arraySizeColor(color& arr[])   {
   return(ArraySize(arr));
}

int arraySizeBool(bool& arr[])   {
   return(ArraySize(arr));
}

int arrayInitializeInt(int& arr[],int value) {
   return(ArrayInitialize(arr,value));
}

int arrayInitializeColor(color& arr[],int value) {
   return(ArrayInitialize(arr,value));
}  

void stringToDoubleArray(string str, double& arr[],string delim=",",double init=0.0) { 
   int strLen = StringLen(str);
   if (strLen==0) return;
   int i,j;
   
   ArrayInitialize(arr,init);

   while (i<strLen)   {
      int delimNext = StringFind(str,delim,i);    
      if (delimNext==-1) {
         arr[j] = StringToDouble(StringSubstr(str,i));
         break;  
      }   
      arr[j] = StringToDouble(StringSubstr(str,i,delimNext-i));
      j++;      
      i = delimNext+1;
   } 
}

void stringToIntArray(string str, int& arr[],string delim=",",int init=0)   { 
   int strLen = StringLen(str);
   if (strLen==0) return;
   int i,j;
      
   arrayInitializeInt(arr,init);

   while (i<strLen)   {
      int delimNext = StringFind(str,delim,i);   
      if (delimNext==-1)   {
         arr[j] = StringToDouble(StringSubstr(str,i));
         break;   
      }   
      arr[j] = StringToDouble(StringSubstr(str,i,delimNext-i));
      j++;      
      i = delimNext+1;
   } 
   return;
}

void stringToArray(string str, string& arr[],string delim=",",string init="")  { 
   int strLen = StringLen(str);
   if (strLen==0) return;
   int i,j;
   
   for (int z=0;z<strLen;z++)
      arr[z] = init;

   while (i<strLen)   {
      int delimNext = StringFind(str,delim,i);
      if (delimNext==-1)   {
         arr[j] = StringSubstr(str,i);
         break;      
      }   
      arr[j] = StringSubstr(str,i,delimNext-i);
      j++;      
      i = delimNext+1;
   } 
   return;
}

void stringToColorArray(string str, color& arr[],string delim=",",int init=CLR_NONE)   { 
   int strLen = StringLen(str);
   if (strLen==0) return;
   int i,j;
      
   arrayInitializeColor(arr,init);

   while (i<strLen)   {
      int delimNext = StringFind(str,delim,i);   
      if (delimNext==-1)   {
         arr[j] = StringToColor(StringSubstr(str,i));
         break;   
      }   
      arr[j] = StringToColor(StringSubstr(str,i,delimNext-i));
      j++;      
      i = delimNext+1;
   } 
   return;
}

bool doubleInArray(double val,double& arr[])
{
   bool ret;
   int size = arraySizeDouble(arr)-1;
   while(size>0)  {
      if (pricesIsEqual(val,arr[size]))   {
         ret = true;
         break;
      }   
      size--;
   }
   return(ret);
}

bool intInArray(int val,int& arr[])
{
   bool ret;
   int size = arraySizeInt(arr)-1;
   while(size>0)  {
      if (val==arr[size])  {
         ret = true;
         break;
      }   
      size--;
   }
   return(ret);
}
bool stringInArray(string val,string& arr[])
{
   bool ret;
   int size = arraySizeString(arr)-1;
   while(size>0)  {
      if (val==arr[size])  {
         ret = true;
         break;
      }   
      size--;
   }
   return(ret);
}