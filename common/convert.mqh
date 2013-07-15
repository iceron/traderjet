#define MODE_MARKET  0
#define MODE_PENDING 1
#define MODE_STOP    0
#define MODE_LIMIT   1

// str <-> clr
color stringToColor(string str)   {
   //lacks rgb
   str = stringToLower(stringReplace(str," ",""));
   if (str == "")                       return(CLR_NONE);
	if (str == "aliceblue")              return(0xFFF8F0);
	if (str == "antiquewhite")           return(0xD7EBFA);
	if (str == "aqua")                   return(0xFFFF00);
	if (str == "aquamarine")             return(0xD4FF7F);
	if (str == "beige")                  return(0xDCF5F5);
	if (str == "bisque")                 return(0xC4E4FF);
	if (str == "black")                  return(0x000000);
	if (str == "blanchedalmond")         return(0xCDEBFF);
	if (str == "blue")                   return(0xFF0000);
	if (str == "blueviolet")             return(0xE22B8A);
	if (str == "brown")                  return(0x2A2AA5);
	if (str == "burlywood")              return(0x87B8DE);
	if (str == "cadetblue")              return(0xA09E5F);
	if (str == "chartreuse")             return(0x00FF7F);
	if (str == "chocolate")              return(0x1E69D2);
	if (str == "coral")                  return(0x507FFF);
	if (str == "cornflowerblue")         return(0xED9564);
	if (str == "cornsilk")               return(0xDCF8FF);
	if (str == "crimson")                return(0x3C14DC);
	if (str == "darkblue")               return(0x8B0000);
	if (str == "darkgoldenrod")          return(0x0B86B8);
	if (str == "darkgray")               return(0xA9A9A9);
	if (str == "darkgreen")              return(0x006400);
	if (str == "darkkhaki")              return(0x6BB7BD);
	if (str == "darkolivegreen")         return(0x2F6B55);
	if (str == "darkorange")             return(0x008CFF);
	if (str == "darkorchid")             return(0xCC3299);
	if (str == "darksalmon")             return(0x7A96E9);
	if (str == "darkseagreen")           return(0x8BBC8F);
	if (str == "darkslateblue")          return(0x8B3D48);
	if (str == "darkslategray")          return(0x4F4F2F);
	if (str == "darkturquoise")          return(0xD1CE00);
	if (str == "darkviolet")             return(0xD30094);
	if (str == "deeppink")               return(0x9314FF);
	if (str == "deepskyblue")            return(0xFFBF00);
	if (str == "dimgray")                return(0x696969);
	if (str == "dodgerblue")             return(0xFF901E);
	if (str == "firebrick")              return(0x2222B2);
	if (str == "forestgreen")            return(0x228B22);
	if (str == "gainsboro")              return(0xDCDCDC);
	if (str == "gold")                   return(0x00D7FF);
	if (str == "goldenrod")              return(0x20A5DA);
	if (str == "gray")                   return(0x808080);
	if (str == "green")                  return(0x008000);
	if (str == "greenyellow")            return(0x2FFFAD);
	if (str == "honeydew")               return(0xF0FFF0);
	if (str == "hotpink")                return(0xB469FF);
	if (str == "indianred")              return(0x5C5CCD);
	if (str == "indigo")                 return(0x82004B);
	if (str == "ivory")                  return(0xF0FFFF);
	if (str == "khaki")                  return(0x8CE6F0);
	if (str == "lavender")               return(0xFAE6E6);
	if (str == "lavenderblush")          return(0xF5F0FF);
	if (str == "lawngreen")              return(0x00FC7C);
	if (str == "lemonchiffon")           return(0xCDFAFF);
	if (str == "lightblue")              return(0xE6D8AD);
	if (str == "lightcoral")             return(0x8080F0);
	if (str == "lightcyan")              return(0xFFFFE0);
	if (str == "lightgoldenrod")         return(0xD2FAFA);
	if (str == "lightgray")              return(0xD3D3D3);
	if (str == "lightgreen")             return(0x90EE90);
	if (str == "lightpink")              return(0xC1B6FF);
	if (str == "lightsalmon")            return(0x7AA0FF);
	if (str == "lightseagreen")          return(0xAAB220);
	if (str == "lightskyblue")           return(0xFACE87);
	if (str == "lightslategray")         return(0x998877);
	if (str == "lightsteelblue")         return(0xDEC4B0);
	if (str == "lightyellow")            return(0xE0FFFF);
	if (str == "lime")                   return(0x00FF00);
	if (str == "limegreen")              return(0x32CD32);
	if (str == "linen")                  return(0xE6F0FA);
	if (str == "magenta")                return(0xFF00FF);
	if (str == "maroon")                 return(0x000080);
	if (str == "mediumaquamarine")       return(0xAACD66);
	if (str == "mediumblue")             return(0xCD0000);
	if (str == "mediumorchid")           return(0xD355BA);
	if (str == "mediumpurple")           return(0xDB7093);
	if (str == "mediumseagreen")         return(0x71B33C);
	if (str == "mediumslateblue")        return(0xEE687B);
	if (str == "mediumspringgreen")      return(0x9AFA00);
	if (str == "mediumturquoise")        return(0xCCD148);
	if (str == "mediumvioletred")        return(0x8515C7);
	if (str == "midnightblue")           return(0x701919);
	if (str == "mintcream")              return(0xFAFFF5);
	if (str == "mistyrose")              return(0xE1E4FF);
	if (str == "moccasin")               return(0xB5E4FF);
	if (str == "navajowhite")            return(0xADDEFF);
	if (str == "navy")                   return(0x800000);
	if (str == "none")                   return(CLR_NONE);
	if (str == "oldlace")                return(0xE6F5FD);
	if (str == "olive")                  return(0x008080);
	if (str == "olivedrab")              return(0x238E6B);
	if (str == "orange")                 return(0x00A5FF);
	if (str == "orangered")              return(0x0045FF);
	if (str == "orchid")                 return(0xD670DA);
	if (str == "palegoldenrod")          return(0xAAE8EE);
	if (str == "palegreen")              return(0x98FB98);
	if (str == "paleturquoise")          return(0xEEEEAF);
	if (str == "palevioletred")          return(0x9370DB);
	if (str == "papayawhip")             return(0xD5EFFF);
	if (str == "peachpuff")              return(0xB9DAFF);
	if (str == "peru")                   return(0x3F85CD);
	if (str == "pink")                   return(0xCBC0FF);
	if (str == "plum")                   return(0xDDA0DD);
	if (str == "powderblue")             return(0xE6E0B0);
	if (str == "purple")                 return(0x800080);
	if (str == "red")                    return(0x0000FF);
	if (str == "rosybrown")              return(0x8F8FBC);
	if (str == "royalblue")              return(0xE16941);
	if (str == "saddlebrown")            return(0x13458B);
	if (str == "salmon")                 return(0x7280FA);
	if (str == "sandybrown")             return(0x60A4F4);
	if (str == "seagreen")               return(0x578B2E);
	if (str == "seashell")               return(0xEEF5FF);
	if (str == "sienna")                 return(0x2D52A0);
	if (str == "silver")                 return(0xC0C0C0);
	if (str == "skyblue")                return(0xEBCE87);
	if (str == "slateblue")              return(0xCD5A6A);
	if (str == "slategray")              return(0x908070);
	if (str == "snow")                   return(0xFAFAFF);
	if (str == "springgreen")            return(0x7FFF00);
	if (str == "steelblue")              return(0xB48246);
	if (str == "tan")                    return(0x8CB4D2);
	if (str == "teal")                   return(0x808000);
	if (str == "thistle")                return(0xD8BFD8);
	if (str == "tomato")                 return(0x4763FF);
	if (str == "turquoise")              return(0xD0E040);
	if (str == "violet")                 return(0xEE82EE);
	if (str == "wheat")                  return(0xB3DEF5);
	if (str == "white")                  return(0xFFFFFF);
	if (str == "whitesmoke")             return(0xF5F5F5);
	if (str == "yellow")                 return(0x00FFFF);
	if (str == "yellowgreen")            return(0x32CD9A);
	return(CLR_NONE);
}

string colorToString(color clr,bool rgb=false)   {
   if (!rgb)
   {
      if (clr == 0xFFF8F0)   return("AliceBlue");              
      if (clr == 0xD7EBFA)   return("AntiqueWhite");           
      if (clr == 0xFFFF00)   return("Aqua");                   
      if (clr == 0xD4FF7F)   return("Aquamarine");             
      if (clr == 0xDCF5F5)   return("Beige");                  
      if (clr == 0xC4E4FF)   return("Bisque");                 
      if (clr == 0x000000)   return("Black");                  
      if (clr == 0xCDEBFF)   return("BlanchedAlmond");         
      if (clr == 0xFF0000)   return("Blue");                   
      if (clr == 0xE22B8A)   return("BlueViolet");             
      if (clr == 0x2A2AA5)   return("Brown");                  
      if (clr == 0x87B8DE)   return("BurlyWood");              
      if (clr == 0xA09E5F)   return("CadetBlue");              
      if (clr == 0x00FF7F)   return("Chartreuse");             
      if (clr == 0x1E69D2)   return("Chocolate");              
      if (clr == 0x507FFF)   return("Coral");                  
      if (clr == 0xED9564)   return("CornflowerBlue");         
      if (clr == 0xDCF8FF)   return("Cornsilk");               
      if (clr == 0x3C14DC)   return("Crimson");                
      if (clr == 0x8B0000)   return("DarkBlue");               
      if (clr == 0x0B86B8)   return("DarkGoldenrod");          
      if (clr == 0xA9A9A9)   return("DarkGray");               
      if (clr == 0x006400)   return("DarkGreen");              
      if (clr == 0x6BB7BD)   return("DarkKhaki");              
      if (clr == 0x2F6B55)   return("DarkOliveGreen");         
      if (clr == 0x008CFF)   return("DarkOrange");             
      if (clr == 0xCC3299)   return("DarkOrchid");             
      if (clr == 0x7A96E9)   return("DarkSalmon");             
      if (clr == 0x8BBC8F)   return("DarkSeaGreen");           
      if (clr == 0x8B3D48)   return("DarkSlateBlue");          
      if (clr == 0x4F4F2F)   return("DarkSlateGray");          
      if (clr == 0xD1CE00)   return("DarkTurquoise");          
      if (clr == 0xD30094)   return("DarkViolet");             
      if (clr == 0x9314FF)   return("DeepPink");               
      if (clr == 0xFFBF00)   return("DeepSkyBlue");            
      if (clr == 0x696969)   return("DimGray");                
      if (clr == 0xFF901E)   return("DodgerBlue");             
      if (clr == 0x2222B2)   return("FireBrick");              
      if (clr == 0x228B22)   return("ForestGreen");            
      if (clr == 0xDCDCDC)   return("Gainsboro");              
      if (clr == 0x00D7FF)   return("Gold");                   
      if (clr == 0x20A5DA)   return("Goldenrod");              
      if (clr == 0x808080)   return("Gray");                   
      if (clr == 0x008000)   return("Green");                  
      if (clr == 0x2FFFAD)   return("GreenYellow");            
      if (clr == 0xF0FFF0)   return("Honeydew");               
      if (clr == 0xB469FF)   return("HotPink");                
      if (clr == 0x5C5CCD)   return("IndianRed");              
      if (clr == 0x82004B)   return("Indigo");                 
      if (clr == 0xF0FFFF)   return("Ivory");                  
      if (clr == 0x8CE6F0)   return("Khaki");                  
      if (clr == 0xFAE6E6)   return("Lavender");               
      if (clr == 0xF5F0FF)   return("LavenderBlush");          
      if (clr == 0x00FC7C)   return("LawnGreen");              
      if (clr == 0xCDFAFF)   return("LemonChiffon");           
      if (clr == 0xE6D8AD)   return("LightBlue");              
      if (clr == 0x8080F0)   return("LightCoral");             
      if (clr == 0xFFFFE0)   return("LightCyan");              
      if (clr == 0xD2FAFA)   return("LightGoldenrod");         
      if (clr == 0xD3D3D3)   return("LightGray");              
      if (clr == 0x90EE90)   return("LightGreen");             
      if (clr == 0xC1B6FF)   return("LightPink");              
      if (clr == 0x7AA0FF)   return("LightSalmon");            
      if (clr == 0xAAB220)   return("LightSeaGreen");          
      if (clr == 0xFACE87)   return("LightSkyBlue");           
      if (clr == 0x998877)   return("LightSlateGray");         
      if (clr == 0xDEC4B0)   return("LightSteelBlue");         
      if (clr == 0xE0FFFF)   return("LightYellow");            
      if (clr == 0x00FF00)   return("Lime");                   
      if (clr == 0x32CD32)   return("LimeGreen");              
      if (clr == 0xE6F0FA)   return("Linen");                  
      if (clr == 0xFF00FF)   return("Magenta");                
      if (clr == 0x000080)   return("Maroon");                 
      if (clr == 0xAACD66)   return("MediumAquamarine");       
      if (clr == 0xCD0000)   return("MediumBlue");             
      if (clr == 0xD355BA)   return("MediumOrchid");           
      if (clr == 0xDB7093)   return("MediumPurple");           
      if (clr == 0x71B33C)   return("MediumSeaGreen");         
      if (clr == 0xEE687B)   return("MediumSlateBlue");        
      if (clr == 0x9AFA00)   return("MediumSpringGreen");      
      if (clr == 0xCCD148)   return("MediumTurquoise");        
      if (clr == 0x8515C7)   return("MediumVioletRed");        
      if (clr == 0x701919)   return("MidnightBlue");           
      if (clr == 0xFAFFF5)   return("MintCream");              
      if (clr == 0xE1E4FF)   return("MistyRose");              
      if (clr == 0xB5E4FF)   return("Moccasin");               
      if (clr == 0xADDEFF)   return("NavajoWhite");            
      if (clr == 0x800000)   return("Navy");                   
      if (clr == 0xE6F5FD)   return("OldLace");                
      if (clr == 0x008080)   return("Olive");                  
      if (clr == 0x238E6B)   return("OliveDrab");              
      if (clr == 0x00A5FF)   return("Orange");                 
      if (clr == 0x0045FF)   return("OrangeRed");              
      if (clr == 0xD670DA)   return("Orchid");                 
      if (clr == 0xAAE8EE)   return("PaleGoldenrod");          
      if (clr == 0x98FB98)   return("PaleGreen");              
      if (clr == 0xEEEEAF)   return("PaleTurquoise");          
      if (clr == 0x9370DB)   return("PaleVioletRed");          
      if (clr == 0xD5EFFF)   return("PapayaWhip");             
      if (clr == 0xB9DAFF)   return("PeachPuff");              
      if (clr == 0x3F85CD)   return("Peru");                   
      if (clr == 0xCBC0FF)   return("Pink");                   
      if (clr == 0xDDA0DD)   return("Plum");                   
      if (clr == 0xE6E0B0)   return("PowderBlue");             
      if (clr == 0x800080)   return("Purple");                 
      if (clr == 0x0000FF)   return("Red");                    
      if (clr == 0x8F8FBC)   return("RosyBrown");              
      if (clr == 0xE16941)   return("RoyalBlue");              
      if (clr == 0x13458B)   return("SaddleBrown");            
      if (clr == 0x7280FA)   return("Salmon");                 
      if (clr == 0x60A4F4)   return("SandyBrown");             
      if (clr == 0x578B2E)   return("SeaGreen");               
      if (clr == 0xEEF5FF)   return("Seashell");               
      if (clr == 0x2D52A0)   return("Sienna");                 
      if (clr == 0xC0C0C0)   return("Silver");                 
      if (clr == 0xEBCE87)   return("SkyBlue");                
      if (clr == 0xCD5A6A)   return("SlateBlue");              
      if (clr == 0x908070)   return("SlateGray");              
      if (clr == 0xFAFAFF)   return("Snow");                   
      if (clr == 0x7FFF00)   return("SpringGreen");            
      if (clr == 0xB48246)   return("SteelBlue");              
      if (clr == 0x8CB4D2)   return("Tan");                    
      if (clr == 0x808000)   return("Teal");                   
      if (clr == 0xD8BFD8)   return("Thistle");                
      if (clr == 0x4763FF)   return("Tomato");                 
      if (clr == 0xD0E040)   return("Turquoise");              
      if (clr == 0xEE82EE)   return("Violet");                 
      if (clr == 0xB3DEF5)   return("Wheat");                  
      if (clr == 0xFFFFFF)   return("White");                  
      if (clr == 0xF5F5F5)   return("WhiteSmoke");             
      if (clr == 0x00FFFF)   return("Yellow");                 
      if (clr == 0x32CD9A)   return("YellowGreen");            
      if (clr == CLR_NONE)   return("None"); 
   }                     

   int r = (clr>>16) & 0xff;
   int g = (clr>>8) & 0xff;
   int b =  clr & 0xff;
  
   return(StringConcatenate(r,",",g,",",b));
}



// str <-> int
int strToASCII(string str,int pos=0) {
   return(stringGetChar(str,pos));
}

// str <-> char
int stringGetChar(string str,int pos=0) {  
   return(StringGetChar(str,pos));  
}
string stringSetChar(string str,int pos,int code) {  
   return(StringSetChar(str,pos,code));  
}

// cmd <-> str
string cmdToString(int cmd)   {
   switch (cmd)   {
      case 0: return("buy");
      case 1: return("sell");       
      case 2: return("buylimit");
      case 3: return("selllimit");
      case 4: return("buystop");
      case 5: return("sellstop");
   }
   return(NULL);
}



// cmd <-> signal

int cmdToSignal(int cmd) {
   return(cmd+1);
}

int signalToCMD(int signal,int mode=MODE_MARKET,int type=MODE_STOP) {
   int cmd;
   if (signal==CMD_LONG || signal==CMD_SHORT)   {
      if (mode==MODE_MARKET)  {
         if (signal==CMD_LONG) cmd = OP_BUY;
         else if (signal==CMD_SHORT) cmd = OP_SELL;
      }  
      else if (mode==MODE_PENDING)  {
         if (type==MODE_STOP) {
            if (signal==CMD_LONG) cmd = OP_BUYSTOP;
            else if (signal==CMD_SHORT) cmd = OP_SELLSTOP;
         }   
         else if (type==MODE_LIMIT) {
            if (signal==CMD_LONG) cmd = OP_BUYLIMIT;
            else if (signal==CMD_SHORT) cmd = OP_SELLLIMIT;
         }  
      }  
   }
   return(cmd);
}

// cmd <-> cmd

int cmdReverse(int cmd)   {
   switch(cmd)   {
      case OP_BUY: return(OP_SELL);
      case OP_SELL: return(OP_BUY);
      case OP_BUYSTOP: return(OP_SELLSTOP);
      case OP_SELLSTOP: return(OP_BUYSTOP);
      case OP_BUYLIMIT: return(OP_SELLLIMIT);
      case OP_SELLLIMIT: return(OP_BUYLIMIT);
      default:  {
         Print("cmd.reverse: invalid cmd type (",cmd,")");
         return(-1);
      }   
   }
}

// bool <-> str
string boolToString(bool val)  {
   if (val) return("TRUE");
   else return("FALSE");
}

bool stringToBool(string str)  {
   str = stringToUpper(str);
   if (str=="TRUE") return(true);
   else return(false);
}

// str <-> time
void timeExtract(string tm,int& hour,int& min) {
   datetime dt = StrToTime(tm);
   hour = TimeHour(dt);
   min = TimeMinute(dt);
}

int strToTimeFrame(string tm)
{
   tm = stringToUpper(tm);
   if (tm=="M1") return(PERIOD_M1);  
   if (tm=="M5") return(PERIOD_M5);  
   if (tm=="M15") return(PERIOD_M15);  
   if (tm=="M30") return(PERIOD_M30);  
   if (tm=="H1") return(PERIOD_H1);  
   if (tm=="H4") return(PERIOD_H4);  
   if (tm=="D1") return(PERIOD_D1);  
   if (tm=="W1") return(PERIOD_W1);  
   if (tm=="MN1") return(PERIOD_MN1);  
   return(0);
}

string timeframeToString(int tm)
{
   if (tm==PERIOD_M1) return("M1");  
   if (tm==PERIOD_M5) return("M5");  
   if (tm==PERIOD_M15) return("M15");  
   if (tm==PERIOD_M30) return("M30");  
   if (tm==PERIOD_H1) return("H1");  
   if (tm==PERIOD_H4) return("H4");  
   if (tm==PERIOD_D1) return("D1");  
   if (tm==PERIOD_W1) return("W1");  
   if (tm==PERIOD_MN1) return("MN1");  
   return(0);
}

// str <-> number

double stringToDouble(string val)  {
   return(StrToDouble(val));
}

int stringToInteger(string val)  {
   return(StrToInteger(val));
}


// bar <-> bar

int barMatch(string symbol1,int timeframe1,int shift1,string symbol2,int timeframe2)   {
   datetime time1 = iTime(symbol1,timeframe1,shift1);
   return(iBarShift(symbol2,timeframe2,time1));  
}

string priceFormat(double v)  {
   return(doubleToString(v,tickDigits));
}

string volumeFormat(double v) {
   return(doubleToString(v,tickVolumePrecision));
}

string doubleToString(double v,int p=0)   {
   return(DoubleToStr(v,p));
}

string charToString(int code)   {
   return(CharToStr(code));
}

datetime stringToTime(string str) {
   return(StrToTime(str));
}

string timeToString(datetime time,int mode=3)   {
   return(TimeToStr(time,mode));
}