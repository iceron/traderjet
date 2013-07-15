int arrayBSearch(double& arr[],double value,int count=WHOLE_ARRAY,int start=0,int mode=MODE_ASCEND) {
   return(ArrayBsearch(arr,value,count,start,mode));
}

int arrayCopyRates(double& arr[],string symbol="",int timeframe=0) {
   if (symbol=="") symbol = tickSymbol;
   return(ArrayCopyRates(arr,symbol,timeframe));
}

int arrayCopySeries(double& arr[],int index,string symbol="",int timeframe=0)   {
   if (symbol=="") symbol = tickSymbol;
   return(ArrayCopySeries(arr,index,symbol,timeframe));
}

int arrayInitialize(double& arr[],double value)   {
   return(ArrayInitialize(arr,value));
}

int arrayMax(double& arr[],int count=WHOLE_ARRAY,int start=0)   {
   return(ArrayMaximum(arr,count,start));
}

int arrayMin(double& arr[],int count=WHOLE_ARRAY,int start=0)   {
   return(ArrayMinimum(arr,count,start));
}

bool arraySetAsSeries(double& arr[],bool set) {
   return(ArraySetAsSeries(arr,set));
}

int arraySort(double& arr[],int count=WHOLE_ARRAY,int start=0,int dir=MODE_ASCEND)   {
   return(ArraySort(arr,count,start,dir));
}


