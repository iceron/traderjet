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

#define symfile   "symbols.raw"
#define symname   12
#define symdesc   75
#define symsize   1936
#define symnext   1849

string marketwatchSymbol[];
string marketwatchDesc[];

void marketwatchGetSymbols() {
   int handle = fileOpenHistory(symfile,FILE_BIN|FILE_READ);
   if (handle==-1)   {
      print("FILE: ",symfile," - error opening file ",GetLastError()); 
      return;
   }
   int symbolcount = fileSize(handle)/symsize;
   arrayResizeString(marketwatchSymbol,symbolcount);
   arrayResizeString(marketwatchDesc,symbolcount);
   for (int i=0;i<symbolcount;i++)  {     
      string s = fileReadString(handle,symname);
      string desc = fileReadString(handle,symdesc);
      fileSeek(handle,symnext,SEEK_CUR);
      marketwatchSymbol[i] = s;      
      marketwatchDesc[i] = desc;        
   }   
   fileClose(handle);   
}