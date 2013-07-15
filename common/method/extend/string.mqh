string stringLeft(string str,int len)   {
   if (len==0) return("");
   return(StringSubstr(str,0,len));  
}

string stringRight(string str,int start)  {
   return(StringSubstr(str,start,0));  
}

string stringReplace(string str,string match,string rep)   {
   int i = StringLen(str)-1;
   while (i>=0)   {
      int len = StringLen(match);
      string ch = StringSubstr(str,i,len);     
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
   int i = StringLen(str)-1;
   string right = stringRight(str,pos);
   string left = stringLeft(str,pos);
   str = StringConcatenate(left,ins,right);
   return(str);
}

int stringExtractInt(string str)   {
   int i,len = stringLen(str)-1;
   string s;
   while (i<=len)   {
      string ch = stringSub(str,i,1);     
      if (charIsNumeric(ch)) StringConcatenate(s,ch);    
      i++;
   }
   return(stringToInteger(s));
}

string stringConvert(string str,int mode)   {
   int upper,lower,count,i=StringLen(str)-1;
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
   int i,len = stringLen(str)-1;
   string s;
   while (i<=len)   {
      string ch = stringSub(str,i,1);     
      if (charIsUpper(ch)) StringConcatenate(s,ch);    
      i++;
   }
   return(s);
}

string stringExtractNoUpper(string str)   {
   int i,len = stringLen(str)-1;
   string s;
   while (i<=len)   {
      string ch = stringSub(str,i,1);     
      if (!charIsUpper(ch)) StringConcatenate(s,ch);    
      i++;
   }
   return(s);
}

string stringExtractLower(string str)   {
   int i,len = stringLen(str)-1;
   string s;
   while (i<=len)   {
      string ch = stringSub(str,i,1);     
      if (charIsLower(ch)) s = StringConcatenate(s,ch);    
      i++;
   }
   return(s);
}

string stringExtractNoLower(string str)   {
   int i,len = stringLen(str)-1;
   string s;
   while (i<=len)   {
      string ch = stringSub(str,i,1);     
      if (!charIsLower(ch)) s = StringConcatenate(s,ch);    
      i++;
   }
   return(s);
}

// char

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

bool stringIsEmpty(string str)   {
   if (stringLen(str)==0) return(true);
   return(false);
}