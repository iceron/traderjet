double mm(double volume,int mode,double sl,double term1=0,double term2=0,int accountmode=0) {
   if (mode==0) return(volume);
   double capital;
   switch(accountmode)  {
      case 0: {
         capital = AccountBalance();
         break;
      }   
      case 1: {
         capital = AccountEquity();
         break;
      } 
      case 2: {
         capital = AccountFreeMargin();
         break;
      } 
      default: capital = AccountBalance();
   }
   switch(mode)  {
      case 1: {
         volume = mm.risk.percent(term1,sl,capital);
         break;
      } 
      case 2: {
         volume = mm.fixed.ratio(term1,term2,capital);
         break;
      } 
      case 3: {
         volume = mm.fixed.money(term1,sl);
         break;
      } 
      case 4: {
         volume = mm.fixed.pip(term1);
         break;
      } 
   }
   return(volume);
}

double mm.risk.percent(double percent,double sl,double capital)   {
   double risk_capital = capital*percent;
   return(normalize.double((risk_capital/(sl*tick.fractpips))/tick.value,DOUBLE_VOLUME));
}

double mm.fixed.ratio(double risk, double growth, double capital) {
   return(normalize.double((risk/growth)*capital,DOUBLE_VOLUME));
}

double mm.fixed.money(double risk_capital, double sl) {
   return(normalize.double((risk_capital/(sl*tick.fractpips))/tick.value,DOUBLE_VOLUME));
}

double mm.fixed.pip(double risk_capital) {
   return(normalize.double((risk_capital/tick.fractpips)/tick.value,DOUBLE_VOLUME));
}

