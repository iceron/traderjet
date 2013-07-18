bool pricesIsEqual(double value1,double value2)   {
   if (mathAbs(value1-value2)>tickSize) return(false);
   else return(true);
}

int mathRandS(int seed = 0)   {
   if (seed==0) seed = timeCurrent();
   mathSRand(seed);
   return(mathRand());
}



