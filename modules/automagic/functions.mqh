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


