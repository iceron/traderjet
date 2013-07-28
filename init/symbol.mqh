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

void symbolSet(string symbol=""){
   if (symbol=="") tickSymbol = symbol();
   else tickSymbol = symbol;
}

void symbolGet(){
   refreshRates();   
   tickTime              = marketInfo(tickSymbol, MODE_TIME);   
   tickPoint             = marketInfo(tickSymbol, MODE_POINT);
   tickDigits            = marketInfo(tickSymbol, MODE_DIGITS);
   tickSpread            = marketInfo(tickSymbol, MODE_SPREAD);   
   tickBid               = NormalizeDouble(marketInfo(tickSymbol, MODE_BID), tickDigits);
   tickAsk               = NormalizeDouble(marketInfo(tickSymbol, MODE_ASK), tickDigits);   
   tickStopLevel         = marketInfo(tickSymbol, MODE_STOPLEVEL);
   tickLotSize           = marketInfo(tickSymbol, MODE_LOTSIZE);
   tickValue             = marketInfo(tickSymbol, MODE_TICKVALUE);
   tickSize              = marketInfo(tickSymbol, MODE_TICKSIZE);
   tickSwapLong          = marketInfo(tickSymbol, MODE_SWAPLONG);
   tickSwapShort         = marketInfo(tickSymbol, MODE_SWAPSHORT);
   tickStarting          = marketInfo(tickSymbol, MODE_STARTING);
   tickTradeAllowed      = marketInfo(tickSymbol, MODE_TRADEALLOWED);
   tickExpiration        = marketInfo(tickSymbol, MODE_EXPIRATION);
   tickMinLot            = marketInfo(tickSymbol, MODE_MINLOT);
   tickLotStep           = marketInfo(tickSymbol, MODE_LOTSTEP);
   tickMaxLot            = marketInfo(tickSymbol, MODE_MAXLOT);
   tickSwapType          = marketInfo(tickSymbol, MODE_SWAPTYPE);
   tickProfitCalcMode    = marketInfo(tickSymbol, MODE_PROFITCALCMODE);
   tickMarginCalcMode    = marketInfo(tickSymbol, MODE_MARGINCALCMODE);
   tickMarginMaintenance = marketInfo(tickSymbol, MODE_MARGINMAINTENANCE);
   tickMarginRequired    = marketInfo(tickSymbol, MODE_MARGINREQUIRED);
   tickFreezeLevel       = marketInfo(tickSymbol, MODE_FREEZELEVEL);   
   tickSymbolRaw        = symbolRaw(tickSymbol);  
   tickSymbolPrefix     = symbolPrefix(tickSymbol,tickSymbolRaw);
   tickSymbolSuffix     = symbolSuffix(tickSymbol,tickSymbolRaw);
   serverECNEnabled = serverIsECN();   
   if (serverIsFractional()) serverFractional();
   else serverNoFractional();    
   tickVolumePrecision = serverPrecision(tickMinLot);   
}