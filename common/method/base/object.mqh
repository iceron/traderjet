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

string objectDescription(string name)  {
   return(ObjectDescription(name));
}

string objectGetFiboDescription(string name,int index)  {
   return(ObjectGetFiboDescription(name,index));
}

bool objectSetFiboDescription(string name,int index,string text)  {
   return(ObjectSetFiboDescription(name,index,text));
}

int objectGetShiftByValue(string name,double value)   {
   return(ObjectGetShiftByValue(name,value));
}

int objectGetValueByShift(string name,int shift)   {
   return(ObjectGetValueByShift(name,shift));
}

bool objectMove(string name,int point,datetime time,double price) {
   return(ObjectMove(name,point,time,price));
}

int objectsTotal()  {
   return(ObjectsTotal());
}

string objectName(int pos)   {
   return(ObjectName(pos));
}

int objectsDeleteAll(int window=EMPTY,int type=EMPTY) {
   return(ObjectsDeleteAll(window,type));
}

int objectType(string name)  {
   return(ObjectType(name));
}

bool objectCreate(string object.name,int objectType,int object.window=0,datetime object.time1=0,double object.price1=0,datetime object.time2=0,double object.price2=0,datetime object.time3=0,double object.price3=0) {
   bool res;
   if (objectFind(object.name)==-1)
      res = ObjectCreate(object.name,objectType,object.window,object.time1,object.price1,object.time2,object.price2,object.time3,object.price3);    
   return(res);
}

bool objectSet(string object.name,int object.index,double object.value)   {
   bool res;
   if (objectFind(object.name)!=-1) 
      res = ObjectSet(object.name,object.index,object.value);
   return(res);   
}

bool objectSetText(string object.name,string objectText,int object.fontsize=8,string object.font="Arial",color object.color=CLR_NONE)   {
   bool res;
   if (objectFind(object.name)!=-1)
      res = ObjectSetText(object.name,objectText,object.fontsize,object.font,object.color);
   return(res);   
}

double objectGet(string object.name,int object.index)  {
   if (objectFind(object.name)!=-1)
      return(ObjectGet(object.name,object.index));      
   return(-1);
}

int objectFind(string object.name){
   if (object.name=="") return(-1);
   return(ObjectFind(object.name));
}

bool objectDelete(string object.name){
   if (objectFind(object.name)>=0)
      return(ObjectDelete(object.name));
   return(true);   
}







