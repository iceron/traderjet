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

double moneyManage(double volume,int mode,double sl,double term1=0,double term2=0,int accountmode=0) {
   if (mode==0) return(volume);
   double capital;
   switch(accountmode)  {
      case 0: {
         capital = accountBalance();
         break;
      }   
      case 1: {
         capital = accountEquity();
         break;
      } 
      case 2: {
         capital = accountFreeMargin();
         break;
      } 
      default: capital = accountBalance();
   }
   switch(mode)  {
      case 1: {
         volume = mm.risk.percent(term1,sl,capital);
         break;
      } 
      case 2: {
         volume = mm.fixed.ratio(term1,term2,capital);
         break;
      } 
      case 3: {
         volume = mm.fixed.money(term1,sl);
         break;
      } 
      case 4: {
         volume = mm.fixed.pip(term1);
         break;
      } 
   }
   return(volume);
}

double moneyRiskPercent(double percent,double sl,double capital)   {
   double risk_capital = capital*percent;
   return(cNormalizeDouble((risk_capital/(sl*tickFractPips))/tickValue,DOUBLE_VOLUME));
}

double moneyFixedRatio(double risk, double growth, double capital) {
   return(cNormalizeDouble((risk/growth)*capital,DOUBLE_VOLUME));
}

double moneyFixedMoney(double risk_capital, double sl) {
   return(cNormalizeDouble((risk_capital/(sl*tickFractPips))/tickValue,DOUBLE_VOLUME));
}

double moneyFixedPip(double risk_capital) {
   return(cNormalizeDouble((risk_capital/tickFractPips)/tickValue,DOUBLE_VOLUME));
}

