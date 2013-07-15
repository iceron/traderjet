bool globalVariableCheck(string name)  {
   return(GlobalVariableCheck(name));
}

bool globalVariableDel(string name)  {
   return(GlobalVariableDel(name));
}

double globalVariableGet(string name)  {
   return(GlobalVariableGet(name));
}

string globalVariableName(int index)  {
   return(GlobalVariableName(index));
}

datetime globalVariableSetOnCondition(string name,double val,double check) {
   return(GlobalVariableSetOnCondition(name,val,check));
}

int globalVariablesDeleteAll(string prefix="")   {
   return(GlobalVariablesDeleteAll(prefix));
}

int globalVariablesTotal() {
   return(GlobalVariablesTotal());
}