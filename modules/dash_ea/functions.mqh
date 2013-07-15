#include <traderjet\components\dash\var.mqh>
#include <traderjet\components\dash\functions.mqh>

void dashEACreate()
{
   dashCreate();
}

void dashEAAdd(string n,string h,string v)
{
    dashAdd(n,h,v);
}

void dashEAMainAdd()
{
   dashEAAdd("entry_filters","entry filters",signalText(signalOpen)); 
   dashEAAdd("exit_filters","exit filters",signalText(signalClose,true));   
   dashEAAdd("signal.overall","overall signal status",signalOut); 
   dashEAAdd("signal.once","signal for bar",signalDone); 
}

void dashEAUpdate()
{
   dashUpdate();
}

void dashEADelete()
{
   dashDelete();
}