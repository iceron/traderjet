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

#define STEALTH_DISABLED      0
#define STEALTH_AUTOMATIC     1
#define STEALTH_PURE          2

#define MODE_ENTRY            0
#define MODE_STOPLOSS         1
#define MODE_TAKEPROFIT       2

int vstopStopLossMode = STEALTH_AUTOMATIC;
int vstopTakeProfitMode = STEALTH_AUTOMATIC;
color vstopLongStopLossColor = Red;
color vstopLongTakeProfitColor = Green;
color vstopShortStopLossColor = Red;
color vstopShortTakeProfitColor = Green;

string vstopSep = ".";
string vstopStopLossName = ".sl.";
string vstopTakeProfitName = ".tp.";
string vstopStandardName = "stealth";