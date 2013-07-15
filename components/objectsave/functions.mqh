void objectSaveString(string name,string value)  {
   hlineCreate(name,0);
   objectSetText(name,value);
   objectHide(name);
}

void objectLoadString(string name,string& value) {
   value = objectDesc(name);
}

void objectSaveDouble(string name,double value)  {
   hlineCreate(name,value);
   hlineSet(name,OBJPROP_PRICE1,value);
   objectHide(name);
}

void objectLoadDouble(string name,double& value) {
   value = objectGet(name,OBJPROP_PRICE1);
}

void objectSaveInt(string name,int value)  {
   hlineCreate(name,value);
   hlineSet(name,OBJPROP_PRICE1,value);
   objectHide(name);
}

void objectLoadInt(string name,int& value) {
   value = objectGet(name,OBJPROP_PRICE1);
}