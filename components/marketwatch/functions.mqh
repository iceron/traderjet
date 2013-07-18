#define symfile   "symbols.raw"
#define symname   12
#define symdesc   75
#define symsize   1936
#define symnext   1849

string marketwatchSymbol[];
string marketwatchDesc[];

void marketwatchGetSymbols() {
   int handle = fileOpenHistory(symfile,FILE_BIN|FILE_READ);
   if (handle==-1)   {
      print("FILE: ",symfile," - error opening file ",GetLastError()); 
      return;
   }
   int symbolcount = fileSize(handle)/symsize;
   arrayResizeString(marketwatchSymbol,symbolcount);
   arrayResizeString(marketwatchDesc,symbolcount);
   for (int i=0;i<symbolcount;i++)  {     
      string s = fileReadString(handle,symname);
      string desc = fileReadString(handle,symdesc);
      fileSeek(handle,symnext,SEEK_CUR);
      marketwatchSymbol[i] = s;      
      marketwatchDesc[i] = desc;        
   }   
   //printresult();
   fileClose(handle);   
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