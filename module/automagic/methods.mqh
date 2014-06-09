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

void magicSet(int digits = 3)  {
   int val;
   if (serverMagic>=0) return;
   while(true)   {
      int windowhandle = WindowHandle(tickSymbol,0);
      if (windowhandle==0) {
         Sleep(serverSleepError);
         continue;
      }      
      int r = mathRandS(TimeCurrent()+windowhandle);
      val = MathPow(10,digits)*(r/32767.0); 
      if (!magicCollisionCheck(val)) {
         GlobalVariableSet(DoubleToString(val,0),val);  
         serverMagic = val;
         break;
      }
      Sleep(serverSleepError);
   }
}

bool magicCollisionCheck(int& value)  {
   int i,existing,total = GlobalVariablesTotal();
   string name;
   for (i=0;i<total;i++)   {
      name = GlobalVariableName(i);
      existing = GlobalVariableGet(name);  
      if (value==existing || value==0) {
         Print("automagic: ",StringConcatenate("calculated magic number already in use, getting new value.."," calculated: ",value," existing: ",existing));
         return(true);
      }   
   }   
   Print("automagic: ",StringConcatenate("no magic number collission"," magic: ",value));
   return(false);
}


