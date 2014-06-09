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
bool alertSoundOn = false;
bool alertEmailOn = false;
bool alertPopupOn = false;
bool alertPushOn = false;
string alertSound = "alert.wav";

void alertInit()
{
   alertSoundOn = AlertSoundOn;
   alertEmailOn = AlertEmailOn;
   alertPopupOn = AlertPopupOn;
   alertPushOn = AlertPushOn;
   alertSound = AlertSound;
}

void alertSend(int id,string subject="",string text="") 
{      
   if (alertSoundOn)
      playSound();
   if (alertEmailOn)
      sendMail(subject,text);   
   if (alertPopupOn)
      alert(text);    
   if (alertPushOn)
      sendNotification(text);   
}

bool playSound()
{
   bool res;
   res = PlaySound(alertSound);
   if (!res)
      Print("playSound(): sound filename does not exist");
   return(res);
}

bool sendMail(string subject="",string text="")
{
   bool res;
   if (TerminalInfoInteger(TERMINAL_EMAIL_ENABLED))
      res = SendMail(subject,text);
   else Print("sendMail(): not permitted to send emails");
   return(res);
}

void alert(string subject="",string text="")
{
   Alert(StringConcatenate(text," ",subject));
}


bool sendNotification(string text="",string subject="")
{
   bool res;
   if (TerminalInfoInteger(TERMINAL_NOTIFICATIONS_ENABLED))
      res = SendNotification(StringConcatenate(text," ",subject));
   else Print("sendMail(): not permitted to send emails");
   return(res);
}