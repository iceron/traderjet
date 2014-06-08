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

//#define DASH_HEADER "---------------------"
#define DASH_HEADER "----- click and drag -----"

void dashCreate()  {
   dashDelete();
   if (IsTesting() && !IsVisualMode()) return;
   labelCreateUpdate(dashName,DASH_HEADER,0,dashCorner,dashX,dashY,dashFontSize,dashFont,dashTermColor);
   dashXDef = dashX;
   dashYDef = dashY;
   dashActive = true;
   dashReset();
}

void dashAdd(string name,string text1,string text2="",int offset=0) {
   if (!dashActive) return;
   if (offset==0) offset = dashXOffset;
   labelCreateUpdate(dashName+name+1,text1,0,dashCorner,dashXNext,dashYNext,dashFontSize,dashFont,dashTermColor);
   labelCreateUpdate(dashName+name+2,text2,0,dashCorner,dashXNext+offset,dashYNext,dashFontSize,dashFont,dashValueColor);
   dashXNext += dashXSpacing;
   dashYNext += dashYSpacing;
}

void dashReset() {
   dashXNext = dashX + dashXSpacing;
   dashYNext = dashY + dashYSpacing;
}

void dashDelete()   {
   int i,total = ObjectsTotal();
   for (i=total-1;i>=0;i--)   {
      string name = ObjectName(i);
      if (ObjectType(name)!=OBJ_LABEL) continue;
      if (StringFind(name,dashName)>=0)
         if (ObjectDelete(name)) name="";
   }      
}

void dashUpdate()   {
   if (dashActive && !objectExists(dashName)) {
      dashY = dashYDef;
      dashX = dashXDef;
      //Print(dashX," ",dashY);
      dashCreate();
   }   
   dashX = labelGet(dashName,OBJPROP_XDISTANCE);
   dashY = labelGet(dashName,OBJPROP_YDISTANCE);
   dashReset();
}