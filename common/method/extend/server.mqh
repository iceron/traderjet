bool serverIsECN()  {
   return(tickStopLevel==0);
}

bool serverIsFractional()  {
   return(tickDigits==3 || tickDigits==5);
}

void serverFractional()  {
   tickFractPoints = 10*tickSize;
   tickFractPips   = 10;
}

void serverNoFractional()  {
   tickFractPoints = tickSize;
   tickFractPips   = 1;
}

int serverPrecision(double minLot)  {
   return(mathMax(-mathLog(minLot),0));
}