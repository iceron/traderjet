void magicSet(int digits = 3)  {
   int val;
   if (serverMagic>=0) return;
   while(true)   {
      int windowhandle = WindowHandle(tickSymbol,timeframe);
      if (windowhandle==0) {
         Sleep(serverSleepError);
         continue;
      }      
      int rand = mathRand(TimeCurrent()+windowhandle);
      val = MathPow(10,digits)*(rand/32767.0); 
      if (!magicCollisionCheck(val)) {
         GlobalVariableSet(DoubleToStr(val,0),val);  
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
         Print("automagic: calculated magic number already in use, getting new value.."," calculated: ",value," existing: ",existing);
         return(true);
      }   
   }   
   Print("automagic: no magic number collission"," magic: ",value);
   return(false);
}


