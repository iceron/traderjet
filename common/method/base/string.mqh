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

/*
string stringConcatenate(string v1="",string v2="",string v3="",string v4="",string v5="",string v6="",string v7="",string v8="",string v9="",string v10="",
           string v11="",string v12="",string v13="",string v14="",string v15="",string v16="",string v17="",string v18="",string v19="",string v20="")   {
   return(StringConcatenate(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17,v18,v19,v20));
}
*/

string stringTrimLeft(string s) {
   string str = "";
   str = StringTrimLeft(s);
   if (str=="") return("");
   return(str);
}

string stringTrimRight(string s) {
   string str = "";
   str = StringTrimRight(s);
   if (str=="") return("");
   return(str);
}

int stringFind(string str,string match,int start=0)  {
   return(StringFind(str,match,start));
}

string stringSub(string str,int start,int count=0)   {
   string s = "";
   s = StringSubstr(str,start,count);
   if (s=="") return("");
   return(s);
}

int stringLen(string str) {
   return(StringLen(str));
}

int stringGetChar(string str,int pos=0) {  
   return(StringGetChar(str,pos));  
}
string stringSetChar(string str,int pos,int code) {  
   return(StringSetChar(str,pos,code));  
}

