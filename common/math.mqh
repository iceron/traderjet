bool pricesIsEqual(double value1,double value2)   {
   if (MathAbs(value1-value2)>tickSize) return(false);
   else return(true);
}

string priceNormalize(double value,int precision=-1) {
   if (precision==-1) precision = tickDigits;
   return(DoubleToStr(value,precision));
}

double normalizeDouble(double value,int mode=DOUBLE_PRICE) {
   string dblstr;
   int precision;
   if (mode==DOUBLE_PRICE)   {
      dblstr = DoubleToStr(value,tickDigits);
      return(StrToDouble(dblstr));
   }
   else if (mode==DOUBLE_VOLUME)   {
      if (value>tickMinLot) precision = serverPrecision(tickLotStep);
      else precision = serverPrecision(tickMinLot);
      dblstr = DoubleToStr(value,precision);
      return(StrToDouble(dblstr));
   }
   return(0);
}

int mathRand(int seed = 0)
{
   if (seed==0) seed = TimeCurrent();
   MathSrand(seed);
   return(MathRand());
}



