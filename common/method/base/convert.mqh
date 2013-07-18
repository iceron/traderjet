double stringToDouble(string val)  {
   return(StrToDouble(val));
}

int stringToInteger(string val)  {
   return(StrToInteger(val));
}

string charToString(int code)   {
   return(CharToStr(code));
}

string doubleToString(double v,int p=0)   {
   return(DoubleToStr(v,p));
}

datetime stringToTime(string str) {
   return(StrToTime(str));
}

string timeToString(datetime time,int mode=3)   {
   return(TimeToStr(time,mode));
}

double normalizeDouble(double value,int digits) {
   return(NormalizeDouble(value,digits));
}



