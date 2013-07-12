void object.save.string(string name,string value)  {
   hline.create(name,0);
   object.set.text(name,value);
   object.hide(name);
}

void object.load.string(string name,string& value) {
   value = object.desc(name);
}

void object.save.double(string name,double value)  {
   hline.create(name,value);
   hline.set(name,OBJPROP_PRICE1,value);
   object.hide(name);
}

void object.load.double(string name,double& value) {
   value = object.get(name,OBJPROP_PRICE1);
}

void object.save.int(string name,int value)  {
   hline.create(name,value);
   hline.set(name,OBJPROP_PRICE1,value);
   object.hide(name);
}

void object.load.int(string name,int& value) {
   value = object.get(name,OBJPROP_PRICE1);
}