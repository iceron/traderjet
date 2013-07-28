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
      int windowhandle = windowHandle(tickSymbol,timeframe);
      if (windowhandle==0) {
         sleep(serverSleepError);
         continue;
      }      
      int rand = mathRandS(timeCurrent()+windowhandle);
      val = mathPow(10,digits)*(rand/32767.0); 
      if (!magicCollisionCheck(val)) {
         globalVariableSet(doubleToString(val,0),val);  
         serverMagic = val;
         break;
      }
      sleep(serverSleepError);
   }
}

bool magicCollisionCheck(int& value)  {
   int i,existing,total = globalVariablesTotal();
   string name;
   for (i=0;i<total;i++)   {
      name = globalVariableName(i);
      existing = globalVariableGet(name);  
      if (value==existing || value==0) {
         printOut("automagic",stringConcatenate("calculated magic number already in use, getting new value.."," calculated: ",value," existing: ",existing));
         return(true);
      }   
   }   
   printOut("automagic",stringConcatenate("no magic number collission"," magic: ",value));
   return(false);
}


