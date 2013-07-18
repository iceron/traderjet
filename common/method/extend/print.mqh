/* not enough stack for long strings
string printString(string desc,string message) {
   return(stringConcatenate(desc,": ",message));  
}

void printOut(string desc,string message) {
   Print(printString(desc,message));
}
*/