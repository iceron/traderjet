void orderCheckEntry()  {
   if (orderJustIn()) onTrade();
}

bool orderJustIn()   {
   static datetime opentime;
   if (opentime==0) {
      opentime = orderOpenTime;
      if (orderOpenTime>tickTime-20) return(true);
   }   
   if (orderOpenTime>opentime)   {      
      opentime = orderOpenTime;
      return(true);
   }   
   return(false);
}

void orderCheckClose()  {
   if (orderJustOut()) onTradeClose();
}

bool orderJustOut()  {
   static datetime closetime;
   if (closetime==0) {
      closetime = orderCloseTime;
      return(false);
   }   
   if (orderCloseTime>closetime) {
      closetime = orderCloseTime;
      return(true);
   }   
   return(false);
}