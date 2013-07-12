//SIGNAL INIT
signalInit(5,5);

//SERVER INIT
serverMagic           = Magic;   
serverSleepSuccess    = TradeSleepSuccess;
serverSleepError      = TradeSleepError;   
serverRetryMax        = TradeRetryMax;
serverSlippageEntry   = SlippageEntry;
serverSlippageExit    = SlippageExit;   
serverArrowColorLong  = TradeArrowColorLong;
serverArrowColorShort = TradeArrowColorShort;    
symbolSet();

//ORDER INIT
orderSelectSet(serverMagic);