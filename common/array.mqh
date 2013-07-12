void stringToDoubleArray(string str, double& arr[],string delim=",",double init=0.0) { 
   int str.len = StringLen(str);
   if (str.len==0) return;
   int i,j;
   
   ArrayInitialize(arr,init);

   while (i<str.len)   {
      int delim.next = StringFind(str,delim,i);    
      if (delim.next==-1) break;  
      arr[j] = StrToDouble(StringSubstr(str,i,delim.next-i));
      j++;      
      i = delim.next+1;
   } 
   return;
}

void stringToIntArray(string str, int& arr[],string delim=",",int init=0)   { 
   int str.len = StringLen(str);
   if (str.len==0) return;
   int i,j;
      
   ArrayInitialize(arr,init);

   while (i<str.len)   {
      int delim.next = StringFind(str,delim,i);   
      if (delim.next==-1) break;   
      arr[j] = StrToDouble(StringSubstr(str,i,delim.next-i));
      j++;      
      i = delim.next+1;
   } 
   return;
}

void stringToArray(string str, string& arr[],string delim=",",string init="")  { 
   int str.len = StringLen(str);
   if (str.len==0) return;
   int i,j;
   
   for (int z=0;z<str.len;z++)
      arr[z] = init;

   while (i<str.len)   {
      int delim.next = StringFind(str,delim,i);
      if (delim.next==-1) break;      
      arr[j] = StringSubstr(str,i,delim.next-i);
      j++;      
      i = delim.next+1;
   } 
   return;
}

void stringToColorArray(string str, color& arr[],string delim=",",int init=CLR_NONE)   { 
   int str.len = StringLen(str);
   if (str.len==0) return;
   int i,j;
      
   ArrayInitialize(arr,init);

   while (i<str.len)   {
      int delim.next = StringFind(str,delim,i);   
      if (delim.next==-1) break;   
      arr[j] = StrToDouble(StringSubstr(str,i,delim.next-i));
      j++;      
      i = delim.next+1;
   } 
   return;
}




