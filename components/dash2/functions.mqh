int dash2XSpacing = 50;
int dash2YSpacing = 50;

void dash2TableCreate(string name,string& items[],string text,int x,int y,int corner=0,int angle=0,int fontsize=10,string font="Arial",color clr=Gray,int window=0)
{
   string columnHeaders;
   int size = ArraySize(items),nextX = x;
   labelCreate(name,text,angle,corner,x,y,fontsize,font,clr,window);   
   for (int i=0;i<size;i++)   {
      columnHeaders = items[i];  
      labelSet(items[i],OBJPROP_XDISTANCE,nextX);
      labelSet(items[i],OBJPROP_YDISTANCE,dash2YSpacing+y);
      nextX += dash2XSpacing;
   }   
   objectSaveString(name+"headers",columnHeaders);
   objectSaveInt(name+"rows",1);
}

void dash2TableRowAdd(string name,string& items[])
{
   int rows,size = ArraySize(items);
   objectLoadInt(name+"rows",rows);
   int nextY = labelGet(name,OBJPROP_YDISTANCE) + dash2YSpacing * (rows+1);
   int nextX = labelGet(name,OBJPROP_XDISTANCE);
   
   for (int i=0;i<size;i++)   {
      labelSet(items[i],OBJPROP_XDISTANCE,nextX);
      labelSet(items[i],OBJPROP_YDISTANCE,nextY);
      nextX += dash2XSpacing;
   }    
   objectSaveInt(name+"rows",rows+1); 
}

void dash2HeaderLabels(string str,double angle=0,int corner=0,int x=0,int y=0,int fontsize=10,string font="Arial",color clr=Gray,int window=0,string delim=",")
{
   string arr[100];
   stringToArray(str,arr);
   for (int i=0;i<100;i++)
   {
      string name = arr[i];
      if (name=="") continue;
      labelCreate(name,name,angle,corner,x,y,fontsize,font,clr,window);
   }
}


