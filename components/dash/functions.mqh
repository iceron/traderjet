//#define DASH_HEADER "---------------------"
#define DASH_HEADER "----- click and drag -----"

void dashCreate()  {
   dashDelete();
   if (IsTesting() && !IsVisualMode()) return;
   labelCreateUpdate(dashName,DASH_HEADER,0,dashCorner,dashX,dashY,dashFontSize,dashFont,dashTermColor);
   dashXDef = dashX;
   dashYDef = dashY;
   dashActive = true;
   dashReset();
}

void dashAdd(string name,string text1,string text2="",int offset=0) {
   if (!dashActive) return;
   if (offset==0) offset = dashXOffset;
   labelCreateUpdate(dashName+name+1,text1,0,dashCorner,dashXNext,dashYNext,dashFontSize,dashFont,dashTermColor);
   labelCreateUpdate(dashName+name+2,text2,0,dashCorner,dashXNext+offset,dashYNext,dashFontSize,dashFont,dashValueColor);
   dashXNext += dashXSpacing;
   dashYNext += dashYSpacing;
}

void dashReset() {
   dashXNext = dashX + dashXSpacing;
   dashYNext = dashY + dashYSpacing;
}

void dashDelete()   {
   int i,total = ObjectsTotal();
   for (i=total-1;i>=0;i--)   {
      string name = objectName(i);
      if (objectType(name)!=OBJ_LABEL) continue;
      if (stringFind(name,dashName)>=0)
         if (objectDelete(name)) name="";
   }      
}

void dashUpdate()   {
   if (dashActive && !objectExists(dashName)) {
      dashY = dashYDef;
      dashX = dashXDef;
      //Print(dashX," ",dashY);
      dashCreate();
   }   
   dashX = labelGet(dashName,OBJPROP_XDISTANCE);
   dashY = labelGet(dashName,OBJPROP_YDISTANCE);
   dashReset();
}