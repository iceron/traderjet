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

string symbolRaw(string symbol) {
   return(stringExtractNoLower(symbol));
}
string symbolPrefix(string symbol,string raw) {
   int pos = stringFind(symbol,raw);
   if (pos==0) return("");
   return(stringSub(symbol,0,pos-1));
}
string symbolSuffix(string symbol,string raw) {
   int pos = stringFind(symbol,raw);
   int len = stringLen(raw);
   int slen = stringLen(symbol);
   if (pos+len==slen) return("");
   return(stringSub(symbol,0,pos+len+1));
}