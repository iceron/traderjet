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

bool objectCreate(string objectName,int objectType,int objectWindow=0,datetime objectTime1=0,double objectPrice1=0,datetime objectTime2=0,double objectPrice2=0,datetime objectTime3=0,double objectPrice3=0) {
   bool res;
   if (objectFind(objectName)==-1)
      res = ObjectCreate(objectName,objectType,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2,objectTime3,objectPrice3);    
   return(res);
}

bool objectSet(string objectName,int objectIndex,double objectValue)   {
   bool res;
   if (objectFind(objectName)!=-1) 
      res = ObjectSet(objectName,objectIndex,objectValue);
   return(res);   
}

bool objectSetText(string objectName,string objectText,int objectFontsize=8,string objectFont="Arial",color objectColor=CLR_NONE)   {
   bool res;
   if (objectFind(objectName)!=-1)
      res = ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor);
   return(res);   
}

double objectGet(string objectName,int objectIndex)  {
   if (objectFind(objectName)!=-1)
      return(ObjectGet(objectName,objectIndex));      
   return(-1);
}

int objectFind(string objectName){
   if (objectName=="") return(-1);
   return(ObjectFind(objectName));
}

bool objectDelete(string objectName){
   if (objectFind(objectName)>=0)
      return(ObjectDelete(objectName));
   return(true);   
}







