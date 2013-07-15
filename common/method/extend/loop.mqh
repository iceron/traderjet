void orderLoop(int magic=EMPTY_VALUE,int type=CMD_ALL) {   
   int total = ordersTotal();
   if (magic==EMPTY_VALUE) magic = serverMagic;
   for (int i=0;i<total;i++)   {
      if (!cOrderSelect(i,SELECT_BY_POS,MODE_TRADES)) continue;      
      loopOrderTasks();
   }
}

void orderLoopHistory(int total,int magic=EMPTY_VALUE,int type=CMD_ALL) {   
   if (isTesting()) total = ordersHistoryTotal();
   if (magic==EMPTY_VALUE) magic = serverMagic;
   for (int i=0;i<total;i++)   {
      if (!cOrderSelect(i,SELECT_BY_POS,MODE_HISTORY)) continue;      
      loopOrderHistoryTasks();
   }
}

