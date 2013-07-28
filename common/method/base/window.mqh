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