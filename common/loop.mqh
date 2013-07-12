void orderLoop(int magic=EMPTY_VALUE,int type=CMD_ALL) {   
   int total = OrdersTotal();
   if (magic==EMPTY_VALUE) magic = serverMagic;
   for (int i=0;i<total;i++)   {
      if (!orderSelect(i,SELECT_BY_POS,MODE_TRADES)) continue;
      loopOrderTasks();
   }
}

void orderLoopHistory(int total,int magic=EMPTY_VALUE,int type=CMD_ALL) {   
   if (IsTesting()) total = OrdersHistoryTotal();
   if (magic==EMPTY_VALUE) magic = serverMagic;
   for (int i=0;i<total;i++)   {
      if (!orderSelect(i,SELECT_BY_POS,MODE_HISTORY)) continue;
      loopHistoryTasks();
   }
}

