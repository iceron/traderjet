void hideTestIndicators(bool hide=true) {
   HideTestIndicators(hide);
}

int period()   {
   return(Period());
}

bool refreshRates()  {
   return(RefreshRates());
}

string symbol()   {
   return(Symbol());
}

int windowBarsPerChart()   {
   return(WindowBarsPerChart());
}

string windowExpertName()  {
   return(WindowExpertName());
}

int windowFind(string name)  {
   return(WindowFind(name));
}

int windowFirstVisibleBar()   {
   return(WindowFirstVisibleBar());
}

int windowHandle(string symbol,int timeframe)   {
   return(WindowHandle(symbol,timeframe));
}

bool windowIsVisible(int index)  {
   return(WindowIsVisible(index));
}

int windowOnDropped()   {
   return(WindowOnDropped());
}

double windowPriceMax(int index=0) {
   return(WindowPriceMax(index));
}

double windowPriceMin(int index=0) {
   return(WindowPriceMin(index));
}

double windowPriceOnDropped() {
   return(WindowPriceOnDropped());
}

void windowReDraw()  {
   WindowRedraw();
}

bool windowScreenShot(string filename,int x,int y,int start=-1,int scale=-1,int mode=-1) {
   return(WindowScreenShot(filename,x,y,start,scale,mode));
}

datetime windowTimeOnDropped()   {
   return(WindowTimeOnDropped());
}

int windowsTotal()   {
   return(WindowsTotal());
}

int windowXOnDropped()  {
   return(WindowXOnDropped());
}

int windowYOnDropped()  {
   return(WindowYOnDropped());
}