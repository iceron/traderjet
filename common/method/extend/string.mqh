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

string stringLeft(string str,int len)   {
   if (len==0) return("");
   return(stringSub(str,0,len));  
}

string stringRight(string str,int start)  {
   int size = stringLen(str);
   if (size>start) return("");
   return(stringSub(str,start,0));  
}

string stringReplace(string str,string match,string rep)   {
   int i = stringLen(str)-1;
   while (i>=0)   {
      int len = stringLen(match);
      string ch = "";
      ch = stringSub(str,i,len);     
      if (ch==match) {
         string right = stringRight(str,i+len);
         string left = stringLeft(str,i);
         str = StringConcatenate(left,rep,right);   
      }      
      i--;
   }
   return(str);
}

string stringInsert(string str,string ins,int pos)   {
   int i = stringLen(str)-1;
   string right = stringRight(str,pos);
   string left = stringLeft(str,pos);
   str = StringConcatenate(left,ins,right);
   return(str);
}

int stringExtractInt(string str)   {
   int i,len = stringLen(str)-1;
   string s = "";
   while (i<=len)   {
      string ch = "";
      ch = stringSub(str,i,1);      
      if (charIsNumeric(ch)) StringConcatenate(s,ch);          
      i++;
   }
   return(stringToInteger(s));
}

string stringConvert(string str,int mode)   {
   int upper,lower,count,i=stringLen(str)-1;
   if (mode==MODE_LOWER)   {
      upper = 90;
      lower = 65; 
      count = +32;     
   }  
   else if (mode==MODE_UPPER) {
      upper = 122;
      lower = 97; 
      count = -32;       
   }     
   while (i>=0)   {
      int code = stringGetChar(str,i);
      if (code>=lower && code<=upper)
         str = stringSetChar(str,i,code+count);    
      i--;
   }
   return(str);
}

string stringToLower(string str)  {
   return(stringConvert(str,MODE_LOWER));
}

string stringToUpper(string str)  {
   return(stringConvert(str,MODE_UPPER));
}

string stringExtractUpper(string str)   {
   int i,len = stringLen(str);
   string s = "";
   while (i<len)   {
      string ch = "";
      ch = stringSub(str,i,1);     
      if (charIsUpper(ch)) StringConcatenate(s,ch);    
      i++;
   }
   return(s);
}

string stringExtractNoUpper(string str)   {
   int i,len = stringLen(str);
   string s = "";
   while (i<len)   {
      string ch = "";
      ch = stringSub(str,i,1);    
      if (!charIsUpper(ch)) StringConcatenate(s,ch);    
      i++;
   }
   return(s);
}

string stringExtractLower(string str)   {
   int i,len = stringLen(str);
   string s = "";
   while (i<len)   {
      string ch = "";
      ch = stringSub(str,i,1);   
      if (charIsLower(ch)) s = StringConcatenate(s,ch);    
      i++;
   }
   return(s);
}

string stringExtractNoLower(string str)   {
   int i,len = stringLen(str);
   string s = "";
   while (i<len)   {
      string ch = "";
      ch = stringSub(str,i,1);  
      if (!charIsLower(ch)) s = StringConcatenate(s,ch);     
      i++;
   }
   return(s);
}

bool stringIsEmpty(string str)   {
   if (stringLen(str)==0) return(true);
   return(false);
}

bool charIsNumeric(string ch)   {
   if (charIsBounded(ch,48,57)) return(true);
   return(false);
}

bool charIsAlpha(string ch)   {
   if (charIsUpper(ch)) return(true);
   if (charIsLower(ch)) return(true);
   return(false);
}

bool charIsUpper(string ch)   {
   if (charIsBounded(ch,65,90)) return(true);
   return(false);
}

bool charIsLower(string ch)   {
   if (charIsBounded(ch,97,122)) return(true);
   return(false);
}

bool charIsBounded(string ch,int lower,int upper)   {
   int val = stringGetChar(ch);
   if (val>=lower && val<=upper) return(true);
   return(false);
}

bool charIsWhiteSpace(string str)   {
   if (stringGetChar(str,0)==32) return(true);
   return(false);
}