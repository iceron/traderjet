void sendAlert(string text="",string subject="") {
   if (AlertSoundOn)
      playSound(AlertSound);
   if (AlertEmailOn)
      sendMail(subject,text);   
   if (AlertPopupOn)
      alert(text);    
   if (AlertPushOn)
      sendNotification(text);     
}