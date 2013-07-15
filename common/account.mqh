double accountBalance() {
   return(AccountBalance());
}

double accountCredit() {
   return(AccountCredit());
}

string accountCompany() {
   return(AccountCompany());
}

string accountCurrency() {
   return(AccountCurrency());
}

double accountEquity() {
   return(accountEquity());
}

double accountFreeMargin() {
   return(AccountFreeMargin());
}

double accountFreeMarginCheck(int cmd,double volume,string symbol="") {
   if (symbol=="") symbol = tickSymbol;
   return(AccountFreeMarginCheck(symbol,cmd,volume));
}

double accountFreeMarginMode() {
   return(AccountFreeMarginMode());
}

double accountLeverage() {
   return(AccountLeverage());
}

double accountMargin() {
   return(AccountMargin());
}

string accountName() {
   return(AccountName());
}

double accountNumber() {
   return(AccountNumber());
}

double accountProfit() {
   return(AccountProfit());
}

string accountServer() {
   return(AccountServer());
}

double accountStopOutLevel() {
   return(AccountStopoutLevel());
}

double accountStopOutMode() {
   return(AccountStopoutMode());
}