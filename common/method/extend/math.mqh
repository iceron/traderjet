bool pricesIsEqual(double value1,double value2)   {
   if (mathAbs(value1-value2)>tickSize) return(false);
   else return(true);
}

string priceNormalize(double value,int precision=-1) {
   if (precision==-1) precision = tickDigits;
   return(doubleToString(value,precision));
}

double normalizeDouble(double value,int mode=DOUBLE_PRICE) {
   string dblstr;
   int precision;
   if (mode==DOUBLE_PRICE)   {
      dblstr = doubleToString(value,tickDigits);
      return(stringToDouble(dblstr));
   }
   else if (mode==DOUBLE_VOLUME)   {
      if (value>tickMinLot) precision = serverPrecision(tickLotStep);
      else precision = serverPrecision(tickMinLot);
      dblstr = doubleToString(value,precision);
      return(stringToDouble(dblstr));
   }
   return(0);
}

int mathRandS(int seed = 0)
{
   if (seed==0) seed = timeCurrent();
   mathSRand(seed);
   return(mathRand());
}



