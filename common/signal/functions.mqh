bool signalNewBar;
string signalOut,signalDone;
string signalOpen,signalClose;

#define SIGNAL_VOID     "VOID"
#define SIGNAL_LONG     "LONG"
#define SIGNAL_SHORT    "SHORT"
#define SIGNAL_DONE     "DONE"
#define SIGNAL_NOT_DONE "..."
#define SIGNAL_OPEN     "OPEN"
#define SIGNAL_CLOSE    "CLOSE"

int signalFilter(int& arr[]){
   int a,b,i,s;
   if (arr[ArrayMinimum(arr)]==CMD_VOID) return(CMD_VOID);
   if (arr[ArrayMaximum(arr)]==CMD_ALL) return(CMD_ALL);  
   int size = arraySizeInt(arr);
   while (i<size-2)   {
      a = arr[i];
      b = arr[i+1];      
      if (a==CMD_NEUTRAL)  {
         i++;
         continue;  
      }  else s = a;
      while(b==CMD_NEUTRAL && i<size-1){
         i++;
         b = arr[i];
      }
      if (a&b!=a|b && b!=CMD_NEUTRAL){
         s = CMD_VOID;
         break;
      } 
      i++;      
   }
   return(s);
}

string signalText(int signal,bool reverse=false){
   switch(signal) {
      case CMD_VOID:{
         if (reverse) return("ALL");
         return("VOID");
      }
      case CMD_NEUTRAL:{
         return("NEUTRAL");
      }
      case CMD_LONG:{
         if (reverse) return("SHORT");
         return("LONG");
      }
      case CMD_SHORT:{
         if (reverse) return("LONG");
         return("SHORT");
      }
      case CMD_ALL:{
         if (reverse) return("VOID");
         return("ALL");
      }
   }
   return(NULL);  
}

void signalManage(int& open,int& close,int timeframe=0)  {
   signalManageReset();
   static int last;
   bool newbar = barIsNew(timeframe);
   signalNewBar = newbar;
   string out = SIGNAL_OPEN;
   if (SignalModeReverse)   {
      if (open==CMD_LONG) open = CMD_SHORT;
      else if (open==CMD_SHORT) open = CMD_LONG;   
   }
   if (!serverEntryEnabled)
      open = CMD_VOID;  
   if (!SignalModeEveryTick && !newbar)
      open = CMD_VOID;     
   if (!serverExitEnabled)
      close = CMD_NEUTRAL;    
   //dashAdd("entry_filters","entry filters",signalText(open)); 
   //dashAdd("exit_filters","exit filters",signalText(close,true));   
   signalOpen = signalText(open);
   signalClose = signalText(close,true);
   if (open==signalReverse(close) || close==CMD_ALL) {      
      open = CMD_VOID;
      out = SIGNAL_CLOSE;
   }   
   else if (open==CMD_VOID) out = SIGNAL_VOID;
   //dashAdd("signal.overall","overall signal status",out); 
   signalOut = out;
   if (SignalModeTradeOncePerBar && open>CMD_VOID) {
      if (newbar) last = CMD_VOID;
      if (last!=open)   {
         last = open;
         //dashAdd("signal.once","signal for bar","..."); 
         //dash.add("onceperbar ","onceperbar",open+" ",+last);
         signalDone = SIGNAL_NOT_DONE;
      }   
      else  {
         last = open;  
         open = CMD_VOID;       
         //dashAdd("signal.once","signal for bar","DONE"); 
         signalDone = SIGNAL_DONE;         
      }        
   }      
}

void signalManageReset()   {
   signalNewBar = false;
   signalOut = "";
   signalDone = "";
   signalOpen = "";
   signalClose = "";
}



void signalInit(int open=0,int close=0)   {
   arrayResizeInt(signalEntryArray,open);
   arrayResizeInt(signalExitArray,close); 
   ArrayInitialize(signalEntryArray,0);
   ArrayInitialize(signalExitArray,0); 
}

bool signalIsEnabled(int signal) {
   if ((signal==CMD_LONG && TradeLongEnabled) || (signal==CMD_SHORT && TradeShortEnabled)) return(true);
   return(false);
}
void filterInit(int& num) {
   num = 0;       
}

void filterAdd(int filter,int& arr[],int& num) {
   arr[num] = filter; 
   num++;
}

int signalReverse(int signal) {
   switch(signal) {
      case CMD_VOID:{
         return(CMD_ALL);
      }
      case CMD_NEUTRAL:{
         return(signal);
      }
      case CMD_BUY:{
         return(CMD_SELL);
      }
      case CMD_SELL:{
         return(CMD_BUY);
      }
      case CMD_BUYLIMIT:{
         return(CMD_SELLLIMIT);
      }
      case CMD_SELLLIMIT:{
         return(CMD_BUYLIMIT);
      }
      case CMD_BUYSTOP:{
         return(CMD_SELLSTOP);
      }
      case CMD_SELLSTOP:{
         return(CMD_BUYSTOP);
      }
      case CMD_LONG:{
         return(CMD_SHORT);
      }
      case CMD_SHORT:{
         return(CMD_LONG);
      }
      case CMD_LIMIT:{
         return(CMD_STOP);
      }
      case CMD_STOP:{
         return(CMD_LIMIT);
      }
      case CMD_MARKET:{
         return(CMD_PENDING);
      }
      case CMD_PENDING:{
         return(CMD_MARKET);
      }
      case CMD_ALL:{
         return(CMD_VOID);
      }
   }
}

