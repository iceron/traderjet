bool tradingIsValid(string s, string e)  {
   bool res;
   datetime current  = timeCurrent();  
   datetime start    = stringToTime(s);
   datetime stop     = stringToTime(e);
   if (start<stop)  {
      if (current>start && current<stop) res = true;
   }
   else if (start>stop)  {
      if (!(current>stop && current<start)) res = true;
   }
   else if (start==stop) res = true;
   return (res);
}