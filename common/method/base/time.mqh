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

int day()   {
   return(Day());
}

int dayOfWeek()   {
   return(DayOfWeek());
}

int dayOfYear()   {
   return(DayOfYear());
}

int hour()   {
   return(Hour());
}

int minute()   {
   return(Minute());
}

int month()   {
   return(Month());
}

int seconds()   {
   return(Seconds());
}

datetime timeCurrent()  {
   return(TimeCurrent());
}

int timeDay(datetime date) {
   return(TimeDay(date));
}

int timeDayOfWeek(datetime date) {
   return(TimeDayOfWeek(date));
}

int timeDayOfYear(datetime date) {
   return(TimeDayOfYear(date));
}

int timeHour(datetime date) {
   return(TimeHour(date));
}

int timeLocal() {
   return(TimeLocal());
}

int timeMinute(datetime date) {
   return(TimeMinute(date));
}

int timeMonth(datetime date) {
   return(TimeMonth(date));
}

int timeSeconds(datetime date) {
   return(TimeSeconds(date));
}

int timeYear(datetime date) {
   return(TimeYear(date));
}

int year() {
   return(Year());
}