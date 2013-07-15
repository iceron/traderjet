string symbolRaw(string symbol) {
   return(stringExtractNoLower(symbol));
}
string symbolPrefix(string symbol,string raw) {
   int pos = stringFind(symbol,raw);
   if (pos==0) return("");
   return(stringSub(symbol,0,pos-1));
}
string symbolSuffix(string symbol,string raw) {
   int pos = stringFind(symbol,raw);
   int len = stringLen(raw);
   int slen = stringLen(symbol);
   if (pos+len==slen) return("");
   return(stringSub(symbol,0,pos+len+1));
}