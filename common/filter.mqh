int filterSignal(int& array[]){
   int a,b,i,s;
   if (array[ArrayMinimum(array)]==CMD_VOID) return(CMD_VOID);
   if (array[ArrayMaximum(array)]==CMD_ALL) return(CMD_ALL);  
   while (i<ArraySize(array))   {
      a = array[i];
      b = array[i+1];      
      if (a==CMD_NEUTRAL)  {
         i++;
         continue;  
      }  else s = a;
      while(b==CMD_NEUTRAL && i<ArraySize(array)){
         i++;
         b = array[i+1];
      }
      if (a&b!=a|b && b!=CMD_NEUTRAL){
         s = CMD_VOID;
         break;
      } 
      i++;      
   }
   return(s);
}

string signalText(int signal,bool reverse=false){
   switch(signal) {
      case CMD_VOID:{
         if (reverse) return("ALL");
         return("VOID");
      }
      case CMD_NEUTRAL:{
         return("NEUTRAL");
      }
      case CMD_LONG:{
         if (reverse) return("SHORT");
         return("LONG");
      }
      case CMD_SHORT:{
         if (reverse) return("LONG");
         return("SHORT");
      }
      case CMD_ALL:{
         if (reverse) return("VOID");
         return("ALL");
      }
   }
   return(NULL);  
}