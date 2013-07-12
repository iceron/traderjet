double accountFreeMarginCheck(int cmd,double vol,string s="")   {
   if (s=="") s = tickSymbol;
   return(AccountFreeMarginCheck(s,cmd,vol));
}