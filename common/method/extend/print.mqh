string printString(string desc,string message) {
   return(StringConcatenate(desc,": ",message));  
}

void printOut(string desc,string message) {
   Print(printString(desc,message));
}