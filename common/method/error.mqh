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

int errorCritListReal[] = {3,65,147,149};
int errorCritListTest[] = {3,65,129,130,131,134,147,149};

void errorManager(int type)  {
   lastError = GetLastError();
   string desc = "["+ErrorDescription(lastError)+"]";
   string message = "";
   switch(type)   {
      case ERR_OPEN:       {
         message = "error opening order ";
         break;
      }
       case ERR_MODIFY:       {
         message = "error modifying order ";
         break;
      }
       case ERR_CLOSE:       {
         message = "error closing order ";
         break;
      }
   }   
   lastErrorMessage = message+desc+" "+lastErrorString;
   Print("errorManager: ",lastErrorMessage);
   return;
}

bool errorCheckCritical(int error)  {
   if (error==0) error = GetLastError();
   if (error==0) return(false);
   if (error>4000) return(true);   
   if (IsTesting())
      if (intInArray(error,errorCritListTest)) return(true);
   else if (intInArray(error,errorCritListReal)) return(true);      
   return(false);
}