#define SIGNAL_VOID     "VOID"
#define SIGNAL_LONG     "LONG"
#define SIGNAL_SHORT    "SHORT"
#define SIGNAL_DONE     "DONE"
#define SIGNAL_NOT_DONE "..."
#define SIGNAL_OPEN     "OPEN"
#define SIGNAL_CLOSE    "CLOSE"

bool signalNewBar;
string signalOut,signalDone;
string signalOpen,signalClose;

int signalEntryArray[];
int signalExitArray[];
int filterExitNum;
int filterEntryNum;