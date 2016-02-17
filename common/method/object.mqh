/* Copyright (C) 2013 Enrico Lambino
 *
 *  This file is part of TraderJet Framework
 *
 *  TraderJet is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  TraderJet is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with TraderJet; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  @license GPL-3.0+ <http://spdx.org/licenses/GPL-3.0+>
 */

void objectsDelete(string pref)  {
   int total = ObjectsTotal();
   for (int i=total-1;i>=0;i--)  {
      string name = ObjectName(i);
      if (StringFind(name,pref)>=0)
         ObjectDelete(name);
   }
}

bool objectExistsDeleted(string objectName)  {
   if (objectExists(objectName))
      return(ObjectDelete(objectName));
   return(false);   
}

bool objectExists(string objectName) {
   if (ObjectFind(objectName)>=0) return(true);
   return(false);
}

bool objectHide(string objectName)   {
   if (objectExists(objectName))
      return(ObjectSet(objectName,OBJPROP_TIMEFRAMES,-1));
   return true;
}

bool objectHidden(string objectName) {
   if (objectExists(objectName))
   {
      int val = ObjectGet(objectName,OBJPROP_TIMEFRAMES);
      if (val==-1) return(true);
      else return false;
   }   
   return(true);
}

bool objectClone(string n,string o,bool create=true) {
   int type = ObjectType(o);
   bool created;
   if (create) created = ObjectCreate(n,type,0,0,0);
   if (!created) return(false);
   
   if (objectUseProp(type,OBJPROP_TIME1))   {
      datetime time1 = ObjectGet(o,OBJPROP_TIME1);
      ObjectSet(n,OBJPROP_TIME1,time1);
   }   
   
   if (objectUseProp(type,OBJPROP_TIME2))   {
      datetime time2 = ObjectGet(o,OBJPROP_TIME2);
      ObjectSet(n,OBJPROP_TIME2,time2);
   }
   
   if (objectUseProp(type,OBJPROP_TIME3))   {
      datetime time3 = ObjectGet(o,OBJPROP_TIME3);
      ObjectSet(n,OBJPROP_TIME3,time3);
   }
   
   if (objectUseProp(type,OBJPROP_PRICE1))   {
      double price1 = ObjectGet(o,OBJPROP_PRICE1);
      ObjectSet(n,OBJPROP_PRICE1,price1);
   }
   
   if (objectUseProp(type,OBJPROP_PRICE2))   {
      double price2 = ObjectGet(o,OBJPROP_PRICE2);
      ObjectSet(n,OBJPROP_PRICE2,price2);
   }
   if (objectUseProp(type,OBJPROP_PRICE3))   {
      double price3 = ObjectGet(o,OBJPROP_PRICE3);
      ObjectSet(n,OBJPROP_PRICE3,price3);
   }

   if (objectUseProp(type,OBJPROP_SCALE))   {
      double scale = ObjectGet(o,OBJPROP_SCALE);
      ObjectSet(n,OBJPROP_SCALE,scale);
   }   
   
   if (objectUseProp(type,OBJPROP_COLOR))   {
      color clr = ObjectGet(o,OBJPROP_COLOR);
      ObjectSet(n,OBJPROP_COLOR,clr);
   }   
   
   if (objectUseProp(type,OBJPROP_STYLE))   {
      int style = ObjectGet(o,OBJPROP_STYLE);
      ObjectSet(n,OBJPROP_STYLE,style);
   }   
   
   if (objectUseProp(type,OBJPROP_WIDTH))   {
      int width = ObjectGet(o,OBJPROP_WIDTH);
      ObjectSet(n,OBJPROP_WIDTH,width);
   } 
   
   if (objectUseProp(type,OBJPROP_BACK))   {
      bool back = ObjectGet(o,OBJPROP_BACK);
      ObjectSet(n,OBJPROP_BACK,back);
   } 
   
   if (objectUseProp(type,OBJPROP_RAY))   {
      bool ray = ObjectGet(o,OBJPROP_RAY);
      ObjectSet(n,OBJPROP_RAY,ray);
   } 
   
   if (objectUseProp(type,OBJPROP_ELLIPSE))   {
      bool ellipse = ObjectGet(o,OBJPROP_ELLIPSE);
      ObjectSet(n,OBJPROP_ELLIPSE,ellipse);
   } 
   
   if (objectUseProp(type,OBJPROP_ANGLE))   {
      double angle = ObjectGet(o,OBJPROP_ANGLE);
      ObjectSet(n,OBJPROP_ANGLE,angle);
   } 
   
   if (objectUseProp(type,OBJPROP_ARROWCODE))   {
      int arrowcode = ObjectGet(o,OBJPROP_ARROWCODE);
      ObjectSet(n,OBJPROP_ARROWCODE,arrowcode);
   } 
   
   if (objectUseProp(type,OBJPROP_TIMEFRAMES))   {
      int timeframes = ObjectGet(o,OBJPROP_TIMEFRAMES);
      ObjectSet(n,OBJPROP_TIMEFRAMES,timeframes);
   } 
   
   if (objectUseProp(type,OBJPROP_DEVIATION))   {
      double deviation = ObjectGet(o,OBJPROP_DEVIATION);
      ObjectSet(n,OBJPROP_DEVIATION,deviation);
   } 
   
   if (objectUseProp(type,OBJPROP_FONTSIZE))   {
      int fontize = ObjectGet(o,OBJPROP_FONTSIZE);
      ObjectSet(n,OBJPROP_FONTSIZE,fontize);
   } 
   
   if (objectUseProp(type,OBJPROP_CORNER))   {
      int corner = ObjectGet(o,OBJPROP_CORNER);
      ObjectSet(n,OBJPROP_CORNER,corner);
   } 
   
   if (objectUseProp(type,OBJPROP_XDISTANCE))   {
      int x = ObjectGet(o,OBJPROP_XDISTANCE);
      ObjectSet(n,OBJPROP_XDISTANCE,x);
   }   
   
   if (objectUseProp(type,OBJPROP_YDISTANCE))   {
      int y = ObjectGet(o,OBJPROP_YDISTANCE);
      ObjectSet(n,OBJPROP_YDISTANCE,y);
   }   
   
   if (objectUseProp(type,OBJPROP_FIBOLEVELS))   {
      int fibolevels = ObjectGet(o,OBJPROP_FIBOLEVELS);
      ObjectSet(n,OBJPROP_FIBOLEVELS,fibolevels);
   }   
   
   if (objectUseProp(type,OBJPROP_LEVELCOLOR))   {
      color levelclr = ObjectGet(o,OBJPROP_LEVELCOLOR);
      ObjectSet(n,OBJPROP_LEVELCOLOR,levelclr);
   } 
   
   if (objectUseProp(type,OBJPROP_LEVELSTYLE))   {
      int levelstyle = ObjectGet(o,OBJPROP_LEVELSTYLE);
      ObjectSet(n,OBJPROP_LEVELSTYLE,levelstyle);
   }   
   
   if (objectUseProp(type,OBJPROP_LEVELWIDTH))   {
      int levelwidth = ObjectGet(o,OBJPROP_LEVELWIDTH);
      ObjectSet(n,OBJPROP_LEVELWIDTH,levelwidth);
   }  
   
   if (type==OBJ_FIBO)   {
      for (int i=0;i<=31;i++) {
         double val = ObjectGet(o,OBJPROP_FIRSTLEVEL+i);
         ObjectSet(n,OBJPROP_FIRSTLEVEL+i,val);
      }
   }
   return(true);
}

bool objectUseProp(int type,int prop) {
   bool ret;   
   switch(prop)   {
      case OBJPROP_TIME1:  {
         switch(type)   {
            case OBJ_VLINE:
            case OBJ_TREND:
            case OBJ_TRENDBYANGLE:
            case OBJ_REGRESSION:
            case OBJ_CHANNEL:
            case OBJ_STDDEVCHANNEL:
            case OBJ_GANNLINE:
            case OBJ_GANNFAN:
            case OBJ_GANNGRID:
            case OBJ_FIBO:
            case OBJ_FIBOTIMES:
            case OBJ_FIBOFAN:
            case OBJ_FIBOARC:
            case OBJ_EXPANSION:
            case OBJ_FIBOCHANNEL:
            case OBJ_RECTANGLE:
            case OBJ_TRIANGLE:
            case OBJ_ELLIPSE:
            case OBJ_PITCHFORK:
            case OBJ_CYCLES:
            case OBJ_TEXT:
            case OBJ_ARROW:
            case OBJ_LABEL:   {
               ret = true;
               break;
            }
         }
         switch(type)   {
            case OBJ_VLINE:
            case OBJ_HLINE:
            case OBJ_TREND:
            case OBJ_TRENDBYANGLE:
            case OBJ_REGRESSION:
            case OBJ_CHANNEL:
            case OBJ_STDDEVCHANNEL:
            case OBJ_GANNLINE:
            case OBJ_GANNFAN:
            case OBJ_GANNGRID:
            case OBJ_FIBO:
            case OBJ_FIBOTIMES:
            case OBJ_FIBOFAN:
            case OBJ_FIBOARC:
            case OBJ_EXPANSION:
            case OBJ_FIBOCHANNEL:
            case OBJ_RECTANGLE:
            case OBJ_TRIANGLE:
            case OBJ_ELLIPSE:
            case OBJ_PITCHFORK:
            case OBJ_CYCLES:
            case OBJ_TEXT:
            case OBJ_ARROW:
            case OBJ_LABEL:   {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_TIME2:  {
         switch(type)   {
            case OBJ_TREND:
            case OBJ_REGRESSION:
            case OBJ_CHANNEL:
            case OBJ_STDDEVCHANNEL:
            case OBJ_GANNLINE:
            case OBJ_GANNFAN:
            case OBJ_GANNGRID:
            case OBJ_FIBO:
            case OBJ_FIBOTIMES:
            case OBJ_FIBOFAN:
            case OBJ_FIBOARC:
            case OBJ_EXPANSION:
            case OBJ_FIBOCHANNEL:
            case OBJ_RECTANGLE:
            case OBJ_TRIANGLE:
            case OBJ_ELLIPSE:
            case OBJ_PITCHFORK:
            case OBJ_CYCLES:  {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_TIME3:  {
         switch(type)   {
            case OBJ_CHANNEL:
            case OBJ_EXPANSION:
            case OBJ_FIBOCHANNEL:
            case OBJ_TRIANGLE:
            case OBJ_PITCHFORK:  {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_PRICE1: {
         switch(type)   {
            case OBJ_HLINE:
            case OBJ_TREND:
            case OBJ_TRENDBYANGLE:
            case OBJ_CHANNEL:
            case OBJ_GANNLINE:
            case OBJ_GANNFAN:
            case OBJ_GANNGRID:
            case OBJ_FIBO:
            case OBJ_FIBOTIMES:
            case OBJ_FIBOFAN:
            case OBJ_FIBOARC:
            case OBJ_EXPANSION:
            case OBJ_FIBOCHANNEL:
            case OBJ_RECTANGLE:
            case OBJ_TRIANGLE:
            case OBJ_ELLIPSE:
            case OBJ_PITCHFORK:
            case OBJ_CYCLES:
            case OBJ_TEXT:
            case OBJ_ARROW:
            case OBJ_LABEL:   {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_PRICE2: {
         switch(type)   {
            case OBJ_TREND:
            case OBJ_CHANNEL:
            case OBJ_FIBO:
            case OBJ_FIBOTIMES:
            case OBJ_FIBOFAN:
            case OBJ_FIBOARC:
            case OBJ_EXPANSION:
            case OBJ_FIBOCHANNEL:
            case OBJ_RECTANGLE:
            case OBJ_TRIANGLE:
            case OBJ_ELLIPSE:
            case OBJ_PITCHFORK:
            case OBJ_CYCLES:  {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_PRICE3: {
         switch(type)   {
            case OBJ_CHANNEL:
            case OBJ_EXPANSION:
            case OBJ_FIBOCHANNEL:
            case OBJ_TRIANGLE:
            case OBJ_PITCHFORK:  {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_RAY: {
         switch(type)   {
            case OBJ_CHANNEL:
            case OBJ_TREND:
            case OBJ_TRENDBYANGLE:
            case OBJ_REGRESSION:
            case OBJ_FIBOCHANNEL:            
            case OBJ_STDDEVCHANNEL:
            case OBJ_PITCHFORK:  {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_COLOR:
      case OBJPROP_STYLE:
      case OBJPROP_WIDTH:
      case OBJPROP_BACK:      
      case OBJPROP_TIMEFRAMES:   {
         ret = true;
         break;
      }
      case OBJPROP_ELLIPSE:   {
         if (type==OBJ_FIBOARC)  {
            ret = true;
            break;
         }
      }
      case OBJPROP_SCALE:  {
         switch(type)   {
            case OBJ_GANNFAN:
            case OBJ_GANNGRID:
            case OBJ_GANNLINE:
            case OBJ_FIBOARC:
            case OBJ_ELLIPSE: {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_ANGLE:  {
         switch(type)   {
            case OBJ_TRENDBYANGLE:
            case OBJ_TEXT:
            case OBJ_LABEL:   {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_ARROWCODE: {
         if (type==OBJ_ARROW) {
            ret = true;
            break;
         }
      }
      case OBJPROP_DEVIATION: {
         if (type==OBJ_STDDEVCHANNEL)  {
            ret = true;
            break;
         }
      }
      case OBJPROP_FONTSIZE:  {
         if (type==OBJ_LABEL || type==OBJ_TEXT)   {
            ret = true;
            break;
         }
      }
      case OBJPROP_CORNER:
      case OBJPROP_XDISTANCE:
      case OBJPROP_YDISTANCE: {
         if (type==OBJ_LABEL) {
            ret = true;
            break;
         }
      }      
      case OBJPROP_LEVELCOLOR:
      case OBJPROP_LEVELSTYLE:
      case OBJPROP_LEVELWIDTH:   {
         switch(type)   {
            case OBJ_FIBO:
            case OBJ_FIBOARC:
            case OBJ_FIBOCHANNEL:
            case OBJ_FIBOFAN:
            case OBJ_FIBOTIMES:  {
               ret = true;
               break;
            }
         }
      }
      case OBJPROP_FIRSTLEVEL+1:
      case OBJPROP_FIRSTLEVEL+2:
      case OBJPROP_FIRSTLEVEL+3:
      case OBJPROP_FIRSTLEVEL+4:
      case OBJPROP_FIRSTLEVEL+5:
      case OBJPROP_FIRSTLEVEL+6:
      case OBJPROP_FIRSTLEVEL+7:
      case OBJPROP_FIRSTLEVEL+8:
      case OBJPROP_FIRSTLEVEL+9:
      case OBJPROP_FIRSTLEVEL+10:
      case OBJPROP_FIRSTLEVEL+11:
      case OBJPROP_FIRSTLEVEL+12:
      case OBJPROP_FIRSTLEVEL+13:
      case OBJPROP_FIRSTLEVEL+14:
      case OBJPROP_FIRSTLEVEL+15:
      case OBJPROP_FIRSTLEVEL+16:
      case OBJPROP_FIRSTLEVEL+17:
      case OBJPROP_FIRSTLEVEL+18:
      case OBJPROP_FIRSTLEVEL+19:
      case OBJPROP_FIRSTLEVEL+20:
      case OBJPROP_FIRSTLEVEL+21:
      case OBJPROP_FIRSTLEVEL+22:
      case OBJPROP_FIRSTLEVEL+23:
      case OBJPROP_FIRSTLEVEL+24:
      case OBJPROP_FIRSTLEVEL+25:
      case OBJPROP_FIRSTLEVEL+26:
      case OBJPROP_FIRSTLEVEL+27:
      case OBJPROP_FIRSTLEVEL+28:
      case OBJPROP_FIRSTLEVEL+29:
      case OBJPROP_FIRSTLEVEL+30:
      case OBJPROP_FIRSTLEVEL+31:
      case OBJPROP_FIBOLEVELS:   {
         if (type==OBJ_FIBO)  {
            ret = true;
            break;
         }
      }
   }   
   return(ret);
}


//hline object functions

bool hlineCreate(string objectName,double objectPrice1,color objectColor=Red,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_HLINE,objectWindow,0,objectPrice1))   {
      if (objectColor!=Red) hlineSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool hlineSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool hlineSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;   
}

double hlineGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//vline object functions

bool vlineCreate(string objectName,datetime objectTime1,color objectColor=Red,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_VLINE,objectWindow,objectTime1,0))   {
      if (objectColor!=Red) vlineSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool vlineSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool vlineSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;   
}

double vlineGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//trendline object functions

bool trendCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,color objectColor=Red,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_TREND,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=Red) trendSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool trendSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return false;
}

bool trendSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return false;
}

double trendGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//angled trendline object functions

bool atrendCreate(string objectName,double objectAngle,datetime objectTime1,double objectPrice1,color objectColor=Red,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_TRENDBYANGLE,objectWindow,objectTime1,objectPrice1))   {
      if (objectColor!=Red) atrendSet(objectName,OBJPROP_COLOR,objectColor);
      ObjectSet(objectName,OBJPROP_ANGLE,objectAngle);
      return(true);
   }
   return(false);
}

bool atrendSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool atrendSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double atrendGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//linear regression object functions

bool lregressionCreate(string objectName,datetime objectTime1,datetime objectTime2,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_REGRESSION,objectWindow,objectTime1,0,objectTime2,0))   {
      if (objectColor!=Blue) lregressionSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool lregressionSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool lregressionSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double lregressionGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//equidistant channel object functions

bool channelCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,datetime objectTime3,double objectPrice3,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_CHANNEL,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2,objectTime3,objectPrice3))   {
      if (objectColor!=Blue) channelSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool channelSet(string objectName,int objectIndex,double objectValue)   {
   if (objectExists(objectName))
      return ObjectSet(objectName,objectIndex,objectValue);
   return(true);   
}

bool channelSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double channelGet(string objectName,int objectIndex)  {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));      
   return(-1);
}

//standard deviation channel object functions

bool schannelCreate(string objectName,datetime objectTime1,datetime objectTime2,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_STDDEVCHANNEL,objectWindow,objectTime1,0,objectTime2,0))   {
      if (objectColor!=Blue) schannelSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool schannelSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return false;
}

bool schannelSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return false;
}

double schannelGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//gann line object functions

bool glineCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectScale=1.0,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_GANNLINE,objectWindow,objectTime1,objectPrice1,objectTime2))   {
      if (objectColor!=Blue) glineSet(objectName,OBJPROP_COLOR,objectColor);
      if (objectScale!=1.0) glineSet(objectName,OBJPROP_SCALE,objectScale);
      return(true);
   }
   return(false);
}

bool glineSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return 0;
}

bool glineSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double glineGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//gann fan object functions

bool gfanCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectScale=1.0,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_GANNFAN,objectWindow,objectTime1,objectPrice1,objectTime2))   {
      if (objectColor!=Blue) gfanSet(objectName,OBJPROP_COLOR,objectColor);
      if (objectScale!=1.0) gfanSet(objectName,OBJPROP_SCALE,objectScale);
      return(true);
   }
   return(false);
}

bool gfanSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool gfanSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double gfanGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}

//gann grid object functions

bool ggridCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectScale=1,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_GANNGRID,objectWindow,objectTime1,objectPrice1,objectTime2))   {
      if (objectColor!=Blue) ggridSet(objectName,OBJPROP_COLOR,objectColor);
      if (objectScale!=1.0) ggridSet(objectName,OBJPROP_SCALE,objectScale);
      return(true);
   }
   return(false);
}

bool ggridSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool ggridSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double ggridGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//fibonacci object functions

bool fiboCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,color objectColor=Yellow,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_FIBO,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=Yellow) fiboSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool fiboSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool fiboSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double fiboGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}

//fibonacci timezone object functions

bool fibotCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,color objectColor=Yellow,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_FIBOTIMES,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=Yellow) fibotSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool fibotSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool fibotSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double fibotGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}

//fibonacci fan object functions

bool fibofCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,color objectColor=Yellow,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_FIBOFAN,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=Yellow) fibofSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool fibofSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return false;
}

bool fibofSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return false;
}

double fibofGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return false;
}

//fibonacci arc object functions

bool fiboaCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,color objectColor=Yellow,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_FIBOARC,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=Yellow) fiboaSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool fiboaSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return false;
}

bool fiboaSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return false;
}

double fiboaGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return false;
}

//fibonacci expansion object functions

bool fiboeCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,datetime objectTime3,double objectPrice3,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_EXPANSION,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2,objectTime3,objectPrice3))   {
      if (objectColor!=Blue) fiboeSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool fiboeSet(string objectName,int objectIndex,double objectValue)   {
   if (objectExists(objectName))
      return ObjectSet(objectName,objectIndex,objectValue);
   return(true);   
}

bool fiboeSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double fiboeGet(string objectName,int objectIndex)  {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));      
   return(-1);
}

//fibonacci channel object functions

bool fibocCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,datetime objectTime3,double objectPrice3,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_FIBOCHANNEL,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2,objectTime3,objectPrice3))   {
      if (objectColor!=Blue) fibocSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool fibocSet(string objectName,int objectIndex,double objectValue)   {
   if (objectExists(objectName))
      return ObjectSet(objectName,objectIndex,objectValue);
   return(true);   
}

bool fibocSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double fibocGet(string objectName,int objectIndex)  {
   if (ObjectFind(objectName)!=-1)   {
      return(ObjectGet(objectName,objectIndex));      
   } 
   return(-1);
}

//rectangle object functions

bool rectCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_RECTANGLE,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=Blue) rectSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool rectSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool rectSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double rectGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}

//triangle object functions

bool triangleCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,datetime objectTime3,double objectPrice3,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_TRIANGLE,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2,objectTime3,objectPrice3))   {
      if (objectColor!=Blue) triangleSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool triangleSet(string objectName,int objectIndex,double objectValue)   {
   if (objectExists(objectName))
      return ObjectSet(objectName,objectIndex,objectValue);
   return(true);   
}

bool triangleSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double triangleGet(string objectName,int objectIndex)  {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));      
   return(-1);
}

//ellipse object functions

bool ellipseCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,double objectScale=1.0,color objectColor=DarkSlateGray,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_ELLIPSE,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=DarkSlateGray) ellipseSet(objectName,OBJPROP_COLOR,objectColor);
      if (objectScale!=1.0) ellipseSet(objectName,OBJPROP_SCALE,objectScale);
      return(true);
   }
   return(false);
}

bool ellipseSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool ellipseSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double ellipseGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}

//andrew's pitchfork object functions

bool pitchforkCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,datetime objectTime3,double objectPrice3,color objectColor=Blue,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_PITCHFORK,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2,objectTime3,objectPrice3))   {
      if (objectColor!=Blue) pitchforkSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool pitchforkSet(string objectName,int objectIndex,double objectValue)   {
   if (objectExists(objectName))
      return ObjectSet(objectName,objectIndex,objectValue);
   return(true);   
}

bool pitchforkSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double pitchforkGet(string objectName,int objectIndex)  {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));      
   return(-1);
}

//cycle lines object functions

bool clineCreate(string objectName,datetime objectTime1,double objectPrice1,datetime objectTime2,double objectPrice2,color objectColor=Red,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_CYCLES,objectWindow,objectTime1,objectPrice1,objectTime2,objectPrice2))   {
      if (objectColor!=Red) clineSet(objectName,OBJPROP_COLOR,objectColor);
      return(true);
   }
   return(false);
}

bool clineSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool clineSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double clineGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}

//text object functions

bool textCreate(string objectName,string objectText,double objectAngle,datetime objectTime1,double objectPrice1,int objectFontsize=10,string objectFont="Arial",color objectColor=Gray,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_TEXT,objectWindow,objectTime1,objectPrice1))   {
      if (objectColor!=Gray) textSet(objectName,OBJPROP_COLOR,objectColor);
      textSetText(objectName,objectText,objectFontsize,objectFont,objectColor);
      return(true);
   }
   return(false);
}

bool textSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool textSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double textGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return 0;
}

//arrow object functions

bool arrowCreate(string objectName,double objectAngle,int objectCode,datetime objectTime1,double objectPrice1,color objectColor=Red,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_ARROW,objectWindow,objectTime1,objectPrice1))   {
      arrowSet(objectName,OBJPROP_COLOR,objectColor);
      arrowSet(objectName,OBJPROP_ARROWCODE,objectCode);
      return(true);
   }
   return(false);
}

bool arrowSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool arrowSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double arrowGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}

//label object functions

bool labelCreate(string objectName,string objectText,double objectAngle,int objectCorner,int objectX,int objectY,int objectFontsize=10,string objectFont="Arial",color objectColor=Gray,int objectWindow=0) {
   if (ObjectCreate(objectName,OBJ_LABEL,objectWindow,0,0))   {
      if (objectColor!=Gray) ObjectSet(objectName,OBJPROP_COLOR,objectColor);
      labelSet(objectName,OBJPROP_CORNER,objectCorner);
      labelSet(objectName,OBJPROP_XDISTANCE,objectX);
      labelSet(objectName,OBJPROP_YDISTANCE,objectY);      
      labelSetText(objectName,objectText,objectFontsize,objectFont,objectColor);
      return(true);
   }
   return(false);
}

bool labelCreateUpdate(string objectName,string objectText,double objectAngle,int objectCorner,int objectX,int objectY,int objectFontsize=10,string objectFont="Arial",color objectColor=Gray,int objectWindow=0) {
   bool res,found = objectExists(objectName);
   if (!found) res = labelCreate(objectName,objectText,objectAngle,objectCorner,objectX,objectY,objectFontsize,objectFont,objectColor,objectWindow);
   if (found)   {
      if (objectColor!=Gray) ObjectSet(objectName,OBJPROP_COLOR,objectColor);
      labelSet(objectName,OBJPROP_CORNER,objectCorner);
      labelSet(objectName,OBJPROP_XDISTANCE,objectX);
      labelSet(objectName,OBJPROP_YDISTANCE,objectY);      
      labelSetText(objectName,objectText,objectFontsize,objectFont,objectColor);
      return(true);
   }
   return(false);
}

bool labelSet(string objectName,int objectIndex,double objectValue) {
   if (objectExists(objectName))
      return(ObjectSet(objectName,objectIndex,objectValue));
   return true;
}

bool labelSetText(string objectName,string objectText,int objectFontsize,string objectFont="Arial",color objectColor=CLR_NONE) {
   if (objectExists(objectName))
      return(ObjectSetText(objectName,objectText,objectFontsize,objectFont,objectColor));
   return true;
}

double labelGet(string objectName,int objectIndex) {
   if (objectExists(objectName))
      return(ObjectGet(objectName,objectIndex));
   return true;
}


