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
   if (symbol=="") tickSymbol = Symbol();
   else tickSymbol = symbol;
}

void symbolGet(){
   RefreshRates();   
   tickTime              = MarketInfo(tickSymbol, MODE_TIME);   
   tickPoint             = MarketInfo(tickSymbol, MODE_POINT);
   tickDigits            = MarketInfo(tickSymbol, MODE_DIGITS);
   tickSpread            = MarketInfo(tickSymbol, MODE_SPREAD);   
   tickBid               = NormalizeDouble(MarketInfo(tickSymbol, MODE_BID), tickDigits);
   tickAsk               = NormalizeDouble(MarketInfo(tickSymbol, MODE_ASK), tickDigits);   
   tickStopLevel         = MarketInfo(tickSymbol, MODE_STOPLEVEL);
   tickLotSize           = MarketInfo(tickSymbol, MODE_LOTSIZE);
   tickValue             = MarketInfo(tickSymbol, MODE_TICKVALUE);
   tickSize              = MarketInfo(tickSymbol, MODE_TICKSIZE);
   tickSwapLong          = MarketInfo(tickSymbol, MODE_SWAPLONG);
   tickSwapShort         = MarketInfo(tickSymbol, MODE_SWAPSHORT);
   tickStarting          = MarketInfo(tickSymbol, MODE_STARTING);
   tickTradeAllowed      = MarketInfo(tickSymbol, MODE_TRADEALLOWED);
   tickExpiration        = MarketInfo(tickSymbol, MODE_EXPIRATION);
   tickMinLot            = MarketInfo(tickSymbol, MODE_MINLOT);
   tickLotStep           = MarketInfo(tickSymbol, MODE_LOTSTEP);
   tickMaxLot            = MarketInfo(tickSymbol, MODE_MAXLOT);
   tickSwapType          = MarketInfo(tickSymbol, MODE_SWAPTYPE);
   tickProfitCalcMode    = MarketInfo(tickSymbol, MODE_PROFITCALCMODE);
   tickMarginCalcMode    = MarketInfo(tickSymbol, MODE_MARGINCALCMODE);
   tickMarginMaintenance = MarketInfo(tickSymbol, MODE_MARGINMAINTENANCE);
   tickMarginRequired    = MarketInfo(tickSymbol, MODE_MARGINREQUIRED);
   tickFreezeLevel       = MarketInfo(tickSymbol, MODE_FREEZELEVEL);   
   tickSymbolRaw        = symbolRaw(tickSymbol);  
   tickSymbolPrefix     = symbolPrefix(tickSymbol,tickSymbolRaw);
   tickSymbolSuffix     = symbolSuffix(tickSymbol,tickSymbolRaw);
   serverECNEnabled = serverIsECN();   
   if (serverIsFractional()) serverFractional();
   else serverNoFractional();    
   tickVolumePrecision = serverPrecision(tickMinLot);   
}