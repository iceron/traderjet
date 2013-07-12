bool trading.hour(string s, string e)  {
   bool res;
   datetime current  = TimeCurrent();  
   datetime start    = StrToTime(s);
   datetime stop     = StrToTime(e);
   if (start<stop)  {
      if (current>start && current<stop) res = true;
   }
   else if (start>stop)  {
      if (!(current>stop && current<start)) res = true;
   }
   else if (start==stop) res = true;
   return (res);
}