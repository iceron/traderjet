int dash2.x.spacing = 50;
int dash2.y.spacing = 50;
#include <cfw\core\expert\core.mqh>
#include <cfw\components\objectsave\functions.mqh>

void table.create(string name,string& items[],string text,int x,int y,int corner=0,int angle=0,int fontsize=10,string font="Arial",color clr=Gray,int window=0)
{
   string column_headers;
   int size = ArraySize(items),next.x = x;
   label.create(name,text,angle,corner,x,y,fontsize,font,clr,window);   
   for (int i=0;i<size;i++)   {
      column_headers = items[i];  
      label.set(items[i],OBJPROP_XDISTANCE,next.x);
      label.set(items[i],OBJPROP_YDISTANCE,dash2.y.spacing+y);
      next.x += dash2.x.spacing;
   }   
   object.save.string(name+"headers",column_headers);
   object.save.int(name+"rows",1);
}

void table.row.add(string name,string& items[])
{
   int rows,size = ArraySize(items);
   object.load.int(name+"rows",rows);
   int next.y = label.get(name,OBJPROP_YDISTANCE) + dash2.y.spacing * (rows+1);
   int next.x = label.get(name,OBJPROP_XDISTANCE);
   
   for (int i=0;i<size;i++)   {
      label.set(items[i],OBJPROP_XDISTANCE,next.x);
      label.set(items[i],OBJPROP_YDISTANCE,next.y);
      next.x += dash2.x.spacing;
   }    
   object.save.int(name+"rows",rows+1); 
}

void str.labels(string str,double angle=0,int corner=0,int x=0,int y=0,int fontsize=10,string font="Arial",color clr=Gray,int window=0,string delim=",")
{
   string arr[100];
   str.str.array(str,arr);
   for (int i=0;i<100;i++)
   {
      string name = arr[i];
      if (name=="") continue;
      label.create(name,name,angle,corner,x,y,fontsize,font,clr,window);
   }
}


