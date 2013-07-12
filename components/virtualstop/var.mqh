#define STEALTH_DISABLED      0
#define STEALTH_AUTOMATIC     1
#define STEALTH_PURE          2

#define MODE_ENTRY            0
#define MODE_STOPLOSS         1
#define MODE_TAKEPROFIT       2

int vstopStopLossMode = STEALTH_AUTOMATIC;
int vstopTakeProfitMode = STEALTH_AUTOMATIC;
color vstopLongStopLossColor = Red;
color vstopLongTakeProfitColor = Green;
color vstopShortStopLossColor = Red;
color vstopShortTakeProfitColor = Green;

string vstopSep = ".";
string vstopStopLossName = ".sl.";
string vstopTakeProfitName = ".tp.";
string vstopName = "stealth";
string vstopStandardName = "stealth";