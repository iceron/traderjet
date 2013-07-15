double mathAbs(double x) {
   return(MathAbs(x));
}

double mathArcCos(double x)   {
   return(MathArccos(x));
}

double mathArcSin(double x)   {
   return(MathArcsin(x));
}

double mathArcTan(double x)   {
   return(MathArctan(x));
}

double mathCeil(double x)   {
   return(MathCeil(x));
}

double mathCos(double x)   {
   return(MathCos(x));
}

double mathExp(double x)   {
   return(MathExp(x));
}

double mathFloor(double x)   {
   return(MathFloor(x));
}

double mathLog(double x)   {
   return(MathLog(x));
}

double mathMax(double x,double y)   {
   return(MathMax(x,y));
}

double mathMin(double x,double y)   {
   return(MathMin(x,y));
}

double mathMod(double x,double y)   {
   return(MathMod(x,y));
}

double mathPow(double base,double exp)   {
   return(MathPow(base,exp));
}

int mathRand() {
   return(MathRand());
}

double mathRound(double x)   {
   return(MathRound(x));
}

double mathSin(double x)   {
   return(MathSin(x));
}

double mathSqrt(double x)   {
   return(MathSqrt(x));
}

void mathSRand(double x)   {
   MathSrand(x);
}

double mathTan(double x)   {
   return(MathTan(x));
}



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

int mathRandS(int seed = 0)
{
   if (seed==0) seed = TimeCurrent();
   MathSrand(seed);
   return(MathRand());
}



