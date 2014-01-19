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

double stringToDouble(string val)  {
   return(StrToDouble(val));
}

int stringToInteger(string val)  {
   return(StrToInteger(val));
}

string charToString(int code)   {
   return(CharToStr(code));
}

string doubleToStr(double v,int p=0)   {
   return(DoubleToStr(v,p));
}

datetime strToTime(string str) {
   return(StrToTime(str));
}

string timeToString(datetime time,int mode=3)   {
   return(TimeToStr(time,mode));
}

double normalizeDouble(double value,int digits) {
   return(NormalizeDouble(value,digits));
}



