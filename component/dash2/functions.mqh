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

int dash2XSpacing = 50;
int dash2YSpacing = 50;

void dash2TableCreate(string name,string& items[],string text,int x,int y,int corner=0,int angle=0,int fontsize=10,string font="Arial",color clr=Gray,int window=0)
{
   string columnHeaders;
   int size = arraySizeString(items),nextX = x;
   labelCreate(name,text,angle,corner,x,y,fontsize,font,clr,window);   
   for (int i=0;i<size;i++)   {
      columnHeaders = items[i];  
      labelSet(items[i],OBJPROP_XDISTANCE,nextX);
      labelSet(items[i],OBJPROP_YDISTANCE,dash2YSpacing+y);
      nextX += dash2XSpacing;
   }   
   objectSaveString(name+"headers",columnHeaders);
   objectSaveInt(name+"rows",1);
}

void dash2TableRowAdd(string name,string& items[])
{
   int rows,size = arraySizeString(items);
   objectLoadInt(name+"rows",rows);
   int nextY = labelGet(name,OBJPROP_YDISTANCE) + dash2YSpacing * (rows+1);
   int nextX = labelGet(name,OBJPROP_XDISTANCE);
   
   for (int i=0;i<size;i++)   {
      labelSet(items[i],OBJPROP_XDISTANCE,nextX);
      labelSet(items[i],OBJPROP_YDISTANCE,nextY);
      nextX += dash2XSpacing;
   }    
   objectSaveInt(name+"rows",rows+1); 
}

void dash2HeaderLabels(string str,double angle=0,int corner=0,int x=0,int y=0,int fontsize=10,string font="Arial",color clr=Gray,int window=0,string delim=",")   {
   string arr[100];
   stringToArray(str,arr);
   for (int i=0;i<100;i++) {
      string name = arr[i];
      if (name=="") continue;
      labelCreate(name,name,angle,corner,x,y,fontsize,font,clr,window);
   }
}


