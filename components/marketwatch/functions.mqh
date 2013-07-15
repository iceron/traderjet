#define symfile   "symbols.raw"
#define symname   12
#define symdesc   75
#define symsize   1936
#define symnext   1849

string marketwatchSymbol[];
string marketwatchDesc[];

void marketwatchGetSymbols() {
   int handle = FileOpenHistory(symfile,FILE_BIN|FILE_READ);
   if (handle==-1)   {
      Print("FILE: ",symfile," - error opening file ",GetLastError()); 
      return;
   }
   int symbolcount = FileSize(handle)/symsize;
   ArrayResize(marketwatchSymbol,symbolcount);
   ArrayResize(marketwatchDesc,symbolcount);
   for (int i=0;i<symbolcount;i++)  {     
      string s = FileReadString(handle,symname);
      string desc = FileReadString(handle,symdesc);
      FileSeek(handle,symnext,SEEK_CUR);
      marketwatchSymbol[i] = s;      
      marketwatchDesc[i] = desc;        
   }   
   //printresult();
   FileClose(handle);   
}

/*
void printresult()
{
   int size = ArraySize(marketwatchSymbol);
   for (int i=0;i<size;i++)   {
      Print(i," ",marketwatchSymbol[i]," ",marketwatchDesc[i]);
   }
}
*/