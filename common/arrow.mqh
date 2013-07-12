color arrowColor(int cmd){
   if (isLong(cmd)) return(serverArrowColorLong);
   else return(serverArrowColorShort);
}