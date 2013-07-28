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
//constants
#include <traderjet\const\error.mqh>
#include <traderjet\const\order.mqh>
#include <traderjet\const\math.mqh>

//global variables
#include <traderjet\var\server.mqh>
#include <traderjet\var\symbol.mqh>
#include <traderjet\var\order.mqh>
#include <traderjet\var\error.mqh>

//symbol initialization functions
#include <traderjet\init\symbol.mqh>

//base functions
#include <traderjet\common\method\base\account.mqh>
#include <traderjet\common\method\base\array.mqh>
#include <traderjet\common\method\base\checkup.mqh>
#include <traderjet\common\method\base\common.mqh>
#include <traderjet\common\method\base\convert.mqh>
#include <traderjet\common\method\base\file.mqh>
#include <traderjet\common\method\base\global.mqh>
#include <traderjet\common\method\base\math.mqh>
#include <traderjet\common\method\base\object.mqh>
#include <traderjet\common\method\base\string.mqh>
#include <traderjet\common\method\base\terminal.mqh>
#include <traderjet\common\method\base\time.mqh>
#include <traderjet\common\method\base\timeseries.mqh>
#include <traderjet\common\method\base\trade.mqh>
#include <traderjet\common\method\base\window.mqh>

//extended functions

#include <traderjet\common\method\extend\array.mqh>
#include <traderjet\common\method\extend\common.mqh>
#include <traderjet\common\method\extend\convert.mqh>
#include <traderjet\common\method\extend\error.mqh>
#include <traderjet\common\method\extend\loop.mqh>
#include <traderjet\common\method\extend\math.mqh>
#include <traderjet\common\method\extend\object.mqh>
#include <traderjet\common\method\extend\order.mqh>
#include <traderjet\common\method\extend\server.mqh>
#include <traderjet\common\method\extend\string.mqh>
#include <traderjet\common\method\extend\symbol.mqh>

#include <traderjet\common\method\extend\timeseries.mqh>

//optional extended functions
#include <traderjet\common\method\extend\account.mqh>
#include <traderjet\common\method\extend\checkup.mqh>
#include <traderjet\common\method\extend\file.mqh>
#include <traderjet\common\method\extend\global.mqh>
#include <traderjet\common\method\extend\print.mqh>
#include <traderjet\common\method\extend\terminal.mqh>
#include <traderjet\common\method\extend\time.mqh>
#include <traderjet\common\method\extend\trade.mqh>
#include <traderjet\common\method\extend\window.mqh>

//components
#include <traderjet\component\traderjet\methods.mqh>

//core functions
#include <traderjet\common\trade\open.mqh>
#include <traderjet\common\trade\modify.mqh>
#include <traderjet\common\trade\close.mqh>
#include <traderjet\common\trade\events.mqh>


