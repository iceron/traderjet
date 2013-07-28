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

bool objectsDelete(string pref)  {
   int total = objectsTotal();
   for (int i=total-1;i>=0;i--)  {
      string name = objectName(i);
      if (stringFind(name,pref)>=0)
         objectDelete(name);
   }
}

bool objectExistsDeleted(string object.name)  {
   if (objectExists(object.name))
      return(objectDelete(object.name));
   return(false);   
}

bool objectExists(string object.name) {
   if (objectFind(object.name)>=0) return(true);
   return(false);
}

bool objectHide(string object.name)   {
   objectSet(object.name,OBJPROP_TIMEFRAMES,-1);
}

bool objectHidden(string object.name) {
   int val = objectGet(object.name,OBJPROP_TIMEFRAMES);
   if (val==-1) return(true);
   return(false);
}

bool objectClone(string n,string o,bool create=true) {
   int type = objectType(o);
   bool created;
   if (create) created = objectCreate(n,type);
   if (!created) return(false);
   
   if (objectUseProp(type,OBJPROP_TIME1))   {
      datetime time1 = objectGet(o,OBJPROP_TIME1);
      objectSet(n,OBJPROP_TIME1,time1);
   }   
   
   if (objectUseProp(type,OBJPROP_TIME2))   {
      datetime time2 = objectGet(o,OBJPROP_TIME2);
      objectSet(n,OBJPROP_TIME2,time2);
   }
   
   if (objectUseProp(type,OBJPROP_TIME3))   {
      datetime time3 = objectGet(o,OBJPROP_TIME3);
      objectSet(n,OBJPROP_TIME3,time3);
   }
   
   if (objectUseProp(type,OBJPROP_PRICE1))   {
      double price1 = objectGet(o,OBJPROP_PRICE1);
      objectSet(n,OBJPROP_PRICE1,price1);
   }
   
   if (objectUseProp(type,OBJPROP_PRICE2))   {
      double price2 = objectGet(o,OBJPROP_PRICE2);
      objectSet(n,OBJPROP_PRICE2,price2);
   }
   if (objectUseProp(type,OBJPROP_PRICE3))   {
      double price3 = objectGet(o,OBJPROP_PRICE3);
      objectSet(n,OBJPROP_PRICE3,price3);
   }

   if (objectUseProp(type,OBJPROP_SCALE))   {
      double scale = objectGet(o,OBJPROP_SCALE);
      objectSet(n,OBJPROP_SCALE,scale);
   }   
   
   if (objectUseProp(type,OBJPROP_COLOR))   {
      color clr = objectGet(o,OBJPROP_COLOR);
      objectSet(n,OBJPROP_COLOR,clr);
   }   
   
   if (objectUseProp(type,OBJPROP_STYLE))   {
      int style = objectGet(o,OBJPROP_STYLE);
      objectSet(n,OBJPROP_STYLE,style);
   }   
   
   if (objectUseProp(type,OBJPROP_WIDTH))   {
      int width = objectGet(o,OBJPROP_WIDTH);
      objectSet(n,OBJPROP_WIDTH,width);
   } 
   
   if (objectUseProp(type,OBJPROP_BACK))   {
      bool back = objectGet(o,OBJPROP_BACK);
      objectSet(n,OBJPROP_BACK,back);
   } 
   
   if (objectUseProp(type,OBJPROP_RAY))   {
      bool ray = objectGet(o,OBJPROP_RAY);
      objectSet(n,OBJPROP_RAY,ray);
   } 
   
   if (objectUseProp(type,OBJPROP_ELLIPSE))   {
      bool ellipse = objectGet(o,OBJPROP_ELLIPSE);
      objectSet(n,OBJPROP_ELLIPSE,ellipse);
   } 
   
   if (objectUseProp(type,OBJPROP_ANGLE))   {
      double angle = objectGet(o,OBJPROP_ANGLE);
      objectSet(n,OBJPROP_ANGLE,angle);
   } 
   
   if (objectUseProp(type,OBJPROP_ARROWCODE))   {
      int arrowcode = objectGet(o,OBJPROP_ARROWCODE);
      objectSet(n,OBJPROP_ARROWCODE,arrowcode);
   } 
   
   if (objectUseProp(type,OBJPROP_TIMEFRAMES))   {
      int timeframes = objectGet(o,OBJPROP_TIMEFRAMES);
      objectSet(n,OBJPROP_TIMEFRAMES,timeframes);
   } 
   
   if (objectUseProp(type,OBJPROP_DEVIATION))   {
      double deviation = objectGet(o,OBJPROP_DEVIATION);
      objectSet(n,OBJPROP_DEVIATION,deviation);
   } 
   
   if (objectUseProp(type,OBJPROP_FONTSIZE))   {
      int fontize = objectGet(o,OBJPROP_FONTSIZE);
      objectSet(n,OBJPROP_FONTSIZE,fontize);
   } 
   
   if (objectUseProp(type,OBJPROP_CORNER))   {
      int corner = objectGet(o,OBJPROP_CORNER);
      objectSet(n,OBJPROP_CORNER,corner);
   } 
   
   if (objectUseProp(type,OBJPROP_XDISTANCE))   {
      int x = objectGet(o,OBJPROP_XDISTANCE);
      objectSet(n,OBJPROP_XDISTANCE,x);
   }   
   
   if (objectUseProp(type,OBJPROP_YDISTANCE))   {
      int y = objectGet(o,OBJPROP_YDISTANCE);
      objectSet(n,OBJPROP_YDISTANCE,y);
   }   
   
   if (objectUseProp(type,OBJPROP_FIBOLEVELS))   {
      int fibolevels = objectGet(o,OBJPROP_FIBOLEVELS);
      objectSet(n,OBJPROP_FIBOLEVELS,fibolevels);
   }   
   
   if (objectUseProp(type,OBJPROP_LEVELCOLOR))   {
      color levelclr = objectGet(o,OBJPROP_LEVELCOLOR);
      objectSet(n,OBJPROP_LEVELCOLOR,levelclr);
   } 
   
   if (objectUseProp(type,OBJPROP_LEVELSTYLE))   {
      int levelstyle = objectGet(o,OBJPROP_LEVELSTYLE);
      objectSet(n,OBJPROP_LEVELSTYLE,levelstyle);
   }   
   
   if (objectUseProp(type,OBJPROP_LEVELWIDTH))   {
      int levelwidth = objectGet(o,OBJPROP_LEVELWIDTH);
      objectSet(n,OBJPROP_LEVELWIDTH,levelwidth);
   }  
   
   if (type==OBJ_FIBO)   {
      for (int i=0;i<=31;i++) {
         double val = objectGet(o,OBJPROP_FIRSTLEVEL+i);
         objectSet(n,OBJPROP_FIRSTLEVEL+i,val);
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

bool hlineCreate(string object.name,double object.price1,color object.color=Red,int object.window=0) {
   if (objectCreate(object.name,OBJ_HLINE,object.window,0,object.price1))   {
      if (object.color!=Red) hlineSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool hlineSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool hlineSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double hlineGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//vline object functions

bool vlineCreate(string object.name,datetime object.time1,color object.color=Red,int object.window=0) {
   if (objectCreate(object.name,OBJ_VLINE,object.window,object.time1))   {
      if (object.color!=Red) vlineSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool vlineSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool vlineSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double vlineGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//trendline object functions

bool trendCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,color object.color=Red,int object.window=0) {
   if (objectCreate(object.name,OBJ_TREND,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=Red) trendSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool trendSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool trendSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double trendGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//angled trendline object functions

bool atrendCreate(string object.name,double object.angle,datetime object.time1,double object.price1,color object.color=Red,int object.window=0) {
   if (objectCreate(object.name,OBJ_TRENDBYANGLE,object.window,object.time1,object.price1))   {
      if (object.color!=Red) atrendSet(object.name,OBJPROP_COLOR,object.color);
      objectSet(object.name,OBJPROP_ANGLE,object.angle);
      return(true);
   }
   return(false);
}

bool atrendSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool atrendSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double atrendGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//linear regression object functions

bool lregressionCreate(string object.name,datetime object.time1,datetime object.time2,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_REGRESSION,object.window,object.time1,0,object.time2,0))   {
      if (object.color!=Blue) lregressionSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool lregressionSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool lregressionSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double lregressionGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//equidistant channel object functions

bool channelCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,datetime object.time3,double object.price3,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_CHANNEL,object.window,object.time1,object.price1,object.time2,object.price2,object.time3,object.price3))   {
      if (object.color!=Blue) channelSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool channelSet(string object.name,int object.index,double object.value)   {
   bool res;
   if (objectFind(object.name)!=-1) {
      res = objectSet(object.name,object.index,object.value);
   }
   return(res);   
}

bool channelSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double channelGet(string object.name,int object.index)  {
   if (objectFind(object.name)!=-1)   {
      return(objectGet(object.name,object.index));      
   } 
   return(-1);
}

//standard deviation channel object functions

bool schannelCreate(string object.name,datetime object.time1,datetime object.time2,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_STDDEVCHANNEL,object.window,object.time1,0,object.time2,0))   {
      if (object.color!=Blue) schannelSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool schannelSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool schannelSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double schannelGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//gann line object functions

bool glineCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.scale=1.0,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_GANNLINE,object.window,object.time1,object.price1,object.time2))   {
      if (object.color!=Blue) glineSet(object.name,OBJPROP_COLOR,object.color);
      if (object.scale!=1.0) glineSet(object.name,OBJPROP_SCALE,object.scale);
      return(true);
   }
   return(false);
}

bool glineSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool glineSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double glineGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//gann fan object functions

bool gfanCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.scale=1.0,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_GANNFAN,object.window,object.time1,object.price1,object.time2))   {
      if (object.color!=Blue) gfanSet(object.name,OBJPROP_COLOR,object.color);
      if (object.scale!=1.0) gfanSet(object.name,OBJPROP_SCALE,object.scale);
      return(true);
   }
   return(false);
}

bool gfanSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool gfanSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double gfanGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//gann grid object functions

bool ggridCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.scale=1,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_GANNGRID,object.window,object.time1,object.price1,object.time2))   {
      if (object.color!=Blue) ggridSet(object.name,OBJPROP_COLOR,object.color);
      if (object.scale!=1.0) ggridSet(object.name,OBJPROP_SCALE,object.scale);
      return(true);
   }
   return(false);
}

bool ggridSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool ggridSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double ggridGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//fibonacci object functions

bool fiboCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,color object.color=Yellow,int object.window=0) {
   if (objectCreate(object.name,OBJ_FIBO,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=Yellow) fiboSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool fiboSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool fiboSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double fiboGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//fibonacci timezone object functions

bool fibotCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,color object.color=Yellow,int object.window=0) {
   if (objectCreate(object.name,OBJ_FIBOTIMES,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=Yellow) fibotSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool fibotSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool fibotSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double fibotGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//fibonacci fan object functions

bool fibofCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,color object.color=Yellow,int object.window=0) {
   if (objectCreate(object.name,OBJ_FIBOFAN,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=Yellow) fibofSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool fibofSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool fibofSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double fibofGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//fibonacci arc object functions

bool fiboaCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,color object.color=Yellow,int object.window=0) {
   if (objectCreate(object.name,OBJ_FIBOARC,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=Yellow) fiboaSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool fiboaSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool fiboaSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double fiboaGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//fibonacci expansion object functions

bool fiboeCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,datetime object.time3,double object.price3,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_EXPANSION,object.window,object.time1,object.price1,object.time2,object.price2,object.time3,object.price3))   {
      if (object.color!=Blue) fiboeSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool fiboeSet(string object.name,int object.index,double object.value)   {
   bool res;
   if (objectFind(object.name)!=-1) {
      res = objectSet(object.name,object.index,object.value);
   }
   return(res);   
}

bool fiboeSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double fiboeGet(string object.name,int object.index)  {
   if (objectFind(object.name)!=-1)   {
      return(objectGet(object.name,object.index));      
   } 
   return(-1);
}

//fibonacci channel object functions

bool fibocCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,datetime object.time3,double object.price3,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_FIBOCHANNEL,object.window,object.time1,object.price1,object.time2,object.price2,object.time3,object.price3))   {
      if (object.color!=Blue) fibocSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool fibocSet(string object.name,int object.index,double object.value)   {
   bool res;
   if (objectFind(object.name)!=-1) {
      res = objectSet(object.name,object.index,object.value);
   }
   return(res);   
}

bool fibocSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double fibocGet(string object.name,int object.index)  {
   if (objectFind(object.name)!=-1)   {
      return(objectGet(object.name,object.index));      
   } 
   return(-1);
}

//rectangle object functions

bool rectCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_RECTANGLE,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=Blue) rectSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool rectSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool rectSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double rectGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//triangle object functions

bool triangleCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,datetime object.time3,double object.price3,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_TRIANGLE,object.window,object.time1,object.price1,object.time2,object.price2,object.time3,object.price3))   {
      if (object.color!=Blue) triangleSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool triangleSet(string object.name,int object.index,double object.value)   {
   bool res;
   if (objectFind(object.name)!=-1) {
      res = objectSet(object.name,object.index,object.value);
   }
   return(res);   
}

bool triangleSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double triangleGet(string object.name,int object.index)  {
   if (objectFind(object.name)!=-1)   {
      return(objectGet(object.name,object.index));      
   } 
   return(-1);
}

//ellipse object functions

bool ellipseCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,double object.scale=1.0,color object.color=DarkSlateGray,int object.window=0) {
   if (objectCreate(object.name,OBJ_ELLIPSE,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=DarkSlateGray) ellipseSet(object.name,OBJPROP_COLOR,object.color);
      if (object.scale!=1.0) ellipseSet(object.name,OBJPROP_SCALE,object.scale);
      return(true);
   }
   return(false);
}

bool ellipseSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool ellipseSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double ellipseGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//andrew's pitchfork object functions

bool pitchforkCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,datetime object.time3,double object.price3,color object.color=Blue,int object.window=0) {
   if (objectCreate(object.name,OBJ_PITCHFORK,object.window,object.time1,object.price1,object.time2,object.price2,object.time3,object.price3))   {
      if (object.color!=Blue) pitchforkSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool pitchforkSet(string object.name,int object.index,double object.value)   {
   bool res;
   if (objectFind(object.name)!=-1) {
      res = objectSet(object.name,object.index,object.value);
   }
   return(res);   
}

bool pitchforkSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double pitchforkGet(string object.name,int object.index)  {
   if (objectFind(object.name)!=-1)   {
      return(objectGet(object.name,object.index));      
   } 
   return(-1);
}

//cycle lines object functions

bool clineCreate(string object.name,datetime object.time1,double object.price1,datetime object.time2,double object.price2,color object.color=Red,int object.window=0) {
   if (objectCreate(object.name,OBJ_CYCLES,object.window,object.time1,object.price1,object.time2,object.price2))   {
      if (object.color!=Red) clineSet(object.name,OBJPROP_COLOR,object.color);
      return(true);
   }
   return(false);
}

bool clineSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool clineSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double clineGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//text object functions

bool textCreate(string object.name,string objectText,double object.angle,datetime object.time1,double object.price1,int object.fontsize=10,string object.font="Arial",color object.color=Gray,int object.window=0) {
   if (objectCreate(object.name,OBJ_TEXT,object.window,object.time1,object.price1))   {
      if (object.color!=Gray) textSet(object.name,OBJPROP_COLOR,object.color);
      textSetText(object.name,objectText,object.fontsize,object.font,object.color);
      return(true);
   }
   return(false);
}

bool textSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool textSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double textGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//arrow object functions

bool arrowCreate(string object.name,double object.angle,int object.code,datetime object.time1,double object.price1,color object.color=Red,int object.window=0) {
   if (objectCreate(object.name,OBJ_ARROW,object.window,object.time1,object.price1))   {
      arrowSet(object.name,OBJPROP_COLOR,object.color);
      arrowSet(object.name,OBJPROP_ARROWCODE,object.code);
      return(true);
   }
   return(false);
}

bool arrowSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool arrowSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double arrowGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}

//label object functions

bool labelCreate(string object.name,string objectText,double object.angle,int object.corner,int object.x,int object.y,int object.fontsize=10,string object.font="Arial",color object.color=Gray,int object.window=0) {
   if (objectCreate(object.name,OBJ_LABEL,object.window))   {
      if (object.color!=Gray) objectSet(object.name,OBJPROP_COLOR,object.color);
      labelSet(object.name,OBJPROP_CORNER,object.corner);
      labelSet(object.name,OBJPROP_XDISTANCE,object.x);
      labelSet(object.name,OBJPROP_YDISTANCE,object.y);      
      labelSetText(object.name,objectText,object.fontsize,object.font,object.color);
      return(true);
   }
   return(false);
}

bool labelCreateUpdate(string object.name,string objectText,double object.angle,int object.corner,int object.x,int object.y,int object.fontsize=10,string object.font="Arial",color object.color=Gray,int object.window=0) {
   bool res,found = objectExists(object.name);
   if (!found) res = labelCreate(object.name,objectText,object.angle,object.corner,object.x,object.y,object.fontsize,object.font,object.color,object.window);
   if (found)   {
      if (object.color!=Gray) objectSet(object.name,OBJPROP_COLOR,object.color);
      labelSet(object.name,OBJPROP_CORNER,object.corner);
      labelSet(object.name,OBJPROP_XDISTANCE,object.x);
      labelSet(object.name,OBJPROP_YDISTANCE,object.y);      
      labelSetText(object.name,objectText,object.fontsize,object.font,object.color);
      return(true);
   }
   return(false);
}

bool labelSet(string object.name,int object.index,double object.value) {
   return(objectSet(object.name,object.index,object.value));
}

bool labelSetText(string object.name,string objectText,int object.fontsize,string object.font="Arial",color object.color=CLR_NONE) {
   return(objectSetText(object.name,objectText,object.fontsize,object.font,object.color));
}

double labelGet(string object.name,int object.index) {
   return(objectGet(object.name,object.index));
}


