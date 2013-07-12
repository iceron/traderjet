void sendAlert(string text="",string subject="") {
   if (AlertSoundOn)
      PlaySound(AlertSound);
   if (AlertEmailOn)
      SendMail(subject,text);   
   if (AlertPopupOn)
      Alert(text);    
   if (AlertPushOn)
      SendNotification(text);     
}